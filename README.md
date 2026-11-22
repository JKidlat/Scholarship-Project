# Ghana Scholarship Portal

A full-stack, responsive scholarship discovery directory built specifically for Ghanaian students seeking domestic and international funding opportunities.

---

## 🚀 Running on Localhost

The application uses standard **Vite + React (JSX) + Tailwind CSS + React Router + Supabase**.

### 1. Install Dependencies
```bash
npm install
```

### 2. Start the Development Server
```bash
npm run dev
```

### 3. Open in Browser
Navigate to:
```
http://localhost:3000
```

### 4. Build for Production
To create an optimized production build:
```bash
npm run build
npm run preview
```

---

## 🎨 Brand Design System

Built strictly according to the master brand specifications:

| Element | Hex Code / Specification |
|---|---|
| **Primary Background** | Deep Navy `#050D2B` |
| **Secondary Background**| Dark Navy `#0B1740` |
| **Royal Blue** | `#173A8A` |
| **Gold Accent** | `#FFC928` |
| **Bright Gold** | `#FFD84D` |
| **Pure White** | `#FFFFFF` |
| **Light Background** | `#F5F7FC` |
| **Main Text** | `#101828` |
| **Muted Text** | `#667085` |
| **Borders** | `#E4E7EC` |
| **Success** | `#12A36D` |
| **Warning** | `#E9A23B` |
| **Error** | `#D92D20` |
| **Hero Gradient** | `linear-gradient(110deg, #050D2B 0%, #10245C 55%, #173A8A 100%)` |
| **Headings Font** | Montserrat / Outfit (Bold Geometric) |
| **Body Font** | Inter (Clean, highly readable) |

---

## 📂 Project Architecture

```
Scholarship-Project/
├── src/
│   ├── assets/                       # Static media and icons
│   ├── components/                   # Reusable UI components
│   │   ├── common/                   # Button, StatusBadge, EmptyState
│   │   ├── home/                     # HeroSection, CategoryGrid, Featured, HowItWorks
│   │   ├── layout/                   # Navbar, Footer
│   │   └── scholarship/              # FilterSidebar, ScholarshipCard, CuratedCategoryView
│   ├── context/                      # AuthContext (Supabase Auth & Session)
│   ├── data/                         # scholarships_seed.json (112 curated Ghanaian opportunities)
│   ├── layouts/                      # MainLayout (public), AdminLayout (console)
│   ├── pages/                        # Route pages
│   │   ├── admin/                    # AdminOverview, AdminScholarships, AdminNewScholarship,
│   │   │                             # AdminEditScholarship, AdminVerification, AdminImport,
│   │   │                             # AdminAnalytics, AdminCategories, AdminInstitutions,
│   │   │                             # AdminUsers, AdminSettings
│   │   ├── auth/                     # Login, Register, ResetPassword
│   │   ├── curated/                  # Undergraduate, Postgraduate, International, ForWomen,
│   │   │                             # InstitutionSpecific, PublicInstitution
│   │   ├── dashboard/                # Student dashboard (saved scholarships, tracker)
│   │   ├── Home.jsx                  # Homepage
│   │   ├── Scholarships.jsx          # 10-dimension multi-attribute search directory
│   │   └── ScholarshipDetail.jsx     # Detail view with structured tabs & official apply CTA
│   ├── services/                     # Supabase client & scholarship data service
│   ├── utils/                        # formatters.js (cn, dates, slugs, status labels)
│   ├── App.jsx                       # Master React Router v6 setup
│   ├── main.jsx                      # App root mount
│   └── index.css                     # Tailwind directives & design tokens
├── data/                             # Raw CSV dataset (112 local Ghanaian scholarships)
├── supabase/
│   └── migrations/
│       ├── 001_initial_schema.sql    # Relational tables, enums, triggers & RLS policies
│       ├── 002_analytics_and_audit.sql # Analytics tracking & status audit log tables
│       └── 003_seed_data.sql         # 112 pre-categorised scholarship SQL inserts
├── index.html                        # Google fonts & HTML entry point
├── vite.config.js                    # Vite 6 config with @ path alias & port 3000
├── tailwind.config.js                # Custom color palette tokens
└── package.json                      # Pure npm dependencies (React 18, Vite 6, Supabase, Lucide)
```

---

## ⚡ Key Features

1. **Intelligent Importer & Seed Data:**
   - 112 verified local Ghanaian scholarships pre-parsed from the official spreadsheet.
   - Built-in Excel (XLSX) and CSV spreadsheet importer with automatic column mapping and validation.
   - Resilient data architecture: uses Supabase when configured, and falls back to browser storage (`localStorage`) so the entire directory works immediately out-of-the-box.

2. **10-Dimension Multi-Attribute Search:**
   - Search by keyword, provider, university, or scope.
   - Filter by Study Level, Funding Type, Geographic Scope, Host Institution, Gender, Public/Private status, and Application Status.

3. **Complete Administration Console:**
   - **Dashboard & KPIs:** Total scholarships, open/closed counts, verification queue, page views, saved counts, apply button clicks.
   - **Interactive Analytics:** CSS/SVG distribution charts by application status, academic level, coverage type, top universities, and student search queries.
   - **Full Inventory Management:** Inline status dropdowns (Open, Closed, Upcoming, Rolling, Unannounced, Archived), visibility toggles, edit modal/page, permanent delete, archive, and audit history log.
   - **Data Quality & Verification Queue:** Highlights missing official URLs, missing deadlines, and potential duplicates for rapid resolution.
   - **Admin Management Views:** Disciplines & Fields taxonomy, Institutions & Providers directory, Registered Users, and Platform Settings.

4. **Public Scholarship Presentation:**
   - Standardized `ScholarshipCard` with logo placeholders (provider initials fallback) and prominent OPEN/CLOSED badges.
   - Structured `ScholarshipDetail` page featuring Overview, Description, Eligibility, Benefits, Required Documents, and official external application portal redirects.
