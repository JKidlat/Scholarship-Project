/**
 * @file health.controller.js
 * @description Controllers for the health-check endpoints.
 *
 * GET /api/health           — Confirms the Express server is running.
 * GET /api/health/supabase  — Confirms Supabase credentials are configured
 *                             and the database is reachable with a safe read.
 *
 * Security:
 *   • Never return credentials, keys, or connection strings.
 *   • Database read uses the anon client with a safe, read-only query.
 *   • The service-role key is NEVER referenced here.
 */

import { asyncHandler } from '../utils/asyncHandler.js';
import { supabaseAnon } from '../config/supabase.js';
import env from '../config/env.js';

/**
 * GET /api/health
 * Basic liveness probe — no database interaction.
 */
export const getHealth = asyncHandler(async (_req, res) => {
  res.status(200).json({
    success: true,
    message: 'Backend is running',
    environment: env.NODE_ENV,
    timestamp: new Date().toISOString(),
  });
});

/**
 * GET /api/health/supabase
 * Verifies that Supabase credentials are configured and the database
 * responds to a safe, read-only query against the scholarships table.
 *
 * Uses the anon client only — does not use or expose the service-role key.
 * Returns row count without any scholarship content.
 */
export const getSupabaseHealth = asyncHandler(async (_req, res) => {
  let dbStatus = 'unchecked';
  let dbMessage = 'Database check not attempted';
  let scholarshipCount = null;

  try {
    // Safe read-only query: count published scholarships without fetching content
    const { count, error } = await supabaseAnon
      .from('scholarships')
      .select('*', { count: 'exact', head: true })
      .eq('is_published', true);

    if (error) {
      dbStatus = 'error';
      dbMessage = env.isProduction
        ? 'Database query failed'
        : `Database error: ${error.message}`;
    } else {
      dbStatus = 'connected';
      dbMessage = 'Supabase database is reachable';
      scholarshipCount = count;
    }
  } catch (err) {
    dbStatus = 'error';
    dbMessage = env.isProduction
      ? 'Database connectivity check failed'
      : `Connection error: ${err.message}`;
  }

  const isHealthy = dbStatus === 'connected';

  res.status(isHealthy ? 200 : 503).json({
    success: isHealthy,
    message: isHealthy ? 'Supabase connection is healthy' : 'Supabase connection is degraded',
    database: {
      status: dbStatus,
      message: dbMessage,
      ...(scholarshipCount !== null && { publishedScholarships: scholarshipCount }),
    },
    supabase: {
      configured: true,
      // Never return URLs, keys, or any credential
      url: env.isProduction
        ? '[configured]'
        : env.SUPABASE_URL.replace(/\/\/(.{8}).*\.supabase\.co/, '//$1***.supabase.co'),
    },
    timestamp: new Date().toISOString(),
  });
});
