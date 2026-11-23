/**
 * @file requestLogger.js
 * @description HTTP request logger middleware using Morgan.
 *
 * In development, uses the 'dev' preset (colorised, concise).
 * In production, uses the 'combined' Apache standard format.
 *
 * Sensitive headers (Authorization, Cookie) are intentionally NOT logged.
 * Morgan logs only method, URL, status code, response time, and content length.
 */

import morgan from 'morgan';
import env from '../config/env.js';

const format = env.isProduction ? 'combined' : 'dev';

export const requestLogger = morgan(format);
