# Ghana Scholarship Portal — Backend API

Node.js + Express backend for the Ghana Scholarship Portal.

**Architecture:**

| Layer | Technology | Host |
|---|---|---|
| Frontend | React + Vite + Tailwind CSS | Vercel |
| **Backend** | **Node.js + Express** | **Render** |
| Database | Supabase PostgreSQL | Supabase |
| Auth | Supabase Auth | Supabase |

---

## Folder Structure

```
backend/
├── src/
│   ├── config/
│   │   ├── env.js          # Centralised env validation (Zod)
│   │   └── supabase.js     # Supabase client factory (anon + admin)
│   ├── controllers/
│   │   └── health.controller.js
│   ├── middleware/
│   │   ├── errorHandler.js  # Centralised error handler
│   │   ├── notFound.js      # 404 handler
│   │   └── requestLogger.js # Morgan HTTP logger
│   ├── routes/
│   │   └── health.routes.js
│   ├── utils/
│   │   ├── AppError.js      # Operational error class
│   │   └── asyncHandler.js  # Async route wrapper
│   ├── app.js               # Express app factory
│   └── server.js            # HTTP server entry point
├── .env                     # Local secrets — NEVER commit
├── .env.example             # Placeholder template — safe to commit
├── .gitignore
├── package.json
└── README.md
```

---

## Required Software

