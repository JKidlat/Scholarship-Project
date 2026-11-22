import React, { lazy, Suspense } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';

// Layouts (Static for instantaneous frame rendering)
import MainLayout from './layouts/MainLayout';
import AdminLayout from './layouts/AdminLayout';
import { AdminRoute } from './components/admin/AdminRoute';
import { ErrorBoundary } from './components/common/ErrorBoundary';

// Public Pages (Code-split for lightning fast initial load)
const Home = lazy(() => import('./pages/Home'));
const Scholarships = lazy(() => import('./pages/Scholarships'));
const ScholarshipDetail = lazy(() => import('./pages/ScholarshipDetail'));

// Curated Category Pages
const Undergraduate = lazy(() => import('./pages/curated/Undergraduate'));
const Postgraduate = lazy(() => import('./pages/curated/Postgraduate'));
const International = lazy(() => import('./pages/curated/International'));
const ForWomen = lazy(() => import('./pages/curated/ForWomen'));
const InstitutionSpecific = lazy(() => import('./pages/curated/InstitutionSpecific'));
const PublicInstitution = lazy(() => import('./pages/curated/PublicInstitution'));

// Institutional & Legal Pages
const About = lazy(() => import('./pages/About'));
const Contact = lazy(() => import('./pages/Contact'));
const PrivacyPolicy = lazy(() => import('./pages/PrivacyPolicy'));
const TermsOfUse = lazy(() => import('./pages/TermsOfUse'));
const Disclaimer = lazy(() => import('./pages/Disclaimer'));

// Authentication & Student Dashboard
const Login = lazy(() => import('./pages/auth/Login'));
const Register = lazy(() => import('./pages/auth/Register'));
const ResetPassword = lazy(() => import('./pages/auth/ResetPassword'));
const Dashboard = lazy(() => import('./pages/dashboard/Dashboard'));

// Admin Pages
const AdminOverview = lazy(() => import('./pages/admin/AdminOverview'));
const AdminScholarships = lazy(() => import('./pages/admin/AdminScholarships'));
const AdminNewScholarship = lazy(() => import('./pages/admin/AdminNewScholarship'));
const AdminEditScholarship = lazy(() => import('./pages/admin/AdminEditScholarship'));
const AdminVerification = lazy(() => import('./pages/admin/AdminVerification'));
const AdminImport = lazy(() => import('./pages/admin/AdminImport'));
const AdminAnalytics = lazy(() => import('./pages/admin/AdminAnalytics'));
const AdminCategories = lazy(() => import('./pages/admin/AdminCategories'));
const AdminInstitutions = lazy(() => import('./pages/admin/AdminInstitutions'));
const AdminUsers = lazy(() => import('./pages/admin/AdminUsers'));
const AdminSettings = lazy(() => import('./pages/admin/AdminSettings'));

function PageLoader() {
  return (
    <div className="min-h-[60vh] flex items-center justify-center bg-[#F5F7FC]">
      <div className="flex flex-col items-center gap-3">
        <div className="w-10 h-10 border-3 border-royal/20 border-t-royal rounded-full animate-spin" />
        <span className="text-xs font-semibold text-slate-500 uppercase tracking-widest">
          Loading Opportunity...
        </span>
      </div>
    </div>
  );
}

export default function App() {
  return (
    <BrowserRouter>
      <Suspense fallback={<PageLoader />}>
        <Routes>
          {/* Public & Student Application Routes */}
          <Route element={<ErrorBoundary fallbackTitle="Ghana Scholarship Portal" fallbackLink="/"><MainLayout /></ErrorBoundary>}>
            <Route path="/" element={<Home />} />
            <Route path="/scholarships" element={<Scholarships />} />
            <Route path="/scholarships/undergraduate" element={<Undergraduate />} />
            <Route path="/scholarships/postgraduate" element={<Postgraduate />} />
            <Route path="/scholarships/international" element={<International />} />
            <Route path="/scholarships/for-women" element={<ForWomen />} />
            <Route path="/scholarships/institution-specific" element={<InstitutionSpecific />} />
            <Route path="/scholarships/public-institution" element={<PublicInstitution />} />
            <Route path="/scholarship/:slug" element={<ScholarshipDetail />} />

            <Route path="/about" element={<About />} />
            <Route path="/contact" element={<Contact />} />
            <Route path="/privacy-policy" element={<PrivacyPolicy />} />
            <Route path="/terms-of-use" element={<TermsOfUse />} />
            <Route path="/disclaimer" element={<Disclaimer />} />

            <Route path="/auth/login" element={<Login />} />
            <Route path="/auth/register" element={<Register />} />
            <Route path="/auth/reset-password" element={<ResetPassword />} />
            <Route path="/dashboard" element={<Dashboard />} />
            <Route path="/portal" element={<Navigate to="/dashboard" replace />} />
            <Route path="/student-portal" element={<Navigate to="/dashboard" replace />} />
            <Route path="/saved-scholarships" element={<Navigate to="/dashboard" replace />} />
          </Route>

          {/* Administration & Importer Console (Protected by AdminRoute) */}
          <Route
            path="/admin"
            element={
              <ErrorBoundary fallbackTitle="Administration Console Error" fallbackLink="/admin">
                <AdminRoute>
                  <AdminLayout />
                </AdminRoute>
              </ErrorBoundary>
            }
          >
            <Route index element={<AdminOverview />} />
            <Route path="scholarships" element={<AdminScholarships />} />
            <Route path="scholarships/new" element={<AdminNewScholarship />} />
            <Route path="scholarships/edit/:id" element={<AdminEditScholarship />} />
            <Route path="verification" element={<AdminVerification />} />
            <Route path="import" element={<AdminImport />} />
            <Route path="analytics" element={<AdminAnalytics />} />
            <Route path="categories" element={<AdminCategories />} />
            <Route path="institutions" element={<AdminInstitutions />} />
            <Route path="users" element={<AdminUsers />} />
            <Route path="settings" element={<AdminSettings />} />
          </Route>

          {/* Catch-all redirect */}
          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </Suspense>
    </BrowserRouter>
  );
}
