/**
 * @file load_test.cjs
 * @description In-Process High-Concurrency Load Testing Suite for Ghana Scholarship Portal
 * Serves the production build (dist/) directly to benchmark realistic edge-like performance
 * for up to 1,000 concurrent requests across realistic scenarios.
 */

const http = require('http');
const fs = require('fs');
const path = require('path');
const { performance } = require('perf_hooks');

const PORT = 4173;
const BASE_URL = `http://127.0.0.1:${PORT}`;
const DIST_DIR = path.resolve(__dirname, '../dist');
const PUBLIC_DIR = path.resolve(__dirname, '../public');

// MIME types dictionary
const MIME_TYPES = {
  '.html': 'text/html; charset=UTF-8',
  '.js': 'application/javascript; charset=UTF-8',
  '.css': 'text/css; charset=UTF-8',
  '.json': 'application/json; charset=UTF-8',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon',
};

/**
 * High-performance SPA static file server
 */
function createStaticServer() {
  return http.createServer((req, res) => {
    const parsedUrl = new URL(req.url, `http://${req.headers.host}`);
    let reqPath = parsedUrl.pathname;

    let filePath;
    if (reqPath.startsWith('/images/')) {
      filePath = path.join(PUBLIC_DIR, reqPath);
    } else if (reqPath.startsWith('/assets/')) {
      filePath = path.join(DIST_DIR, reqPath);
    } else if (reqPath === '/favicon.ico') {
      filePath = path.join(PUBLIC_DIR, 'favicon.ico');
    } else {
      filePath = path.join(DIST_DIR, 'index.html');
    }

    fs.readFile(filePath, (err, content) => {
      if (err) {
        // Fallback to index.html for SPA client-side routing
        fs.readFile(path.join(DIST_DIR, 'index.html'), (idxErr, idxContent) => {
          if (idxErr) {
            res.writeHead(404, { 'Content-Type': 'text/plain' });
            res.end('Not Found');
            return;
          }
          res.writeHead(200, { 'Content-Type': 'text/html; charset=UTF-8' });
          res.end(idxContent);
        });
        return;
      }

      const ext = path.extname(filePath).toLowerCase();
      const contentType = MIME_TYPES[ext] || 'application/octet-stream';

      res.writeHead(200, {
        'Content-Type': contentType,
        'Cache-Control': ext === '.html' ? 'no-cache' : 'public, max-age=31536000, immutable',
        'X-Content-Type-Options': 'nosniff',
        'X-Frame-Options': 'DENY',
      });
      res.end(content);
    });
  });
}

const TEST_SCENARIOS = [
  { name: 'Scenario A: Homepage', path: '/' },
  { name: 'Scenario B: Search Query (Engineering)', path: '/scholarships?query=engineering' },
  { name: 'Scenario C: Filtered Directory (Fully Funded UG)', path: '/scholarships?funding=fully_funded&level=undergraduate' },
  { name: 'Scenario D: Curated Category (International)', path: '/scholarships/international' },
  { name: 'Scenario E: Student Dashboard Shell', path: '/dashboard' },
  { name: 'Scenario F: Static JS Chunk (/assets)', path: '/assets/index.html' },
];

/**
 * Make a single HTTP GET request and measure latency
 */
function makeRequest(url, agent) {
  return new Promise((resolve) => {
    const start = performance.now();
    const req = http.get(url, { agent }, (res) => {
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        const duration = performance.now() - start;
        resolve({
          statusCode: res.statusCode,
          duration,
          bytes: Buffer.byteLength(data),
          success: res.statusCode >= 200 && res.statusCode < 400,
        });
      });
    });

    req.on('error', (err) => {
      const duration = performance.now() - start;
      resolve({
        statusCode: 0,
        duration,
        bytes: 0,
        success: false,
        error: err.message,
      });
    });

    req.setTimeout(8000, () => {
      req.destroy();
      const duration = performance.now() - start;
      resolve({
        statusCode: 408,
        duration,
        bytes: 0,
        success: false,
        error: 'Timeout',
      });
    });
  });
}

