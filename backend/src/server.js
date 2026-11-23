/**
 * @file server.js
 * @description HTTP server entry point.
 *
 * Responsibilities:
 *   • Import the configured Express app from app.js
 *   • Bind to 0.0.0.0 so Render can route external traffic to the container
 *   • Listen on process.env.PORT (required by Render)
 *   • Log the startup URL and environment for quick verification
 *   • Register process-level handlers for unhandled rejections and
 *     uncaught exceptions so the server never silently swallows errors
 *
 * Start commands:
 *   Development:  npm run dev   (via nodemon, auto-restarts on file changes)
 *   Production:   npm start     (node directly — required by Render)
 */

import app from './app.js';
import env from './config/env.js';

const HOST = '0.0.0.0'; // Required for Render; also works on localhost

// ============================================================
// Start the HTTP server
// ============================================================
const server = app.listen(env.PORT, HOST, () => {
  console.log('\n🎓 Ghana Scholarship Portal — Backend API');
  console.log('─────────────────────────────────────────────');
  console.log(`  Environment : ${env.NODE_ENV}`);
  console.log(`  Port        : ${env.PORT}`);
  console.log(`  Local URL   : http://localhost:${env.PORT}/api/health`);
  console.log(`  Allowed origins:`);
  env.allowedOrigins.forEach((o) => console.log(`    • ${o}`));
  console.log('─────────────────────────────────────────────\n');
});

// ============================================================
// Graceful shutdown
// ============================================================
function shutdown(signal) {
  console.log(`\n${signal} received — shutting down gracefully...`);
  server.close(() => {
    console.log('HTTP server closed.');
    process.exit(0);
  });

  // Force exit if shutdown takes longer than 10 s
  setTimeout(() => {
    console.error('Forced shutdown after timeout.');
    process.exit(1);
  }, 10_000).unref();
}

process.on('SIGTERM', () => shutdown('SIGTERM')); // Render sends SIGTERM on deploy
process.on('SIGINT',  () => shutdown('SIGINT'));  // Ctrl+C in development

// ============================================================
// Safety nets for unexpected errors
// ============================================================
process.on('unhandledRejection', (reason) => {
  console.error('⚠️  Unhandled Promise Rejection:', reason);
  // Keep the server running — log and continue; crash only on truly fatal errors
});

process.on('uncaughtException', (err) => {
  console.error('💥 Uncaught Exception — restarting server:', err.message);
  // On uncaught exceptions the process state is undefined; exit and let Render restart
  shutdown('uncaughtException');
});
