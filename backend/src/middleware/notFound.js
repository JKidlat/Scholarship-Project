/**
 * @file notFound.js
 * @description 404 handler middleware.
 *
 * Mount AFTER all defined routes. Any request that reaches this middleware
 * did not match a registered route.
 */

import { AppError } from '../utils/AppError.js';

/**
 * Creates a 404 AppError and forwards it to the centralised error handler.
 *
 * @param {import('express').Request}  req
 * @param {import('express').Response} _res
 * @param {import('express').NextFunction} next
 */
export function notFound(req, _res, next) {
  next(new AppError(`Route not found: ${req.method} ${req.originalUrl}`, 404));
}
