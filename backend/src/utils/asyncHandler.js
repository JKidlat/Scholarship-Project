/**
 * @file asyncHandler.js
 * @description Wraps async Express route handlers to automatically forward
 * any unhandled Promise rejections to Express's next(err) pipeline.
 *
 * Without this wrapper, an unhandled rejection inside an async controller
 * would not reach the centralised error handler and would instead crash
 * or silently hang the request.
 *
 * Usage:
 *   router.get('/example', asyncHandler(async (req, res) => {
 *     const data = await someAsyncOperation();
 *     res.json({ success: true, data });
 *   }));
 *
 * @param {Function} fn - Async Express route handler
 * @returns {Function} Express middleware that catches async errors
 */
export const asyncHandler = (fn) => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};
