/**
 * @file storage.js
 * @description Supabase Storage management for scholarship provider logos.
 *
 * Responsibilities:
 * - MIME-type and size validation (PNG, JPEG, WebP, SVG under 5MB)
 * - Uploads to 'scholarship-logos' public storage bucket
 * - Fallback to in-browser base64 data URLs when Supabase storage is unconfigured
 * - Deletion and public URL resolution
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
 * Validate an image file before upload
 * @param {File} file 
 * @returns {{ valid: boolean, error: string | null }}
 */
export function validateLogoFile(file) {
  if (!file) {
    return { valid: false, error: 'No file selected.' };
  }

  if (!ALLOWED_MIME_TYPES.includes(file.type)) {
    return {
      valid: false,
      error: `Unsupported image format (${file.type || 'unknown'}). Please upload a PNG, JPG, JPEG, WebP, or SVG.`,
    };
  }

  if (file.size > MAX_FILE_SIZE_BYTES) {
    const sizeMb = (file.size / (1024 * 1024)).toFixed(2);
    return {
      valid: false,
      error: `File size is ${sizeMb} MB. Please upload an image smaller than 5 MB.`,
    };
  }

  return { valid: true, error: null };
}

/**
 * Convert file to base64 Data URL (used as fallback when Supabase storage is unavailable)
 * @param {File} file 
 * @returns {Promise<string>}
 */
export function fileToDataUrl(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = (err) => reject(err);
    reader.readAsDataURL(file);
  });
}

/**
 * Upload a scholarship/provider logo to Supabase Storage with local fallback
 * @param {File} file 
 * @param {string | null} previousStoragePath
 * @returns {Promise<{ url: string, storagePath: string }>}
 */
export async function uploadScholarshipLogo(file, previousStoragePath = null) {
  const validation = validateLogoFile(file);
  if (!validation.valid) {
    throw new Error(validation.error);
  }

  const cleanName = file.name
    .toLowerCase()
    .replace(/[^a-z0-9.]/g, '-')
    .replace(/-+/g, '-');
  const uniqueId = Math.random().toString(36).substring(2, 8);
  const storagePath = `logos/${Date.now()}_${uniqueId}_${cleanName}`;

  if (isSupabaseConfigured()) {
    try {
      // 1. Attempt upload to Supabase Storage
      const { data, error } = await supabase.storage
        .from(LOGO_BUCKET)
        .upload(storagePath, file, {
          cacheControl: '3600',
          upsert: false,
          contentType: file.type,
        });

      if (!error && data) {
        // Get public URL
        const { data: urlData } = supabase.storage
          .from(LOGO_BUCKET)
          .getPublicUrl(storagePath);

        // Clean up previous image if applicable
        if (previousStoragePath) {
          deleteScholarshipLogo(previousStoragePath).catch(() => {});
        }

        return {
          url: urlData.publicUrl,
          storagePath,
        };
      }
      if (error) {
        console.warn('Supabase storage upload error:', error.message);
      }
    } catch (err) {
      console.warn('Supabase storage upload encountered error, using local fallback:', err.message);
    }
  }

  // 2. Resilient Fallback: Convert to Base64 Data URL
  // Ensures local dev works seamlessly without remote S3/Supabase storage credentials
  const dataUrl = await fileToDataUrl(file);
  return {
    url: dataUrl,
    storagePath: `local_base64_${Date.now()}`,
  };
}

/**
 * Delete a logo from Supabase Storage
 * @param {string} storagePath 
 */
export async function deleteScholarshipLogo(storagePath) {
  if (!storagePath || storagePath.startsWith('local_base64_')) return;
  try {
    await supabase.storage.from(LOGO_BUCKET).remove([storagePath]);
  } catch (e) {
    console.warn('Could not delete logo from storage:', e.message);
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
 * Upload a student profile avatar to Supabase Storage with local fallback
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
      // 1. Attempt upload to Supabase Storage 'avatars' bucket
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

        // Clean up previous avatar if applicable
        if (previousStoragePath) {
          deleteUserAvatar(previousStoragePath).catch(() => {});
        }

        return {
          url: urlData.publicUrl,
          storagePath,
        };
      }
      if (error) {
        console.warn('Supabase avatar upload warning:', error.message);
      }
    } catch (err) {
      console.warn('Supabase avatar upload encountered error, using local fallback:', err.message);
    }
  }

  // 2. Resilient Fallback: Convert to Base64 Data URL
  const dataUrl = await fileToDataUrl(file);
  return {
    url: dataUrl,
    storagePath: `local_base64_avatar_${Date.now()}`,
  };
}

/**
 * Delete a student avatar from Supabase Storage
 * @param {string} storagePath
 */
export async function deleteUserAvatar(storagePath) {
  if (!storagePath || storagePath.startsWith('local_base64_')) return;
  try {
    if (isSupabaseConfigured()) {
      await supabase.storage.from(AVATAR_BUCKET).remove([storagePath]);
    }
  } catch (e) {
    console.warn('Could not delete avatar from storage:', e.message);
  }
}
