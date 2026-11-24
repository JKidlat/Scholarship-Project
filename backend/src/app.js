/**
 * @file app.js
 * @description Express application factory.
 *
 * Configures all middleware and routes in the correct order:
 *   1. Security headers (Helmet)
 *   2. CORS
 *   3. Rate limiting
 *   4. Request parsing
 *   5. HTTP request logging (Morgan)
 *   6. API routes
 *   7. 404 handler
 *   8. Centralised error handler
 *
 * This file exports the configured Express app. The HTTP server is created
 * in server.js to keep the app testable in isolation.
 */

import express from 'express';
import helmet from 'helmet';
import cors from 'cors';
import rateLimit from 'express-rate-limit';

import env from './config/env.js';
import { requestLogger } from './middleware/requestLogger.js';
import { notFound } from './middleware/notFound.js';
import { errorHandler } from './middleware/errorHandler.js';
import healthRoutes from './routes/health.routes.js';
import uploadRoutes from './routes/upload.routes.js';
import scholarshipRoutes from './routes/scholarships.routes.js';

const app = express();

// ============================================================
// 1. Security headers
// ============================================================
app.use(
  helmet({
    // Allow cross-origin requests from configured frontend domains
    crossOriginResourcePolicy: { policy: 'cross-origin' },
  })
);

// ============================================================
// 2. CORS
// ============================================================
const corsOptions = {
  origin(origin, callback) {
    // Allow server-to-server requests or curl (no Origin header) in non-production
    if (!origin && !env.isProduction) {
      return callback(null, true);
    }

    // Strip any trailing slash from incoming origin header
    const cleanOrigin = origin ? origin.replace(/\/+$/, '') : origin;

    if (!cleanOrigin || env.allowedOrigins.includes(cleanOrigin)) {
      callback(null, true);
    } else {
      callback(new Error(`CORS: origin '${origin}' is not allowed`));
    }
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With'],
  maxAge: 600, // Cache preflight for 10 minutes
};

app.use(cors(corsOptions));
// Handle preflight OPTIONS requests
app.options('*', cors(corsOptions));

// ============================================================
// 3. Rate limiting
// ============================================================

// Global limiter — protects all /api routes
const globalLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15-minute window
  max: 200,                  // Max 200 requests per IP per window
  standardHeaders: true,
  legacyHeaders: false,
  message: {
    success: false,
    message: 'Too many requests. Please try again in a few minutes.',
  },
  skip: (req) => !env.isProduction && req.ip === '127.0.0.1',
});

// Stricter limiter for sensitive write endpoints (applied per-route in future phases)
export const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15-minute window
  max: 20,                   // Max 20 auth attempts per IP per window
  standardHeaders: true,
  legacyHeaders: false,
  message: {
    success: false,
    message: 'Too many authentication attempts. Please wait 15 minutes.',
  },
});

app.use('/api', globalLimiter);

// ============================================================
// 4. Request body parsing
// ============================================================
app.use(express.json({ limit: '2mb' }));
app.use(express.urlencoded({ extended: true, limit: '2mb' }));

// ============================================================
// 5. HTTP request logging
// ============================================================
app.use(requestLogger);

// ============================================================
// 6. API routes
// ============================================================
app.use('/api/health', healthRoutes);
app.use('/api/upload', uploadRoutes);
app.use('/api/scholarships', scholarshipRoutes);

// Placeholder for future route modules:
// app.use('/api/auth',         authRoutes);
// app.use('/api/users',        userRoutes);
// app.use('/api/admin',        adminRoutes);

// ============================================================
// 7. 404 handler — must come after all defined routes
// ============================================================
app.use(notFound);

// ============================================================
// 8. Centralised error handler — must be last (4-arg signature)
// ============================================================
app.use(errorHandler);

export default app;
