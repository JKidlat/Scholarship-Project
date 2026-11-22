import React, { useState, useEffect } from 'react';
import { Link, useNavigate, useSearchParams } from 'react-router-dom';
import { UserPlus, AlertCircle, CheckCircle2, ArrowRight } from 'lucide-react';
import { useAuth } from '../../context/AuthContext';
import { getScholarshipBySlug } from '../../services/scholarships';
import { saveScholarship } from '../../services/savedScholarships';
import { addTrackedApplication } from '../../services/trackedApplications';
import { sanitizeRedirect } from '../../utils/formatters';

export default function RegisterPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const { register } = useAuth();

  const urlEmail = searchParams.get('email') || '';
  const redirectUrl = sanitizeRedirect(searchParams.get('redirect'), '/dashboard');
  const [fullName, setFullName] = useState('');
  const [email, setEmail] = useState(urlEmail);
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [level, setLevel] = useState('undergraduate');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(false);

  useEffect(() => {
    if (urlEmail) {
      setEmail(urlEmail);
    }
  }, [urlEmail]);

  const handleRegister = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    if (password !== confirmPassword) {
      setError('Passwords do not match. Please ensure both passwords match.');
      setLoading(false);
      return;
    }

    if (password.length < 6) {
      setError('Password must be at least 6 characters in length.');
      setLoading(false);
      return;
    }

    try {
      const session = await register(email, password, fullName, level);
      setSuccess(true);

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
          console.warn('Auto-save after registration warning:', saveErr);
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
          console.warn('Auto-track after registration warning:', trackErr);
        }
      }

      setTimeout(() => {
        navigate(redirectUrl);
      }, 1000);
    } catch (err) {
      setError(err.message || 'An error occurred during registration.');
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
          Create your student account
        </h1>
        <p className="mt-2 text-xs text-[#667085]">
          Personalized alerts, application tracking, and matching opportunities.
        </p>
      </div>

      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-6 sm:px-10 rounded-2xl border border-[#E4E7EC] shadow-sm">
          {success ? (
            <div className="py-8 text-center space-y-4">
              <div className="w-12 h-12 rounded-full bg-[#12A36D]/10 text-[#12A36D] flex items-center justify-center mx-auto">
                <CheckCircle2 className="w-7 h-7" />
              </div>
              <h3 className="font-heading font-bold text-lg text-[#101828]">Account Created Successfully!</h3>
              <p className="text-xs text-[#667085]">
                Your student profile is saved. Redirecting to your dashboard...
              </p>
            </div>
          ) : (
            <>
              {error && (
                <div className="mb-5 p-3.5 bg-[#FEE2E2] border border-[#FECACA] rounded-xl flex items-center gap-2 text-xs text-[#991B1B]">
                  <AlertCircle className="w-4 h-4 flex-shrink-0" />
                  <span>{error}</span>
                </div>
              )}

              <form onSubmit={handleRegister} className="space-y-4">
                <div>
                  <label className="block text-xs font-semibold text-[#101828] mb-1">
                    Full Legal / Student Name <span className="text-[#D92D20]">*</span>
                  </label>
                  <input
                    type="text"
                    required
                    value={fullName}
                    onChange={(e) => setFullName(e.target.value)}
                    placeholder="e.g. Ama Asante"
                    className="w-full px-3.5 py-2.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl text-sm text-[#101828] focus:outline-none focus:border-[#173A8A]"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-[#101828] mb-1">
                    Email Address <span className="text-[#D92D20]">*</span>
                  </label>
                  <input
                    type="email"
                    required
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="ama.asante@example.com"
                    className="w-full px-3.5 py-2.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl text-sm text-[#101828] focus:outline-none focus:border-[#173A8A]"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-[#101828] mb-1">
                    Current Educational Level
                  </label>
                  <select
                    value={level}
                    onChange={(e) => setLevel(e.target.value)}
                    className="w-full px-3.5 py-2.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl text-sm text-[#101828] focus:outline-none focus:border-[#173A8A]"
                  >
                    <option value="undergraduate">Undergraduate Student</option>
                    <option value="postgraduate">Postgraduate / Master&apos;s</option>
                    <option value="phd">PhD / Doctorate</option>
                    <option value="shs">Senior High School (SHS)</option>
                    <option value="diploma">Diploma / HND</option>
                    <option value="other">Other Academic Level</option>
                  </select>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-[#101828] mb-1">
                    Password <span className="text-[#D92D20]">*</span>
                  </label>
                  <input
                    type="password"
                    required
                    minLength={6}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="At least 6 characters"
                    className="w-full px-3.5 py-2.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl text-sm text-[#101828] focus:outline-none focus:border-[#173A8A]"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-[#101828] mb-1">
                    Confirm Password <span className="text-[#D92D20]">*</span>
                  </label>
                  <input
                    type="password"
                    required
                    minLength={6}
                    value={confirmPassword}
                    onChange={(e) => setConfirmPassword(e.target.value)}
                    placeholder="Re-enter your password"
                    className="w-full px-3.5 py-2.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl text-sm text-[#101828] focus:outline-none focus:border-[#173A8A]"
                  />
                </div>

                <button
                  type="submit"
                  disabled={loading}
                  className="w-full mt-2 flex items-center justify-center gap-2 py-3 px-4 bg-[#FFC928] text-[#050D2B] font-bold text-sm rounded-xl hover:bg-[#FFD84D] transition-colors gold-glow disabled:opacity-50"
                >
                  {loading ? (
                    'Creating Account...'
                  ) : (
                    <>
                      <UserPlus className="w-4 h-4" />
                      <span>Sign Up Free</span>
                    </>
                  )}
                </button>
              </form>

              <div className="mt-6 pt-6 border-t border-[#E4E7EC] text-center text-xs text-[#667085]">
                Already have an account?{' '}
                <Link to="/auth/login" className="font-bold text-[#173A8A] hover:underline">
                  Sign in here
                </Link>
              </div>
            </>
          )}
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

export { RegisterPage };
