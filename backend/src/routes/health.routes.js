/**
 * @file health.routes.js
 * @description Route definitions for health-check endpoints.
 *
 * Base path: /api/health  (registered in app.js)
 *
 * Routes:
 *   GET /           → Basic server liveness check
 *   GET /supabase   → Supabase connectivity check
 */

import { Router } from 'express';
import { getHealth, getSupabaseHealth } from '../controllers/health.controller.js';

const router = Router();

router.get('/', getHealth);
router.get('/supabase', getSupabaseHealth);

export default router;
