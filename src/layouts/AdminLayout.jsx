import React from 'react';
import { Link, Outlet, useLocation } from 'react-router-dom';
import {
  LayoutDashboard,
  GraduationCap,
  PlusCircle,
  Upload,
  Tags,
  Building2,
  Users,
  BarChart3,
  ShieldCheck,
  Settings,
  ArrowLeft,
  Lock,
} from 'lucide-react';
import { useAuth } from '../context/AuthContext';

const adminNav = [
  { label: 'Dashboard', href: '/admin', exact: true, icon: LayoutDashboard },
  { label: 'All Scholarships', href: '/admin/scholarships', exact: true, icon: GraduationCap },
  { label: 'Add Scholarship', href: '/admin/scholarships/new', icon: PlusCircle },
  { label: 'Import Database', href: '/admin/import', icon: Upload },
  { label: 'Categories', href: '/admin/categories', icon: Tags },
  { label: 'Providers & Institutions', href: '/admin/institutions', icon: Building2 },
  { label: 'Users', href: '/admin/users', icon: Users },
  { label: 'Analytics', href: '/admin/analytics', icon: BarChart3 },
  { label: 'Verification & Quality', href: '/admin/verification', icon: ShieldCheck },
  { label: 'Settings', href: '/admin/settings', icon: Settings },
];

export default function AdminLayout() {
  const location = useLocation();
  const { user } = useAuth();

  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-20">
      {/* Admin Top Banner */}
      <div className="bg-[#050D2B] text-white border-b border-white/10 py-3.5">
        <div className="site-container flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-lg bg-[#FFC928] text-[#050D2B] flex items-center justify-center font-black">
              <ShieldCheck className="w-5 h-5" />
            </div>
            <div>
              <div className="flex items-center gap-2">
                <span className="font-heading font-extrabold text-sm tracking-wide text-white">
                  ADMINISTRATION CONSOLE
                </span>
                <span className="px-2 py-0.5 rounded-full bg-emerald-500/20 text-emerald-300 text-[10px] font-bold">
                  Authorized Admin
                </span>
              </div>
              <span className="text-[11px] text-white/60 block">
                Logged in as: {user?.email || 'admin@ghanascholarships.gov.gh'}
              </span>
            </div>
          </div>

          <Link
            to="/"
            className="flex items-center gap-1.5 text-xs text-white/80 hover:text-[#FFC928] transition-colors bg-white/5 hover:bg-white/10 px-3 py-1.5 rounded-lg border border-white/10"
          >
            <ArrowLeft className="w-3.5 h-3.5" />
            <span>Public Website</span>
          </Link>
        </div>
      </div>

      {/* Admin Nav Strip with all 10 sections */}
      <div className="bg-white border-b border-[#E4E7EC] sticky top-16 z-30 shadow-xs">
        <div className="site-container">
          <div className="flex overflow-x-auto gap-1 py-2 no-scrollbar">
            {adminNav.map((item) => {
              const Icon = item.icon;
              const isActive = item.exact
                ? location.pathname === item.href
                : location.pathname.startsWith(item.href);

              return (
                <Link
                  key={item.href}
                  to={item.href}
                  className={`flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs font-semibold whitespace-nowrap transition-colors ${
                    isActive
                      ? 'bg-[#173A8A] text-white shadow-sm'
                      : 'text-[#667085] hover:text-[#101828] hover:bg-[#F5F7FC]'
                  }`}
                >
                  <Icon className="w-3.5 h-3.5 shrink-0" />
                  <span>{item.label}</span>
                </Link>
              );
            })}
          </div>
        </div>
      </div>

      {/* Admin Content Body */}
      <div className="site-container py-8">
        <Outlet />
      </div>
    </div>
  );
}

export { AdminLayout };
