/**
 * @file supabase.js
 * @description Centralised Supabase server-side client factory.
 *
 * Two clients are exported:
 *
 *   supabaseAnon         — uses the anon key; subject to Row Level Security.
 *                          Safe for user-scoped queries after JWT verification.
 *
 *   supabaseAdmin        — uses the SERVICE ROLE KEY; bypasses RLS.
 *                          Use ONLY for privileged server-side operations:
 *                            • reading admin_users table
 *                            • writing audit logs
 *                            • seeding / migration scripts
 *                          NEVER expose this client's key to the frontend.
 *                          NEVER return it in API responses.
 *                          NEVER log it.
 *
 * Authentication strategy:
 *   For protected endpoints, verify the user's Supabase JWT with
 *   supabaseAnon.auth.getUser(accessToken) and attach the verified
 *   user to req.user before processing the request.
 *
 * Usage:
 *   import { supabaseAdmin, supabaseAnon } from './config/supabase.js';
 */

import { createClient } from '@supabase/supabase-js';
import env from './env.js';

// ============================================================
// Anon client — respects Row Level Security
// ============================================================
export const supabaseAnon = createClient(env.SUPABASE_URL, env.SUPABASE_ANON_KEY, {
  auth: {
    // Disable automatic token persistence — the backend manages sessions explicitly
    persistSession: false,
    autoRefreshToken: false,
    detectSessionInUrl: false,
  },
});

// ============================================================
// Admin / service-role client — bypasses Row Level Security
// ============================================================
export const supabaseAdmin = createClient(env.SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: {
    persistSession: false,
    autoRefreshToken: false,
    detectSessionInUrl: false,
  },
});

/**
 * Verify a Supabase access token and return the authenticated user.
 *
 * @param {string} accessToken - Bearer token from the Authorization header
 * @returns {Promise<{ user: import('@supabase/supabase-js').User | null, error: Error | null }>}
 */
export async function verifyAccessToken(accessToken) {
  if (!accessToken) {
    return { user: null, error: new Error('No access token provided') };
  }

  const { data, error } = await supabaseAnon.auth.getUser(accessToken);

  if (error) {
    return { user: null, error };
  }

  return { user: data.user, error: null };
}
