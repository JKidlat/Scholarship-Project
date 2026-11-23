/**
 * @file AppError.js
 * @description Operational error class for expected, handleable API errors.
 *
 * Extend this instead of throwing raw Error objects from controllers
 * and service functions. The centralised error handler uses `isOperational`
 * to distinguish expected errors (4xx) from unexpected bugs (5xx).
 *
 * Usage:
 *   throw new AppError('Scholarship not found', 404);
 *   throw new AppError('Insufficient permissions', 403);
 */

export class AppError extends Error {
  /**
   * @param {string} message  - Human-readable description of the error
   * @param {number} statusCode - HTTP status code (default 500)
   */
  constructor(message, statusCode = 500) {
    super(message);
    this.name = 'AppError';
    this.statusCode = statusCode;
    this.status = statusCode >= 400 && statusCode < 500 ? 'fail' : 'error';
    this.isOperational = true;

    // Preserve clean stack trace (V8)
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, AppError);
    }
  }
}
