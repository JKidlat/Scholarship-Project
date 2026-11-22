import React, { useState, useEffect } from 'react';
import { Navigate, useLocation, Link } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import { checkIsAdmin } from '../../services/auth';
import { ShieldAlert, ArrowLeft, LogOut, LayoutDashboard } from 'lucide-react';

/**
 * AdminRoute
 * Security Guard protecting all /admin routes.
 * Enforces authentication and administrator role verification.
 */
export function AdminRoute({ children }) {
  const { user, loading: authLoading, logout } = useAuth();
  const location = useLocation();
  const [isAdmin, setIsAdmin] = useState(null);
  const [checkingRole, setCheckingRole] = useState(true);

  useEffect(() => {
    let isMounted = true;

    async function verifyRole() {
      if (!user) {
        if (isMounted) {
          setIsAdmin(false);
          setCheckingRole(false);
        }
        return;
      }

      try {
        const hasAdminRole = await checkIsAdmin(user);
        if (isMounted) {
          setIsAdmin(hasAdminRole);
        }
      } catch (err) {
        console.error('Error verifying admin authorization:', err);
        if (isMounted) setIsAdmin(false);
      } finally {
        if (isMounted) setCheckingRole(false);
      }
    }

    if (!authLoading) {
      verifyRole();
    }

    return () => {
      isMounted = false;
    };
  }, [user, authLoading]);

  // Loading state
  if (authLoading || checkingRole) {
    return (
      <div className="min-h-screen bg-[#050D2B] flex items-center justify-center">
        <div className="flex flex-col items-center gap-3 text-white">
          <div className="w-10 h-10 border-3 border-[#FFC928]/20 border-t-[#FFC928] rounded-full animate-spin" />
          <span className="text-xs font-semibold uppercase tracking-widest text-slate-300">
            Verifying Admin Credentials...
          </span>
        </div>
      </div>
    );
  }

  // Not authenticated -> Redirect to Login
  if (!user) {
    return (
      <Navigate
        to={`/auth/login?redirect=${encodeURIComponent(location.pathname)}&prompt=admin_required`}
        replace
      />
    );
  }

  // Authenticated but lacks admin role -> Access Denied Screen
  if (!isAdmin) {
    return (
      <div className="min-h-screen bg-[#F5F7FC] flex items-center justify-center p-4">
        <div className="max-w-md w-full bg-white rounded-3xl border border-rose-200 p-8 shadow-card text-center space-y-5">
          <div className="w-16 h-16 rounded-2xl bg-rose-50 text-rose-600 flex items-center justify-center mx-auto border border-rose-100">
            <ShieldAlert className="w-8 h-8" />
          </div>

          <div>
            <span className="text-[11px] font-bold uppercase tracking-wider text-rose-600 bg-rose-50 px-3 py-1 rounded-full border border-rose-100">
              Access Restricted
            </span>
            <h1 className="font-heading font-extrabold text-xl text-slate-900 mt-3">
              Administrator Privileges Required
            </h1>
            <p className="text-xs text-slate-500 mt-2 leading-relaxed">
              You are currently signed in as <strong className="text-slate-800">{user.email}</strong>, but this account is not registered in the system's authorized administrators roster.
            </p>
          </div>

          <div className="pt-2 space-y-2.5">
            <Link
              to="/"
              className="w-full inline-flex items-center justify-center gap-2 px-5 py-2.5 bg-royal text-white font-bold text-xs rounded-xl hover:bg-navy-dark transition-colors"
            >
              <ArrowLeft className="w-3.5 h-3.5" />
              <span>Return to Public Portal</span>
            </Link>

            <Link
              to="/dashboard"
              className="w-full inline-flex items-center justify-center gap-2 px-5 py-2.5 bg-slate-100 text-slate-700 font-semibold text-xs rounded-xl hover:bg-slate-200 transition-colors"
            >
              <LayoutDashboard className="w-3.5 h-3.5" />
              <span>Go to Student Portal</span>
            </Link>

            <button
              type="button"
              onClick={async () => {
                await logout();
                window.location.href = `/auth/login?redirect=${encodeURIComponent(location.pathname)}&prompt=admin_required`;
              }}
              className="w-full inline-flex items-center justify-center gap-2 px-5 py-2.5 text-xs font-semibold text-rose-600 hover:bg-rose-50 rounded-xl transition-colors"
            >
              <LogOut className="w-3.5 h-3.5" />
              <span>Sign Out &amp; Use Admin Account</span>
            </button>
          </div>
        </div>
      </div>
    );
  }

  // Authorized Admin -> Render Child Routes
  return children;
}

export default AdminRoute;
