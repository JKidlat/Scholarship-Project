/**
 * @file storage.js
 * @description Supabase Storage management for scholarship provider logos and student avatars.
 *
 * Responsibilities:
 * - MIME-type and file size validation (PNG, JPEG, WebP, SVG under 5MB)
 * - Uploads logos to 'scholarship-logos' public storage bucket via backend API (or direct Supabase client)
 * - Returns authentic public URLs from Supabase Storage
 * - Deletion of previous/outdated logos to prevent storage bloat
 * - Never returns fake base64 data URLs — fails loudly with descriptive errors if upload cannot be completed
 */

import { supabase, isSupabaseConfigured } from './supabase.js';

export const LOGO_BUCKET = 'scholarship-logos';
export const AVATAR_BUCKET = 'avatars';
export const MAX_FILE_SIZE_BYTES = 5 * 1024 * 1024; // 5 MB

export const ALLOWED_MIME_TYPES = [
  'image/png',
  'image/jpeg',
  'image/jpg',
  'image/webp',
  'image/svg+xml',
];

export const ALLOWED_AVATAR_MIME_TYPES = [
  'image/png',
  'image/jpeg',
  'image/jpg',
  'image/webp',
];

/**
 * Resolve the backend API base URL
 */
export function getApiBaseUrl() {
  const envUrl = import.meta?.env?.VITE_API_URL;
  if (envUrl && typeof envUrl === 'string' && envUrl.trim()) {
    return envUrl.trim().replace(/\/+$/, '');
  }
  // If running locally in browser and no VITE_API_URL is set, default to local backend port 5000
  if (typeof window !== 'undefined' && (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1')) {
    return 'http://localhost:5000';
  }
  return '';
}

/**
 * Validate a logo image file before upload
 * @param {File} file 
 * @returns {{ valid: boolean, error: string | null }}
 */
export function validateLogoFile(file) {
  if (!file) {
    return { valid: false, error: 'No image file selected.' };
  }

  if (!ALLOWED_MIME_TYPES.includes(file.type)) {
    return {
      valid: false,
      error: `Unsupported image format (${file.type || 'unknown'}). Please upload a PNG, JPG, JPEG, WebP, or SVG logo.`,
    };
  }

  if (file.size > MAX_FILE_SIZE_BYTES) {
    const sizeMb = (file.size / (1024 * 1024)).toFixed(2);
    return {
      valid: false,
      error: `File size is ${sizeMb} MB. Please upload a logo smaller than 5 MB.`,
    };
  }

  return { valid: true, error: null };
}

/**
 * Upload a scholarship logo to Supabase Storage.
 *
 * Primary route: Sends file to backend POST /api/upload/logo which uploads
 * to 'scholarship-logos' bucket using the service role key and returns the public URL.
 *
 * Fallback route: If backend is unreachable but frontend Supabase client is configured,
 * uploads directly via client SDK.
 *
 * NEVER falls back to base64 data URLs.
 *
 * @param {File} file - Logo image file
 * @param {string | null} previousStoragePath - Path of previous logo to clean up
 * @param {string | null} scholarshipId - Optional scholarship ID or slug to update in DB
 * @param {string} providerName - Optional provider name for alt text
 * @returns {Promise<{ url: string, storagePath: string }>}
 */
export async function uploadScholarshipLogo(
  file,
  previousStoragePath = null,
  scholarshipId = null,
  providerName = ''
) {
  const validation = validateLogoFile(file);
  if (!validation.valid) {
    throw new Error(validation.error);
  }

  const apiBase = getApiBaseUrl();

  let lastError = null;

  // 1. Primary Strategy: Upload via Node.js backend
  if (apiBase) {
    try {
      const formData = new FormData();
      formData.append('logo', file);
      if (scholarshipId) formData.append('scholarshipId', scholarshipId);
      if (previousStoragePath) formData.append('previousStoragePath', previousStoragePath);
      if (providerName) formData.append('providerName', providerName);

      const response = await fetch(`${apiBase}/api/upload/logo`, {
        method: 'POST',
        body: formData,
      });

      const resData = await response.json().catch(() => ({}));

      if (response.ok && resData.success && resData.url) {
        return {
          url: resData.url,
          storagePath: resData.storagePath,
        };
      }

      // If backend returned a clear error message, use it
      if (resData.message) {
        throw new Error(`Backend upload failed: ${resData.message}`);
      }
    } catch (apiErr) {
      lastError = apiErr;
      // If error was explicitly thrown above, rethrow
      if (apiErr.message && apiErr.message.startsWith('Backend upload failed:')) {
        throw apiErr;
      }
      console.warn('Backend upload failed or unreachable, attempting direct Supabase storage upload:', apiErr.message);
    }
  }

  // 2. Secondary Strategy: Direct client-side Supabase Storage upload
  if (isSupabaseConfigured()) {
    const cleanName = file.name
      .toLowerCase()
      .replace(/[^a-z0-9.]/g, '-')
      .replace(/-+/g, '-');
    const uniqueId = Math.random().toString(36).substring(2, 8);
    const storagePath = `logos/${Date.now()}_${uniqueId}_${cleanName}`;

    try {
      const { data, error } = await supabase.storage
        .from(LOGO_BUCKET)
        .upload(storagePath, file, {
          cacheControl: '3600',
          upsert: true,
          contentType: file.type,
        });

      if (!error && data) {
        const { data: urlData } = supabase.storage
          .from(LOGO_BUCKET)
          .getPublicUrl(storagePath);

        if (urlData?.publicUrl) {
          // Clean up previous logo if applicable
          if (previousStoragePath && previousStoragePath !== storagePath && !previousStoragePath.startsWith('local_')) {
            supabase.storage.from(LOGO_BUCKET).remove([previousStoragePath]).catch(() => {});
          }

          return {
            url: urlData.publicUrl,
            storagePath,
          };
        }
      }

      if (error) {
        throw new Error(`Supabase Storage rejected upload: ${error.message}`);
      }
    } catch (supaErr) {
      lastError = supaErr;
      throw new Error(`Direct storage upload failed: ${supaErr.message}`);
    }
  }

  // 3. Neither path succeeded
  throw new Error(
    lastError ? lastError.message : 'Unable to upload logo: Please ensure the backend is running or Supabase environment variables are configured.'
  );
}

/**
 * Delete a logo from Supabase Storage
 * @param {string} storagePath 
 * @param {string | null} scholarshipId
 */
export async function deleteScholarshipLogo(storagePath, scholarshipId = null) {
  if (!storagePath || storagePath.startsWith('local_')) return;

  const apiBase = getApiBaseUrl();

  // Try backend first
  if (apiBase) {
    try {
      const res = await fetch(`${apiBase}/api/upload/logo`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ storagePath, scholarshipId }),
      });
      if (res.ok) return;
    } catch (e) {
      console.warn('Backend logo deletion warning:', e.message);
    }
  }

  // Fallback to direct client call
  if (isSupabaseConfigured()) {
    try {
      await supabase.storage.from(LOGO_BUCKET).remove([storagePath]);
    } catch (e) {
      console.warn('Could not delete logo from storage:', e.message);
    }
  }
}

