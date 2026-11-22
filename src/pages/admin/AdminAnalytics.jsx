import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { getAnalyticsSummary } from '../../services/scholarships';
import {
  TrendingUp,
  Eye,
  Heart,
  MousePointerClick,
  GraduationCap,
  AlertTriangle,
  BarChart3,
  Calendar,
  Building2,
  CheckCircle,
  XCircle,
  Clock,
  Search,
} from 'lucide-react';

export default function AdminAnalytics() {
  const [period, setPeriod] = useState('all');
  const [summary, setSummary] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadData() {
      setLoading(true);
      try {
        const data = await getAnalyticsSummary(period);
        setSummary(data);
      } catch (err) {
        console.error('Error fetching analytics summary:', err);
      } finally {
        setLoading(false);
      }
    }
    loadData();
  }, [period]);

  const periods = [
    { key: '7d', label: 'Last 7 Days' },
    { key: '30d', label: 'Last 30 Days' },
    { key: '90d', label: 'Last 90 Days' },
    { key: '12m', label: 'Last 12 Months' },
    { key: 'all', label: 'All Time' },
  ];

  if (loading || !summary) {
    return (
      <div className="space-y-6">
        <div className="h-8 w-48 bg-slate-200 animate-pulse rounded"></div>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {[...Array(4)].map((_, i) => (
            <div key={i} className="h-28 bg-slate-100 rounded-xl animate-pulse"></div>
          ))}
        </div>
        <div className="h-64 bg-slate-100 rounded-xl animate-pulse"></div>
      </div>
    );
  }

  const kpis = [
    { label: 'Total Scholarships', value: summary.totalScholarships, icon: GraduationCap, color: 'text-royal bg-royal/10' },
    { label: 'Open Opportunities', value: summary.openCount, icon: CheckCircle, color: 'text-emerald-600 bg-emerald-50' },
    { label: 'Closed Opportunities', value: summary.closedCount, icon: XCircle, color: 'text-rose-600 bg-rose-50' },
    { label: 'Needs Verification', value: summary.unverifiedCount, icon: AlertTriangle, color: 'text-amber-600 bg-amber-50' },
    { label: 'Total Page Views', value: summary.viewsCount, icon: Eye, color: 'text-blue-600 bg-blue-50' },
    { label: 'Total Saved', value: summary.savesCount, icon: Heart, color: 'text-pink-600 bg-pink-50' },
    { label: 'Apply Button Clicks', value: summary.applyClicks, icon: MousePointerClick, color: 'text-gold bg-gold/10' },
  ];

  const maxStatus = Math.max(...Object.values(summary.statusCounts), 1);
  const maxLevel = Math.max(...Object.values(summary.levelCounts), 1);

  return (
    <div className="space-y-8">
      {/* Header & Period Filter */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold font-heading text-navy-deep">Analytics & Insights</h1>
          <p className="text-sm text-slate-500 mt-1">Platform performance, student engagement, and inventory trends.</p>
        </div>

        <div className="inline-flex p-1 bg-slate-100 rounded-lg border border-slate-200 self-start sm:self-auto">
          {periods.map((p) => (
            <button
              key={p.key}
              onClick={() => setPeriod(p.key)}
              className={`px-3 py-1.5 text-xs font-medium rounded-md transition-all ${
                period === p.key
                  ? 'bg-white text-navy-deep shadow-sm font-semibold'
                  : 'text-slate-600 hover:text-navy-deep'
              }`}
            >
              {p.label}
            </button>
          ))}
        </div>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        {kpis.map((kpi, idx) => {
          const Icon = kpi.icon;
          return (
            <div key={idx} className="bg-white p-5 rounded-xl border border-slate-200/80 shadow-sm flex items-start justify-between">
              <div>
                <p className="text-xs font-medium text-slate-500 uppercase tracking-wider">{kpi.label}</p>
                <p className="text-2xl font-bold text-navy-deep mt-2">{kpi.value.toLocaleString()}</p>
              </div>
              <div className={`p-2.5 rounded-lg ${kpi.color}`}>
                <Icon className="w-5 h-5" />
              </div>
            </div>
          );
        })}
      </div>

      {/* Charts Section: Status & Study Level */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Status Distribution */}
        <div className="bg-white p-6 rounded-xl border border-slate-200/80 shadow-sm">
          <h2 className="text-base font-bold text-navy-deep mb-4 flex items-center gap-2">
            <BarChart3 className="w-5 h-5 text-royal" />
            Scholarships by Application Status
          </h2>
          <div className="space-y-4">
            {Object.entries(summary.statusCounts).map(([status, count]) => {
              const pct = Math.round((count / (summary.totalScholarships || 1)) * 100);
              const barWidth = Math.round((count / maxStatus) * 100);
              return (
                <div key={status} className="space-y-1.5">
                  <div className="flex justify-between text-xs font-medium text-slate-600">
                    <span className="capitalize">{status}</span>
                    <span>{count} ({pct}%)</span>
                  </div>
                  <div className="w-full bg-slate-100 rounded-full h-3 overflow-hidden">
                    <div
                      className={`h-full rounded-full transition-all duration-500 ${
                        status === 'open'
                          ? 'bg-emerald-500'
                          : status === 'closed'
                          ? 'bg-rose-500'
                          : status === 'rolling'
                          ? 'bg-royal'
                          : 'bg-slate-400'
                      }`}
                      style={{ width: `${barWidth}%` }}
                    />
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* Study Level Distribution */}
        <div className="bg-white p-6 rounded-xl border border-slate-200/80 shadow-sm">
          <h2 className="text-base font-bold text-navy-deep mb-4 flex items-center gap-2">
            <GraduationCap className="w-5 h-5 text-gold" />
            Opportunities by Academic Level
          </h2>
          <div className="space-y-4">
            {Object.entries(summary.levelCounts).map(([level, count]) => {
              const pct = Math.round((count / (summary.totalScholarships || 1)) * 100);
              const barWidth = Math.round((count / maxLevel) * 100);
              return (
                <div key={level} className="space-y-1.5">
                  <div className="flex justify-between text-xs font-medium text-slate-600">
                    <span className="capitalize">{level}</span>
                    <span>{count} ({pct}%)</span>
                  </div>
                  <div className="w-full bg-slate-100 rounded-full h-3 overflow-hidden">
                    <div
                      className="h-full bg-navy-deep rounded-full transition-all duration-500"
                      style={{ width: `${barWidth}%` }}
                    />
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </div>

      {/* Funding Types & Top Search Terms */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Funding Breakdown */}
        <div className="bg-white p-6 rounded-xl border border-slate-200/80 shadow-sm">
          <h2 className="text-base font-bold text-navy-deep mb-4">Funding Coverage Breakdown</h2>
          <div className="divide-y divide-slate-100">
            {Object.entries(summary.fundingCounts).map(([type, count]) => (
              <div key={type} className="py-2.5 flex items-center justify-between text-sm">
                <span className="text-slate-700 capitalize">{type.replace(/_/g, ' ')}</span>
                <span className="font-semibold text-navy-deep bg-slate-100 px-2.5 py-0.5 rounded-full text-xs">
                  {count} scholarships
                </span>
              </div>
            ))}
          </div>
        </div>

        {/* Top Search Terms */}
        <div className="bg-white p-6 rounded-xl border border-slate-200/80 shadow-sm">
          <h2 className="text-base font-bold text-navy-deep mb-4 flex items-center gap-2">
            <Search className="w-4 h-4 text-royal" />
            Top Student Search Queries
          </h2>
          {summary.topSearchTerms && summary.topSearchTerms.length > 0 ? (
            <div className="divide-y divide-slate-100">
              {summary.topSearchTerms.map(([term, count], i) => (
                <div key={i} className="py-2.5 flex items-center justify-between text-sm">
                  <span className="text-slate-700 font-medium">"{term}"</span>
                  <span className="text-xs text-slate-500">{count} searches</span>
                </div>
              ))}
            </div>
          ) : (
            <p className="text-sm text-slate-400 py-8 text-center">No search term trends recorded in this period yet.</p>
          )}
        </div>
      </div>

      {/* Top Institutions and Providers */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white p-6 rounded-xl border border-slate-200/80 shadow-sm">
          <h2 className="text-base font-bold text-navy-deep mb-4 flex items-center gap-2">
            <Building2 className="w-4 h-4 text-royal" />
            Top Institutions Represented
          </h2>
          <div className="space-y-2">
            {Object.entries(summary.institutionCounts)
              .sort((a, b) => b[1] - a[1])
              .slice(0, 8)
              .map(([inst, count], i) => (
                <div key={i} className="flex justify-between items-center py-1.5 text-sm border-b border-slate-50 last:border-0">
                  <span className="text-slate-700 truncate pr-4">{inst}</span>
                  <span className="font-semibold text-royal text-xs bg-royal/10 px-2 py-0.5 rounded">
                    {count}
                  </span>
                </div>
              ))}
          </div>
        </div>

        <div className="bg-white p-6 rounded-xl border border-slate-200/80 shadow-sm">
          <h2 className="text-base font-bold text-navy-deep mb-4 flex items-center gap-2">
            <TrendingUp className="w-4 h-4 text-royal" />
            Top Scholarship Providers
          </h2>
          <div className="space-y-2">
            {Object.entries(summary.providerCounts)
              .sort((a, b) => b[1] - a[1])
              .slice(0, 8)
              .map(([prov, count], i) => (
                <div key={i} className="flex justify-between items-center py-1.5 text-sm border-b border-slate-50 last:border-0">
                  <span className="text-slate-700 truncate pr-4">{prov}</span>
                  <span className="font-semibold text-navy-deep text-xs bg-slate-100 px-2 py-0.5 rounded">
                    {count}
                  </span>
                </div>
              ))}
          </div>
        </div>
      </div>
    </div>
  );
}

export { AdminAnalytics };
