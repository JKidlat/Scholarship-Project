/**
 * @file upload.routes.js
 * @description Routes for file uploads to Supabase Storage.
 */

import { Router } from 'express';
import { logoUploadMiddleware } from '../middleware/upload.js';
import { uploadLogo, deleteLogo } from '../controllers/upload.controller.js';

const router = Router();

router.post('/logo', logoUploadMiddleware, uploadLogo);
router.delete('/logo', deleteLogo);

export default router;
