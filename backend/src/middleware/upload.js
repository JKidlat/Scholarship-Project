/**
 * @file upload.js
 * @description Multer configuration for memory-buffered file uploads.
 *
 * Enforces:
 * - 5 MB file size limit
 * - Allowed image MIME types: PNG, JPEG, WebP, SVG
 * - In-memory storage for immediate streaming/buffering to Supabase Storage
 */

import multer from 'multer';
import { AppError } from '../utils/AppError.js';

export const ALLOWED_MIME_TYPES = [
  'image/png',
  'image/jpeg',
  'image/jpg',
  'image/webp',
  'image/svg+xml',
];

export const MAX_FILE_SIZE = 5 * 1024 * 1024; // 5 MB

const storage = multer.memoryStorage();

function fileFilter(_req, file, cb) {
  if (ALLOWED_MIME_TYPES.includes(file.mimetype)) {
    cb(null, true);
  } else {
    cb(
      new AppError(
        `Invalid image format '${file.mimetype}'. Only PNG, JPG, JPEG, WebP, and SVG are supported.`,
        400
      ),
      false
    );
  }
}

export const logoUploadMiddleware = multer({
  storage,
  limits: {
    fileSize: MAX_FILE_SIZE,
    files: 1,
  },
  fileFilter,
}).single('logo');
