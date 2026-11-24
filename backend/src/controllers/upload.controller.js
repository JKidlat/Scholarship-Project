/**
 * @file upload.controller.js
 * @description Handles scholarship logo uploads, storage in Supabase Storage,
 * and synchronization with the scholarships table.
 *
 * Uses supabaseAdmin (service role key) to ensure reliable bucket write access
 * without exposing elevated credentials to the client.
 */

import { asyncHandler } from '../utils/asyncHandler.js';
import { AppError } from '../utils/AppError.js';
import { supabaseAdmin } from '../config/supabase.js';

export const LOGO_BUCKET = 'scholarship-logos';

/**
 * POST /api/upload/logo
 * Receives an image via multipart/form-data, uploads it to Supabase Storage,
 * generates the public URL, and optionally updates the corresponding scholarship record.
 */
export const uploadLogo = asyncHandler(async (req, res) => {
  if (!req.file) {
    throw new AppError('No logo image file was provided in the request.', 400);
  }

  const { scholarshipId, previousStoragePath, providerName } = req.body;
  const file = req.file;

  // Sanitize filename and create unique storage path
  const sanitizedOriginal = file.originalname
    .toLowerCase()
    .replace(/[^a-z0-9.]/g, '-')
    .replace(/-+/g, '-');
  const uniquePrefix = `${Date.now()}_${Math.random().toString(36).substring(2, 8)}`;
  const storagePath = `logos/${uniquePrefix}_${sanitizedOriginal}`;

  // 1. Upload file buffer to Supabase Storage using admin client
  const { data: uploadData, error: uploadError } = await supabaseAdmin.storage
    .from(LOGO_BUCKET)
    .upload(storagePath, file.buffer, {
      contentType: file.mimetype,
      cacheControl: '3600',
      upsert: true,
    });

  if (uploadError || !uploadData) {
    console.error('Supabase Storage upload error:', uploadError);
    throw new AppError(
      `Failed to upload image to storage: ${uploadError?.message || 'Storage error'}`,
      502
    );
  }

  // 2. Retrieve public URL
  const { data: urlData } = supabaseAdmin.storage
    .from(LOGO_BUCKET)
    .getPublicUrl(storagePath);

  const publicUrl = urlData?.publicUrl;
  if (!publicUrl) {
    throw new AppError('Failed to generate public URL for uploaded logo.', 500);
  }

  // 3. Clean up previous logo from storage if provided and different
  if (previousStoragePath && previousStoragePath !== storagePath && !previousStoragePath.startsWith('local_')) {
    try {
      await supabaseAdmin.storage.from(LOGO_BUCKET).remove([previousStoragePath]);
    } catch (cleanupErr) {
      console.warn('Previous logo cleanup warning:', cleanupErr.message);
    }
  }

  // 4. If scholarshipId or slug was provided, immediately update database record
  let databaseUpdated = false;
  if (scholarshipId && String(scholarshipId).trim()) {
    const target = String(scholarshipId).trim();
    const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(target);
    const now = new Date().toISOString();

    const updatePayload = {
      logo_url: publicUrl,
      logo_storage_path: storagePath,
      logo_updated_at: now,
      updated_at: now,
    };
    if (providerName && providerName.trim()) {
      updatePayload.logo_alt_text = `${providerName.trim()} official logo`;
    }

    let query = supabaseAdmin.from('scholarships').update(updatePayload);
    if (isUuid) {
      query = query.eq('id', target);
    } else {
      query = query.eq('slug', target);
    }

    const { error: dbError } = await query;
    if (dbError) {
      console.warn('Automatic database logo sync warning:', dbError.message);
    } else {
      databaseUpdated = true;
    }
  }

  res.status(200).json({
    success: true,
    message: 'Logo uploaded successfully to storage.',
    url: publicUrl,
    storagePath,
    databaseUpdated,
  });
});

/**
 * DELETE /api/upload/logo
 * Removes an existing logo from Supabase Storage and optionally clears
 * the logo_url on the associated scholarship record.
 */
export const deleteLogo = asyncHandler(async (req, res) => {
  const { storagePath, scholarshipId } = req.body;

  if (!storagePath) {
    throw new AppError('storagePath is required to delete a logo.', 400);
  }

  if (!storagePath.startsWith('local_')) {
    const { error: deleteError } = await supabaseAdmin.storage
      .from(LOGO_BUCKET)
      .remove([storagePath]);

    if (deleteError) {
      console.warn('Storage remove warning:', deleteError.message);
    }
  }

  // Optionally clear logo fields on the scholarship record
  if (scholarshipId) {
    const target = String(scholarshipId).trim();
    const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(target);
    const now = new Date().toISOString();

    let query = supabaseAdmin.from('scholarships').update({
      logo_url: null,
      logo_storage_path: null,
      logo_alt_text: null,
      logo_updated_at: now,
      updated_at: now,
    });

    if (isUuid) {
      query = query.eq('id', target);
    } else {
      query = query.eq('slug', target);
    }

    await query;
  }

  res.status(200).json({
    success: true,
    message: 'Logo removed successfully.',
  });
});
