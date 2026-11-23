/**
 * @file errorHandler.js
 * @description Centralised Express error-handling middleware.
 *
 * Must be the LAST middleware registered in app.js (after all routes and
 * the 404 handler). Express recognises error-handling middleware by its
 * four-argument signature (err, req, res, next).
 *
 * Behaviour:
 *   • Operational errors (AppError instances) → return their status code
 *     and message directly to the client.
 *   • Unexpected / programming errors → return 500 "Internal Server Error"
 *     and log the full stack for debugging.
 *   • In development, include the error detail in the response body.
 *   • In production, never expose stack traces or internal details.
 *
 * Response shape:
 *   {
 *     "success": false,
 *     "message": "...",
 *     "error": "... (development only)"
 *   }
 */

import env from '../config/env.js';

/**
 * @param {Error} err
 * @param {import('express').Request}  req
 * @param {import('express').Response} res
 * @param {import('express').NextFunction} _next
 */
// eslint-disable-next-line no-unused-vars
export function errorHandler(err, req, res, _next) {
  const statusCode = err.statusCode || err.status || 500;
  const isOperational = err.isOperational === true;

  // Always log unexpected errors server-side
  if (!isOperational) {
    console.error('💥 Unexpected error:', err);
  }

  // Build a safe, consistent response payload
  const payload = {
    success: false,
    message: isOperational ? err.message : 'Something went wrong. Please try again later.',
  };

  // Include extra detail only in non-production environments
  if (!env.isProduction) {
    payload.error = err.message;
    if (!isOperational) {
      payload.stack = err.stack;
    }
  }

  res.status(statusCode).json(payload);
}