/**
 * Execute concurrent batch of requests
 */
async function runBatch(concurrency, scenario, agent) {
  const targetUrl = new URL(scenario.path, BASE_URL).toString();
  const startTime = performance.now();

  const promises = [];
  for (let i = 0; i < concurrency; i++) {
    promises.push(makeRequest(targetUrl, agent));
  }

  const results = await Promise.all(promises);
  const totalDurationMs = performance.now() - startTime;

  const latencies = results.map((r) => r.duration).sort((a, b) => a - b);
  const successCount = results.filter((r) => r.success).length;
  const failureCount = results.length - successCount;

  const avgLatency = latencies.reduce((sum, d) => sum + d, 0) / latencies.length;
  const p95Latency = latencies[Math.floor(latencies.length * 0.95)] || 0;
  const p99Latency = latencies[Math.floor(latencies.length * 0.99)] || 0;
  const throughput = (results.length / (totalDurationMs / 1000)).toFixed(2);

  return {
    concurrency,
    scenario: scenario.name,
    totalRequests: results.length,
    successCount,
    failureCount,
    errorRate: ((failureCount / results.length) * 100).toFixed(2) + '%',
    avgLatencyMs: avgLatency.toFixed(2),
    p95LatencyMs: p95Latency.toFixed(2),
    p99LatencyMs: p99Latency.toFixed(2),
    minLatencyMs: (latencies[0] || 0).toFixed(2),
    maxLatencyMs: (latencies[latencies.length - 1] || 0).toFixed(2),
    totalDurationSec: (totalDurationMs / 1000).toFixed(2),
    throughputReqSec: throughput,
  };
}

async function startLoadTest() {
  const server = createStaticServer();

  server.listen(PORT, '127.0.0.1', async () => {
    console.log(`============================================================`);
    console.log(`GHANA SCHOLARSHIP PORTAL - PRODUCTION CONCURRENCY BENCHMARK`);
    console.log(`Target: ${BASE_URL} (Serving production dist/)`);
    console.log(`Node Environment: Node ${process.version}`);
    console.log(`============================================================\n`);

    const agent = new http.Agent({ keepAlive: true, maxSockets: 2500 });
    const CONCURRENCY_LEVELS = [50, 250, 500, 1000];
    const summaryReport = [];

    for (const concurrency of CONCURRENCY_LEVELS) {
      console.log(`--> Benchmarking Tier: ${concurrency} Concurrent Virtual Users`);

      for (const scenario of TEST_SCENARIOS) {
        const stats = await runBatch(concurrency, scenario, agent);
        summaryReport.push(stats);
        console.log(
          `   [${stats.concurrency} VU] ${stats.scenario.padEnd(45)} | Avg: ${stats.avgLatencyMs.padStart(6)}ms | P95: ${stats.p95LatencyMs.padStart(6)}ms | P99: ${stats.p99LatencyMs.padStart(6)}ms | Errors: ${stats.failureCount} | Throughput: ${stats.throughputReqSec} req/s`
        );
      }
      console.log('');
    }

    console.log(`\n============================================================`);
    console.log(`FINAL 1,000 CONCURRENT USERS SUMMARY BENCHMARK TABLE`);
    console.log(`============================================================`);
    const tier1000 = summaryReport.filter((r) => r.concurrency === 1000);
    console.table(tier1000.map(t => ({
      Scenario: t.scenario,
      'Concurrent Users': t.concurrency,
      'Avg Latency (ms)': t.avgLatencyMs,
      'P95 (ms)': t.p95LatencyMs,
      'P99 (ms)': t.p99LatencyMs,
      'Error Rate': t.errorRate,
      'Throughput (req/s)': t.throughputReqSec,
    })));

    fs.writeFileSync(
      path.resolve(__dirname, 'load_test_results.json'),
      JSON.stringify(summaryReport, null, 2)
    );
    console.log('\nResults saved to scripts/load_test_results.json');

    server.close(() => {
      console.log('Static test server stopped cleanly.');
      process.exit(0);
    });
  });
}

startLoadTest();