- **Node.js** ≥ 20.x (LTS) — [nodejs.org](https://nodejs.org)
- **npm** ≥ 10.x (bundled with Node.js)
- A Supabase project with the Ghana Scholarship Portal schema applied

---

## Installation

```bash
# From the project root
cd backend
npm install
```

---

## Environment Variables

Copy `.env.example` to `.env` and fill in real values:

```bash
# Windows PowerShell
Copy-Item .env.example .env

# Git Bash / macOS / Linux
cp .env.example .env
```

| Variable | Description | Required |
|---|---|---|
| `PORT` | Port the server listens on | No (default: 5000) |
| `NODE_ENV` | `development` or `production` | No (default: development) |
| `FRONTEND_URL` | Comma-separated list of allowed CORS origins | Yes |
| `SUPABASE_URL` | Your Supabase project URL | Yes |
| `SUPABASE_ANON_KEY` | Supabase anon/public key | Yes |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase service role key (**server-side only**) | Yes |

> **Security:** `SUPABASE_SERVICE_ROLE_KEY` bypasses Row Level Security.
> It must NEVER be sent to the frontend, returned in API responses, or committed to Git.

### Where to find Supabase credentials

1. Open [supabase.com](https://supabase.com) → your project
2. Go to **Settings → API**
3. Copy **Project URL**, **anon/public key**, and **service_role key**

---

## Local Development

```bash
# From the backend/ directory
npm run dev
```

The server will start on `http://localhost:5000` with auto-restart on file changes.

### Verify it is running

```bash
# PowerShell
Invoke-RestMethod http://localhost:5000/api/health | ConvertTo-Json

# Git Bash / curl
curl http://localhost:5000/api/health
```

Expected response:

```json
{
  "success": true,
  "message": "Backend is running",
  "environment": "development",
  "timestamp": "2024-01-01T00:00:00.000Z"
}
```

### Test Supabase connectivity

```bash
curl http://localhost:5000/api/health/supabase
```

---

## Running in Production

```bash
npm start
```

---

## Available Endpoints

| Method | Path | Description |
|---|---|---|
| GET | `/api/health` | Server liveness check |
| GET | `/api/health/supabase` | Database connectivity check |
| POST | `/api/upload/logo` | Upload logo to `scholarship-logos` bucket (multipart/form-data) |
| DELETE | `/api/upload/logo` | Remove logo from storage and clear DB reference |
| GET | `/api/scholarships` | List published scholarships (supports `?all=true`, `?status=`, `?scope=`, `?featured=`, `?query=`) |
| GET | `/api/scholarships/:idOrSlug` | Retrieve single scholarship by UUID or unique slug |
| POST | `/api/scholarships` | Create new scholarship in database (handles foreign keys & join tables) |
| PATCH | `/api/scholarships/:idOrSlug` | Update scholarship (preserves logo, cleans up old file if replaced) |
| DELETE | `/api/scholarships/:idOrSlug` | Delete scholarship and purge its logo from Storage |

---

## Supabase Configuration

The backend uses two Supabase clients:

| Client | Key Used | RLS | Use Case |
|---|---|---|---|
| `supabaseAnon` | `SUPABASE_ANON_KEY` | ✅ Enforced | User-scoped reads, JWT verification |
| `supabaseAdmin` | `SUPABASE_SERVICE_ROLE_KEY` | ❌ Bypassed | Admin operations, audit logs, privileged writes |

**Authentication flow for protected endpoints (future phases):**

1. Frontend sends `Authorization: Bearer <access_token>` header
2. Backend middleware calls `supabaseAnon.auth.getUser(token)` to verify
3. Verified user is attached to `req.user`
4. Controller proceeds with the verified identity — never trusting frontend-supplied user IDs

---

## Render Deployment

### Manual deployment steps

1. Push the full project to GitHub (backend/ is part of the same repo)
2. Log in to [render.com](https://render.com)
3. Click **New → Web Service**
4. Connect your GitHub repository
5. Configure the service:

| Setting | Value |
|---|---|
| **Service Type** | Web Service |
| **Runtime** | Node |
| **Root Directory** | `backend` |
| **Build Command** | `npm install` |
| **Start Command** | `npm start` |
| **Health Check Path** | `/api/health` |

6. Add Environment Variables in Render's dashboard:

```
NODE_ENV=production
FRONTEND_URL=https://your-vercel-app.vercel.app
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
```

> Do not set `PORT` — Render injects it automatically.

7. Click **Deploy**

After deployment, your backend URL will be:
`https://your-service-name.onrender.com/api/health`

---

## Security Notes

- `SUPABASE_SERVICE_ROLE_KEY` is **backend-only** — never returned in responses
- CORS is restricted to explicit allowed origins — no wildcard with credentials
- Rate limiting is applied globally (200 req/15 min) and will be tightened on auth endpoints
- Helmet sets security headers on every response
- Stack traces and internal errors are hidden in production responses
- All environment variables are validated at startup — missing vars exit the process cleanly

---

## Adding New API Modules

### 1. Add a route file

```
backend/src/routes/scholarships.routes.js
```

```js
import { Router } from 'express';
import { getScholarships } from '../controllers/scholarships.controller.js';

const router = Router();
router.get('/', getScholarships);
export default router;
```

### 2. Add a controller

```
backend/src/controllers/scholarships.controller.js
```

```js
import { asyncHandler } from '../utils/asyncHandler.js';
import { supabaseAdmin } from '../config/supabase.js';
import { AppError } from '../utils/AppError.js';

export const getScholarships = asyncHandler(async (req, res) => {
  const { data, error } = await supabaseAdmin
    .from('scholarships')
    .select('id, name, slug, application_status')
    .eq('is_published', true);

  if (error) throw new AppError('Failed to fetch scholarships', 500);

  res.json({ success: true, data });
});
```

### 3. Register the route in app.js

```js
import scholarshipRoutes from './routes/scholarships.routes.js';
// ...
app.use('/api/scholarships', scholarshipRoutes);
```

### 4. Add a service (optional — for reusable business logic)

```
backend/src/services/scholarships.service.js
```

Keeps controllers thin and logic testable.

### 5. Add middleware (optional)

```
backend/src/middleware/authenticate.js   // Verify Supabase JWT
backend/src/middleware/requireAdmin.js   // Check admin_users table
```

---

## Next Recommended Phase

**Phase 2 — Scholarship API endpoints:**

- `GET /api/scholarships` — paginated, filtered listing
- `GET /api/scholarships/:slug` — single scholarship detail
- `GET /api/scholarships/featured` — featured/open scholarships
- `POST /api/scholarships` — admin create (authenticated + admin guard)
- `PATCH /api/scholarships/:id` — admin update
- `DELETE /api/scholarships/:id` — admin delete with cascade

**Phase 3 — Authentication middleware:**

- JWT verification middleware (`authenticate.js`)
- Admin guard middleware (`requireAdmin.js`)
- User profile endpoints

**Phase 4 — Student features:**

- `GET /api/users/me/saved` — saved scholarships
- `POST /api/users/me/saved` — save scholarship
- `GET /api/users/me/applications` — application tracking
- `POST /api/users/me/applications` — track application
