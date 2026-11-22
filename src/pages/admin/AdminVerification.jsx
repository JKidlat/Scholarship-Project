import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { getAllScholarships, updateScholarship } from '../../services/scholarships';
import { Button } from '../../components/common/Button';
import { formatDate } from '../../utils/formatters';
import {
  CheckCircle,
  XCircle,
  ExternalLink,
  ShieldCheck,
  AlertTriangle,
  Globe,
  Trash2,
  FileQuestion,
  Link2Off,
  Clock,
  Edit2,
  Layers,
  Sparkles,
} from 'lucide-react';

export default function AdminVerification() {
  const [scholarships, setScholarships] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  async function loadData() {
    setLoading(true);
    try {
      const data = await getAllScholarships();
      setScholarships(data || []);
    } catch (err) {
      console.error('Error loading verification data:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleVerify(id) {
    try {
      await updateScholarship(id, {
        is_verified: true,
        verification_status: 'verified',
      });
      setScholarships((prev) =>
        prev.map((s) => (s.id === id ? { ...s, is_verified: true, verification_status: 'verified' } : s))
      );
    } catch (err) {
      alert('Failed to verify scholarship: ' + err.message);
    }
  }

  const unverified = scholarships.filter(
    (s) => !s.is_verified || s.verification_status !== 'verified'
  );

  // Data Quality Audits
  const missingUrls = scholarships.filter(
    (s) => !s.official_url || s.official_url.trim().length === 0 || s.official_url === '#'
  );

  const missingDeadlines = scholarships.filter(
    (s) =>
      !s.application_deadline &&
      !s.deadline &&
      s.application_status !== 'rolling' &&
      s.status !== 'rolling' &&
      s.application_status !== 'unannounced' &&
      s.status !== 'unannounced'
  );

  const missingDescriptions = scholarships.filter(
    (s) => (!s.description && !s.short_description) || (s.description || '').length < 30
  );

  // Simple duplicate detection: group by title first 25 characters
  const dupMap = {};
  scholarships.forEach((s) => {
    const key = (s.title || s.name || '').toLowerCase().substring(0, 25).trim();
    if (key.length > 5) {
      if (!dupMap[key]) dupMap[key] = [];
      dupMap[key].push(s);
    }
  });
  const duplicates = Object.values(dupMap).filter((group) => group.length > 1);

  return (
    <div className="space-y-8">
      {/* Page Header */}
      <div>
        <h1 className="font-heading text-2xl font-extrabold text-navy-deep flex items-center gap-2">
          <ShieldCheck className="w-7 h-7 text-royal" />
          <span>Verification & Data Quality Queue</span>
        </h1>
        <p className="text-sm text-slate-500 mt-1">
          Review pending opportunities, ensure accurate official URLs, and resolve data gaps before publishing.
        </p>
      </div>

      {/* Quality Summary Badges */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-white p-4 rounded-xl border border-slate-200 flex items-center justify-between">
          <div>
            <p className="text-xs font-semibold text-slate-500 uppercase">Awaiting Verification</p>
            <p className="text-2xl font-bold text-amber-600 mt-1">{unverified.length}</p>
          </div>
          <AlertTriangle className="w-6 h-6 text-amber-500" />
        </div>

        <div className="bg-white p-4 rounded-xl border border-slate-200 flex items-center justify-between">
          <div>
            <p className="text-xs font-semibold text-slate-500 uppercase">Missing Official URLs</p>
            <p className="text-2xl font-bold text-rose-600 mt-1">{missingUrls.length}</p>
          </div>
          <Link2Off className="w-6 h-6 text-rose-500" />
        </div>

        <div className="bg-white p-4 rounded-xl border border-slate-200 flex items-center justify-between">
          <div>
            <p className="text-xs font-semibold text-slate-500 uppercase">Missing Deadlines</p>
            <p className="text-2xl font-bold text-blue-600 mt-1">{missingDeadlines.length}</p>
          </div>
          <Clock className="w-6 h-6 text-blue-500" />
        </div>

        <div className="bg-white p-4 rounded-xl border border-slate-200 flex items-center justify-between">
          <div>
            <p className="text-xs font-semibold text-slate-500 uppercase">Duplicate Groups</p>
            <p className="text-2xl font-bold text-navy-deep mt-1">{duplicates.length}</p>
          </div>
          <Layers className="w-6 h-6 text-royal" />
        </div>
      </div>

      {/* Section 1: Verification Queue */}
      <div className="bg-white rounded-xl border border-slate-200 shadow-xs overflow-hidden">
        <div className="p-5 border-b border-slate-100 flex items-center justify-between">
          <div>
            <h2 className="font-bold text-navy-deep text-base flex items-center gap-2">
              <ShieldCheck className="w-5 h-5 text-amber-500" />
              Unverified Opportunities ({unverified.length})
            </h2>
            <p className="text-xs text-slate-500 mt-0.5">
              These listings are held from verified badges until an administrator validates official sources.
            </p>
          </div>
        </div>

        {loading ? (
          <div className="p-8 space-y-4">
            {[...Array(3)].map((_, i) => (
              <div key={i} className="h-12 bg-slate-100 rounded animate-pulse"></div>
            ))}
          </div>
        ) : unverified.length === 0 ? (
          <div className="p-8 text-center text-slate-500 flex flex-col items-center justify-center space-y-2">
            <CheckCircle className="w-8 h-8 text-emerald-500" />
            <p className="font-medium text-navy-deep">All records are verified!</p>
            <p className="text-xs text-slate-400">There are no pending submissions requiring manual inspection.</p>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left text-sm">
              <thead className="bg-slate-50 border-b border-slate-200 text-slate-500 font-medium text-xs uppercase">
                <tr>
                  <th className="py-3 px-4">Opportunity</th>
                  <th className="py-3 px-4">Provider / Host</th>
                  <th className="py-3 px-4">Official Source</th>
                  <th className="py-3 px-4 text-right">Verification Action</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {unverified.map((s) => (
                  <tr key={s.id} className="hover:bg-slate-50/60">
                    <td className="py-3 px-4 max-w-sm">
                      <span className="font-medium text-navy-deep block">{s.title || s.name}</span>
                      <span className="text-xs text-slate-400">Status: {s.application_status || s.status}</span>
                    </td>
                    <td className="py-3 px-4 text-xs text-slate-600">
                      {typeof s.provider === 'object' ? s.provider?.name : s.provider}
                    </td>
                    <td className="py-3 px-4 text-xs">
                      {s.official_url ? (
                        <a
                          href={s.official_url}
                          target="_blank"
                          rel="noreferrer"
                          className="text-royal hover:underline inline-flex items-center gap-1 font-mono max-w-[200px] truncate"
                        >
                          <Globe className="w-3.5 h-3.5 flex-shrink-0" />
                          <span>Visit Link</span>
                        </a>
                      ) : (
                        <span className="text-rose-500 font-semibold">Missing Link</span>
                      )}
                    </td>
                    <td className="py-3 px-4 text-right">
                      <div className="flex items-center justify-end gap-2">
                        <Link
                          to={`/admin/scholarships/edit/${s.id}`}
                          className="px-2.5 py-1 text-xs border border-slate-200 rounded text-slate-600 hover:bg-slate-50"
                        >
                          Edit
                        </Link>
                        <Button
                          size="sm"
                          variant="primary"
                          onClick={() => handleVerify(s.id)}
                          className="flex items-center gap-1 bg-emerald-600 hover:bg-emerald-700 text-xs py-1"
                        >
                          <CheckCircle className="w-3.5 h-3.5" />
                          Mark Verified
                        </Button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Section 2: Data Quality Issues */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Missing URLs */}
        <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-xs space-y-3">
          <div className="flex items-center justify-between border-b pb-2.5">
            <h3 className="font-bold text-navy-deep text-sm flex items-center gap-2">
              <Link2Off className="w-4 h-4 text-rose-500" />
              Missing Official URL ({missingUrls.length})
            </h3>
            <span className="text-[11px] text-slate-400">Critical for student applications</span>
          </div>

          {missingUrls.length === 0 ? (
            <p className="text-xs text-emerald-600 flex items-center gap-1 py-4">
              <CheckCircle className="w-4 h-4" /> All listings have an official URL.
            </p>
          ) : (
            <div className="max-h-48 overflow-y-auto divide-y divide-slate-100 text-xs">
              {missingUrls.slice(0, 8).map((s) => (
                <div key={s.id} className="py-2 flex items-center justify-between">
                  <span className="font-medium text-slate-700 truncate pr-3">{s.title || s.name}</span>
                  <Link
                    to={`/admin/scholarships/edit/${s.id}`}
                    className="text-royal font-semibold hover:underline flex-shrink-0"
                  >
                    Add URL →
                  </Link>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Missing Deadlines */}
        <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-xs space-y-3">
          <div className="flex items-center justify-between border-b pb-2.5">
            <h3 className="font-bold text-navy-deep text-sm flex items-center gap-2">
              <Clock className="w-4 h-4 text-blue-500" />
              Missing Specific Deadlines ({missingDeadlines.length})
            </h3>
            <span className="text-[11px] text-slate-400">Non-rolling listings</span>
          </div>

          {missingDeadlines.length === 0 ? (
            <p className="text-xs text-emerald-600 flex items-center gap-1 py-4">
              <CheckCircle className="w-4 h-4" /> All fixed-window listings have deadlines.
            </p>
          ) : (
            <div className="max-h-48 overflow-y-auto divide-y divide-slate-100 text-xs">
              {missingDeadlines.slice(0, 8).map((s) => (
                <div key={s.id} className="py-2 flex items-center justify-between">
                  <span className="font-medium text-slate-700 truncate pr-3">{s.title || s.name}</span>
                  <Link
                    to={`/admin/scholarships/edit/${s.id}`}
                    className="text-royal font-semibold hover:underline flex-shrink-0"
                  >
                    Set Deadline →
                  </Link>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export { AdminVerification };