/**
 * Validate an avatar image file before upload
 * @param {File} file 
 * @returns {{ valid: boolean, error: string | null }}
 */
export function validateAvatarFile(file) {
  if (!file) {
    return { valid: false, error: 'No image file selected.' };
  }

  if (!ALLOWED_AVATAR_MIME_TYPES.includes(file.type)) {
    return {
      valid: false,
      error: `Unsupported image format (${file.type || 'unknown'}). Please upload a JPG, JPEG, PNG, or WebP image.`,
    };
  }

  if (file.size > MAX_FILE_SIZE_BYTES) {
    const sizeMb = (file.size / (1024 * 1024)).toFixed(2);
    return {
      valid: false,
      error: `Image size is ${sizeMb} MB. Please upload an image under 5 MB.`,
    };
  }

  return { valid: true, error: null };
}

/**
 * Upload a student profile avatar to Supabase Storage
 * @param {File} file
 * @param {string} userId
 * @param {string | null} previousStoragePath
 * @returns {Promise<{ url: string, storagePath: string }>}
 */
export async function uploadUserAvatar(file, userId = 'user', previousStoragePath = null) {
  const validation = validateAvatarFile(file);
  if (!validation.valid) {
    throw new Error(validation.error);
  }

  const cleanName = file.name
    .toLowerCase()
    .replace(/[^a-z0-9.]/g, '-')
    .replace(/-+/g, '-');
  const uniqueId = Math.random().toString(36).substring(2, 8);
  const storagePath = `${userId}/${Date.now()}_${uniqueId}_${cleanName}`;

  if (isSupabaseConfigured()) {
    try {
      const { data, error } = await supabase.storage
        .from(AVATAR_BUCKET)
        .upload(storagePath, file, {
          cacheControl: '3600',
          upsert: true,
          contentType: file.type,
        });

      if (!error && data) {
        const { data: urlData } = supabase.storage
          .from(AVATAR_BUCKET)
          .getPublicUrl(storagePath);

        if (previousStoragePath) {
          deleteUserAvatar(previousStoragePath).catch(() => {});
        }

        return {
          url: urlData.publicUrl,
          storagePath,
        };
      }
      if (error) {
        throw new Error(`Avatar storage upload error: ${error.message}`);
      }
    } catch (err) {
      throw err;
    }
  }

  throw new Error('Supabase Storage is not configured for avatar uploads.');
}

/**
 * Delete a student avatar from Supabase Storage
 * @param {string} storagePath
 */
export async function deleteUserAvatar(storagePath) {
  if (!storagePath || storagePath.startsWith('local_')) return;
  try {
    if (isSupabaseConfigured()) {
      await supabase.storage.from(AVATAR_BUCKET).remove([storagePath]);
    }
  } catch (e) {
    console.warn('Could not delete avatar from storage:', e.message);
  }
}
