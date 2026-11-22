/**
 * @file AdminOverview.jsx
 * @description Central administrative dashboard for directory operators.
 *
 * Responsibilities:
 * - Aggregates platform metrics (total scholarships, verified status, active views, clicks)
 * - Highlights recently listed or updated opportunities
 * - Offers one-click cache invalidation and quick actions for new scholarship creation & spreadsheet imports
 */

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { getAnalyticsSummary, getAllScholarships, invalidateScholarshipCache } from '../../services/scholarships';
import { Button } from '../../components/common/Button';
import { StatusBadge } from '../../components/common/StatusBadge';
import { formatDate } from '../../utils/formatters';
import {
  GraduationCap,
  Clock,
  AlertTriangle,
  UploadCloud,
  PlusCircle,
  CheckCircle,
  XCircle,
  Eye,
  Heart,
  MousePointerClick,
  Users,
  FileSpreadsheet,
  ArrowRight,
  ShieldCheck,
  TrendingUp,
  Globe,
  MapPin,
  EyeOff,
  RefreshCw,
} from 'lucide-react';

export default function AdminOverview() {
  const [summary, setSummary] = useState(null);
  const [recentListings, setRecentListings] = useState([]);
  const [loading, setLoading] = useState(true);

  async function loadAdminData(forceRefresh = false) {
    setLoading(true);
    if (forceRefresh) {
      invalidateScholarshipCache();
    }
    try {
      const [stats, all] = await Promise.all([
        getAnalyticsSummary('all'),
        getAllScholarships(),
      ]);
      setSummary(stats);
      setRecentListings(all.slice(0, 8));
    } catch (err) {
      console.error('Error fetching admin overview:', err);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    loadAdminData();
  }, []);

  if (loading || !summary) {
    return (
      <div className="space-y-6">
        <div className="h-8 w-48 bg-slate-200 animate-pulse rounded"></div>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {[...Array(8)].map((_, i) => (
            <div key={i} className="h-28 bg-white rounded-xl border border-slate-200 animate-pulse"></div>
          ))}
        </div>
        <div className="h-72 bg-white rounded-xl border border-slate-200 animate-pulse"></div>
      </div>
    );
  }

  const statCards = [
    { label: 'Total Scholarships Hosted', value: summary.totalScholarships || 0, icon: GraduationCap, color: 'text-royal bg-royal/10' },
    { label: 'Local (Ghana)', value: summary.localCount || 0, icon: MapPin, color: 'text-emerald-700 bg-emerald-50' },
    { label: 'International Opportunities', value: summary.internationalCount || 0, icon: Globe, color: 'text-indigo-600 bg-indigo-50' },
    { label: 'Currently Open', value: summary.openCount || 0, icon: CheckCircle, color: 'text-teal-600 bg-teal-50' },
    { label: 'Closed Opportunities', value: summary.closedCount || 0, icon: XCircle, color: 'text-rose-600 bg-rose-50' },
    { label: 'Awaiting Verification', value: summary.unverifiedCount || 0, icon: AlertTriangle, color: 'text-amber-600 bg-amber-50' },
    { label: 'Draft / Unpublished', value: summary.unpublishedCount || 0, icon: EyeOff, color: 'text-slate-600 bg-slate-100' },
    { label: 'Total Page Views', value: summary.viewsCount || 0, icon: Eye, color: 'text-blue-600 bg-blue-50' },
  ];

  return (
    <div className="space-y-8">
      {/* Page Title & Quick Actions */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold font-heading text-navy-deep">System Administration Overview</h1>
          <p className="text-sm text-slate-500 mt-1">
            Real-time status of Ghanaian scholarship inventory, international opportunities, data quality, and student traffic.
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-2.5">
          <button
            onClick={() => loadAdminData(true)}
            className="p-2 text-slate-500 hover:text-royal hover:bg-slate-100 rounded-lg transition-colors border border-slate-200 bg-white"
            title="Refresh statistics from database"
          >
            <RefreshCw className="w-4 h-4" />
          </button>
          <Link to="/admin/import">
            <Button variant="outline" size="sm" className="flex items-center gap-1.5 bg-white">
              <UploadCloud className="w-4 h-4 text-royal" />
              <span>Import Database</span>
            </Button>
          </Link>
          <Link to="/admin/scholarships/new">
            <Button variant="primary" size="sm" className="flex items-center gap-1.5">
              <PlusCircle className="w-4 h-4" />
              <span>Add Scholarship</span>
            </Button>
          </Link>
        </div>
      </div>

      {/* 8 Primary KPI Cards */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        {statCards.map((card, i) => {
          const Icon = card.icon;
          return (
            <div
              key={i}
              className="bg-white p-5 rounded-xl border border-slate-200/80 shadow-xs flex items-start justify-between hover:border-royal/30 transition-all"
            >
              <div>
                <p className="text-xs font-semibold text-slate-500 uppercase tracking-wider">{card.label}</p>
                <h3 className="text-2xl font-black text-navy-deep mt-2">{card.value.toLocaleString()}</h3>
              </div>
              <div className={`p-2.5 rounded-lg ${card.color}`}>
                <Icon className="w-5 h-5" />
              </div>
            </div>
          );
        })}
      </div>

      {/* Fast Navigation Banners */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <Link
          to="/admin/verification"
          className="p-5 bg-gradient-to-br from-amber-50 to-amber-100/50 rounded-xl border border-amber-200/80 flex items-center justify-between hover:shadow-sm transition-all group"
        >
          <div className="flex items-center gap-3.5">
            <div className="w-10 h-10 rounded-lg bg-amber-500 text-white flex items-center justify-center font-bold">
              <ShieldCheck className="w-5 h-5" />
            </div>
            <div>
              <h4 className="font-bold text-navy-deep text-sm group-hover:text-amber-800 transition-colors">
                Verification Queue
              </h4>
              <p className="text-xs text-slate-600 mt-0.5">{summary.unverifiedCount} listings require review</p>
            </div>
          </div>
          <ArrowRight className="w-4 h-4 text-amber-700 group-hover:translate-x-1 transition-transform" />
        </Link>

        <Link
          to="/admin/analytics"
          className="p-5 bg-gradient-to-br from-blue-50 to-blue-100/50 rounded-xl border border-blue-200/80 flex items-center justify-between hover:shadow-sm transition-all group"
        >
          <div className="flex items-center gap-3.5">
            <div className="w-10 h-10 rounded-lg bg-royal text-white flex items-center justify-center font-bold">
              <TrendingUp className="w-5 h-5" />
            </div>
            <div>
              <h4 className="font-bold text-navy-deep text-sm group-hover:text-royal transition-colors">
                Analytics & Engagement
              </h4>
              <p className="text-xs text-slate-600 mt-0.5">Explore charts and student queries</p>
            </div>
          </div>
          <ArrowRight className="w-4 h-4 text-royal group-hover:translate-x-1 transition-transform" />
        </Link>

        <Link
          to="/admin/import"
          className="p-5 bg-gradient-to-br from-emerald-50 to-emerald-100/50 rounded-xl border border-emerald-200/80 flex items-center justify-between hover:shadow-sm transition-all group"
        >
          <div className="flex items-center gap-3.5">
            <div className="w-10 h-10 rounded-lg bg-emerald-600 text-white flex items-center justify-center font-bold">
              <FileSpreadsheet className="w-5 h-5" />
            </div>
            <div>
              <h4 className="font-bold text-navy-deep text-sm group-hover:text-emerald-800 transition-colors">
                Excel / CSV Importer
              </h4>
              <p className="text-xs text-slate-600 mt-0.5">Auto-categorise new opportunities</p>
            </div>
          </div>
          <ArrowRight className="w-4 h-4 text-emerald-700 group-hover:translate-x-1 transition-transform" />
        </Link>
      </div>

      {/* Recent Opportunities Table */}
      <div className="bg-white rounded-xl border border-slate-200/80 shadow-xs overflow-hidden">
        <div className="p-5 border-b border-slate-100 flex items-center justify-between">
          <div>
            <h2 className="font-bold text-navy-deep text-base">Recently Added Opportunities</h2>
            <p className="text-xs text-slate-500 mt-0.5">Last updated records across institutions and providers</p>
          </div>
          <Link
            to="/admin/scholarships"
            className="text-xs font-semibold text-royal hover:underline flex items-center gap-1"
          >
            View All Scholarships ({summary.totalScholarships}) →
          </Link>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50/75 border-b border-slate-200 text-slate-500 font-medium text-xs uppercase tracking-wider">
              <tr>
                <th className="py-3 px-4">Title</th>
                <th className="py-3 px-4">Provider / Institution</th>
                <th className="py-3 px-4 text-center">Status</th>
                <th className="py-3 px-4">Deadline</th>
                <th className="py-3 px-4 text-center">Verified</th>
                <th className="py-3 px-4 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {recentListings.map((s) => {
                const title = s.title || s.name || 'Untitled Opportunity';
                const provider = typeof s.provider === 'object' ? s.provider?.name : (s.provider || 'Various');
                const status = s.application_status || s.status || 'open';
                const isVerified = s.is_verified || s.verification_status === 'verified';

                return (
                  <tr key={s.id} className="hover:bg-slate-50/60 transition-colors">
                    <td className="py-3 px-4">
                      <Link
                        to={`/scholarship/${s.slug}`}
                        className="font-medium text-navy-deep hover:text-royal line-clamp-1"
                      >
                        {title}
                      </Link>
                    </td>
                    <td className="py-3 px-4 text-slate-600 text-xs">
                      {provider}
                    </td>
                    <td className="py-3 px-4 text-center">
                      <StatusBadge status={status} />
                    </td>
                    <td className="py-3 px-4 text-xs text-slate-500 whitespace-nowrap">
                      {formatDate(s.application_deadline || s.deadline)}
                    </td>
                    <td className="py-3 px-4 text-center">
                      {isVerified ? (
                        <span className="inline-flex items-center text-emerald-600 text-xs font-semibold">
                          <CheckCircle className="w-4 h-4 mr-1" />
                          Verified
                        </span>
                      ) : (
                        <span className="inline-flex items-center text-amber-600 text-xs font-semibold">
                          <AlertTriangle className="w-4 h-4 mr-1" />
                          Pending
                        </span>
                      )}
                    </td>
                    <td className="py-3 px-4 text-right">
                      <Link
                        to={`/admin/scholarships/edit/${s.id}`}
                        className="text-xs text-royal font-medium hover:underline"
                      >
                        Edit
                      </Link>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export { AdminOverview };
