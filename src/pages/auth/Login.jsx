import React, { useState } from 'react';
import { Link, useNavigate, useSearchParams } from 'react-router-dom';
import { LogIn, AlertCircle, ArrowRight, UserPlus, Bookmark, Send } from 'lucide-react';
import { useAuth } from '../../context/AuthContext';
import { getScholarshipBySlug } from '../../services/scholarships';
import { saveScholarship } from '../../services/savedScholarships';
import { addTrackedApplication } from '../../services/trackedApplications';
import { sanitizeRedirect } from '../../utils/formatters';

export default function LoginPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const { login } = useAuth();

  const prompt = searchParams.get('prompt') || searchParams.get('message');
  const redirectUrl = sanitizeRedirect(searchParams.get('redirect'), '/dashboard');

  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [accountNotFound, setAccountNotFound] = useState(false);

  const handleLogin = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError(null);
    setAccountNotFound(false);

    try {
      const session = await login(email, password);

      // Automatically save pending scholarship if one was queued
      const pendingSlug = typeof sessionStorage !== 'undefined' ? sessionStorage.getItem('pending_save_slug') : null;
      if (pendingSlug && session?.user) {
        try {
          const sch = await getScholarshipBySlug(pendingSlug);
          if (sch) {
            await saveScholarship(session.user, sch);
          }
          sessionStorage.removeItem('pending_save_slug');
        } catch (saveErr) {
          console.warn('Auto-save after login warning:', saveErr);
        }
      }

      // Automatically add pending tracked scholarship if one was queued
      const pendingTrackSlug = typeof sessionStorage !== 'undefined' ? sessionStorage.getItem('pending_track_slug') : null;
      if (pendingTrackSlug && session?.user) {
        try {
          const sch = await getScholarshipBySlug(pendingTrackSlug);
          if (sch) {
            await addTrackedApplication(session.user, sch, 'preparing');
          }
          sessionStorage.removeItem('pending_track_slug');
        } catch (trackErr) {
          console.warn('Auto-track after login warning:', trackErr);
        }
      }

      navigate(redirectUrl);
    } catch (err) {
      if (err.code === 'ACCOUNT_NOT_FOUND' || err.message?.toLowerCase().includes('no account found')) {
        setAccountNotFound(true);
      } else {
        setError(err.message || 'An error occurred during login. Please check your credentials.');
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#F5F7FC] flex flex-col justify-center py-16 px-4 sm:px-6 lg:px-8 pt-28">
      <div className="sm:mx-auto sm:w-full sm:max-w-md text-center mb-6">
        <Link to="/" className="inline-flex items-center gap-2.5 mb-4 group">
          <img
            src="/logo.png"
            alt="Ghana Scholarship Portal"
            className="h-12 w-12 object-contain"
          />
          <span className="font-heading font-extrabold text-2xl text-[#050D2B]">
            Ghana<span className="text-[#FFC928]">Scholarship</span>
          </span>
        </Link>
        <h1 className="font-heading font-extrabold text-2xl text-[#101828]">
          Sign in to your account
        </h1>
        <p className="mt-2 text-xs text-[#667085]">
          Manage saved scholarships, track applications, and receive matched alerts.
        </p>
      </div>

      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-6 sm:px-10 rounded-2xl border border-[#E4E7EC] shadow-sm">
          {/* Prompt banner for unauthenticated save attempt */}
          {prompt === 'save' && (
            <div className="mb-5 p-4 bg-blue-50 border border-blue-200 rounded-xl space-y-2.5">
              <div className="flex items-start gap-2.5 text-xs text-blue-900">
                <Bookmark className="w-4 h-4 text-[#173A8A] shrink-0 mt-0.5" />
                <div>
                  <p className="font-bold text-sm">Save Scholarship</p>
                  <p className="mt-0.5 text-blue-800 leading-relaxed">
                    You need to create an account or log in to save scholarships.
                  </p>
                </div>
              </div>
              <div className="pt-2 flex items-center justify-between text-xs border-t border-blue-100">
                <span className="text-blue-700">New student?</span>
                <Link
                  to={`/auth/register?redirect=${encodeURIComponent(redirectUrl)}`}
                  className="font-bold text-[#173A8A] hover:underline inline-flex items-center gap-1"
                >
                  Create an Account / Sign Up Here →
                </Link>
              </div>
            </div>
          )}

          {/* Prompt banner for unauthenticated tracker attempt */}
          {prompt === 'track' && (
            <div className="mb-5 p-4 bg-blue-50 border border-blue-200 rounded-xl space-y-2.5">
              <div className="flex items-start gap-2.5 text-xs text-blue-900">
                <Send className="w-4 h-4 text-[#173A8A] shrink-0 mt-0.5" />
                <div>
                  <p className="font-bold text-sm">Application Progress Tracker</p>
                  <p className="mt-0.5 text-blue-800 leading-relaxed">
                    You need to create an account or log in to track your scholarship applications and deadlines.
                  </p>
                </div>
              </div>
              <div className="pt-2 flex items-center justify-between text-xs border-t border-blue-100">
                <span className="text-blue-700">New student?</span>
                <Link
                  to={`/auth/register?redirect=${encodeURIComponent(redirectUrl)}`}
                  className="font-bold text-[#173A8A] hover:underline inline-flex items-center gap-1"
                >
                  Create an Account / Sign Up Here →
                </Link>
              </div>
            </div>
          )}

          {/* Prompt banner for admin required */}
          {prompt === 'admin_required' && (
            <div className="mb-5 p-4 bg-amber-50 border border-amber-200 rounded-xl flex items-start gap-2.5 text-xs text-amber-900">
              <AlertCircle className="w-4 h-4 text-amber-600 shrink-0 mt-0.5" />
              <div>
                <p className="font-bold text-sm text-amber-800">Administrator Access Required</p>
                <p className="mt-0.5 text-amber-700 leading-relaxed">
                  Please sign in with an authorized administrator account to access the Administration Console.
                </p>
              </div>
            </div>
          )}

          {/* Prompt banner for account deletion */}
          {prompt === 'deleted' && (
            <div className="mb-5 p-4 bg-emerald-50 border border-emerald-200 rounded-xl flex items-start gap-2.5 text-xs text-emerald-900">
              <CheckCircle2 className="w-4 h-4 text-emerald-600 shrink-0 mt-0.5" />
              <div>
                <p className="font-bold text-sm text-emerald-800">Account Deleted</p>
                <p className="mt-0.5 text-emerald-700 leading-relaxed">
                  Your student account, saved scholarships, application records, and profile photo have been permanently deleted from our system.
                </p>
              </div>
            </div>
          )}

          {/* Account Not Found Banner with Direct Sign Up Redirection */}
          {accountNotFound ? (
            <div className="mb-5 p-4 bg-amber-50 border border-amber-200 rounded-xl space-y-3">
              <div className="flex items-start gap-2.5 text-xs text-amber-900">
                <AlertCircle className="w-4 h-4 text-amber-600 shrink-0 mt-0.5" />
                <div>
                  <p className="font-bold text-sm">No account found with this email</p>
                  <p className="mt-0.5 text-amber-800">
                    We could not find an account registered with <strong>{email}</strong>. Would you like to create one now?
                  </p>
                </div>
              </div>
              <div className="pt-1">
                <Link
                  to={`/auth/register?email=${encodeURIComponent(email)}`}
                  className="w-full inline-flex items-center justify-center gap-2 py-2.5 px-3 bg-[#173A8A] text-white font-bold text-xs rounded-xl hover:bg-[#122d6e] transition-colors shadow-2xs"
                >
                  <UserPlus className="w-3.5 h-3.5 text-[#FFC928]" />
                  <span>Create a Student Account with this Email →</span>
                </Link>
              </div>
            </div>
          ) : error && (
            <div className="mb-5 p-3.5 bg-[#FEE2E2] border border-[#FECACA] rounded-xl flex items-center gap-2 text-xs text-[#991B1B]">
              <AlertCircle className="w-4 h-4 flex-shrink-0" />
              <span>{error}</span>
            </div>
          )}

          <form onSubmit={handleLogin} className="space-y-4">
            <div>
              <label className="block text-xs font-semibold text-[#101828] mb-1">
                Email Address
              </label>
              <input
                type="email"
                required
                value={email}
                onChange={(e) => {
                  setEmail(e.target.value);
                  setAccountNotFound(false);
                }}
                placeholder="your.email@example.com"
                className="w-full px-3.5 py-2.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl text-sm text-[#101828] focus:outline-none focus:border-[#173A8A]"
              />
            </div>

            <div>
              <div className="flex items-center justify-between mb-1">
                <label className="block text-xs font-semibold text-[#101828]">
                  Password
                </label>
                <Link
                  to="/auth/reset-password"
                  className="text-[11px] font-semibold text-[#173A8A] hover:underline"
                >
                  Forgot password?
                </Link>
              </div>
              <input
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="••••••••"
                className="w-full px-3.5 py-2.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl text-sm text-[#101828] focus:outline-none focus:border-[#173A8A]"
              />
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full mt-2 flex items-center justify-center gap-2 py-3 px-4 bg-[#FFC928] text-[#050D2B] font-bold text-sm rounded-xl hover:bg-[#FFD84D] transition-colors gold-glow disabled:opacity-50"
            >
              {loading ? (
                'Signing In...'
              ) : (
                <>
                  <LogIn className="w-4 h-4" />
                  <span>Sign In</span>
                </>
              )}
            </button>
          </form>

          <div className="mt-6 pt-6 border-t border-[#E4E7EC] text-center text-xs text-[#667085]">
            Don&apos;t have an account yet?{' '}
            <Link
              to={`/auth/register?${email ? `email=${encodeURIComponent(email)}&` : ''}redirect=${encodeURIComponent(redirectUrl)}`}
              className="font-bold text-[#173A8A] hover:underline"
            >
              Create a free student profile
            </Link>
          </div>
        </div>

        <div className="text-center mt-6">
          <Link
            to="/scholarships"
            className="inline-flex items-center gap-1.5 text-xs text-[#667085] hover:text-[#101828]"
          >
            <span>Continue browsing scholarships without an account</span>
            <ArrowRight className="w-3.5 h-3.5" />
          </Link>
        </div>
      </div>
    </div>
  );
}

export { LoginPage };
