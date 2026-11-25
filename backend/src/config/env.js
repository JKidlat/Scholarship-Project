/**
 * @file env.js
 * @description Centralised environment variable configuration and validation.
 *
 * Loads variables from the backend .env file and validates that all required
 * variables are present before the server attempts to start. Provides a
 * single source of truth for every env value used across the application.
 *
 * Usage:
 *   import env from './config/env.js';
 *   console.log(env.PORT);
 */

import { config } from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';
import { z } from 'zod';

// Resolve __dirname in ES module context
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Load .env from the backend root directory
config({ path: path.resolve(__dirname, '../../.env') });

// Map common Supabase environment variable aliases
process.env.SUPABASE_URL = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL;
process.env.SUPABASE_ANON_KEY = process.env.SUPABASE_ANON_KEY || process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

// ============================================================
// Schema: validate and coerce every required environment variable
// ============================================================
const envSchema = z.object({
  // Server
  PORT: z.coerce.number().int().positive().default(5000),
  NODE_ENV: z.enum(['development', 'production', 'test']).default('development'),

  // CORS — comma-separated list of allowed frontend origins
  FRONTEND_URL: z.string().min(1, 'FRONTEND_URL is required').default('http://localhost:3000'),

  // Supabase — required; never expose SERVICE_ROLE_KEY to the client
  SUPABASE_URL: z
    .string()
    .url('SUPABASE_URL must be a valid URL')
    .refine((v) => !v.includes('placeholder'), {
      message: 'SUPABASE_URL must not be a placeholder value',
    }),
  SUPABASE_ANON_KEY: z
    .string()
    .min(1, 'SUPABASE_ANON_KEY is required')
    .refine((v) => !v.includes('placeholder'), {
      message: 'SUPABASE_ANON_KEY must not be a placeholder value',
    }),
  SUPABASE_SERVICE_ROLE_KEY: z
    .string()
    .min(1, 'SUPABASE_SERVICE_ROLE_KEY is required')
    .refine((v) => !v.includes('placeholder'), {
      message: 'SUPABASE_SERVICE_ROLE_KEY must not be a placeholder value',
    }),
});

// ============================================================
// Parse and validate — exit with a clear error if anything is missing
// ============================================================
const parsed = envSchema.safeParse(process.env);

if (!parsed.success) {
  console.error('\n❌  Environment variable validation failed:\n');
  parsed.error.issues.forEach((issue) => {
    // Never print the actual value — only the variable name and what is wrong
    const varName = issue.path.join('.');
    console.error(`   • ${varName}: ${issue.message}`);
  });
  console.error('\nFix the issues above in backend/.env (for local development) or your hosting dashboard environment variables (for Render deployment) then restart the server.\n');
  process.exit(1);
}

// ============================================================
// Derived helpers
// ============================================================
const env = {
  ...parsed.data,

  /** True when running in production */
  isProduction: parsed.data.NODE_ENV === 'production',

  /** True when running in development */
  isDevelopment: parsed.data.NODE_ENV === 'development',

  /**
   * Array of allowed CORS origins derived from FRONTEND_URL.
   * Strips trailing slashes to guarantee clean matching.
   * Always includes common dev ports (3000, 5173, 5174, 4173) in development.
   */
  get allowedOrigins() {
    const declared = this.FRONTEND_URL.split(',')
      .map((u) => u.trim().replace(/\/+$/, ''))
      .filter(Boolean);

    if (!this.isProduction) {
      const devOrigins = [
        'http://localhost:3000',
        'http://localhost:5173',
        'http://localhost:5174',
        'http://localhost:4173',
        'http://127.0.0.1:3000',
        'http://127.0.0.1:5173',
      ];
      devOrigins.forEach((o) => {
        if (!declared.includes(o)) declared.push(o);
      });
    }
    return declared;
  },
};

export default env;
