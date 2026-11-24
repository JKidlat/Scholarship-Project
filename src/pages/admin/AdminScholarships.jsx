/**
 * @file AdminScholarships.jsx
 * @description Master administration table for scholarship operations.
 *
 * Capabilities:
 * - Search and filter by publication status, application state, and geographic scope
 * - Instant toggle for publication state (draft vs live on public website)
 * - Status transition tracking with historical log audit modal
 * - Deep links to edit scholarship record and manage provider logos
 */

import React, { useState, useEffect, useCallback, useRef } from 'react';
import { Link, useLocation } from 'react-router-dom';
import {
  getAllScholarships,
  updateScholarshipStatus,
  togglePublished,
  deleteScholarship,
  archiveScholarship,
  getStatusHistory,
  invalidateScholarshipCache,
} from '../../services/scholarships';
import { Button } from '../../components/common/Button';
import { formatDate } from '../../utils/formatters';
import {
  Search,
  PlusCircle,
  Edit2,
  Trash2,
  Archive,
  History,
  X,
  ChevronLeft,
  ChevronRight,
  Eye,
  EyeOff,
  RefreshCw,
  CheckCircle2,
} from 'lucide-react';

const PAGE_SIZE = 25;

export default function AdminScholarships() {
  const location = useLocation();
  const [scholarships, setScholarships] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [debouncedSearch, setDebouncedSearch] = useState('');
  const [statusFilter, setStatusFilter] = useState('all');
  const [scopeFilter, setScopeFilter] = useState('all');
  const [page, setPage] = useState(1);
  const [historyModal, setHistoryModal] = useState({ open: false, title: '', items: [] });
  const [saveSuccessMsg, setSaveSuccessMsg] = useState(
    location.state?.updatedTitle
      ? `Scholarship "${location.state.updatedTitle}" was saved successfully.`
      : null
  );
  const debounceTimer = useRef(null);

  useEffect(() => {
    loadScholarships();
  }, []);

  // Sync edits in real time
  useEffect(() => {
    const handleUpdated = (e) => {
      const updated = e.detail?.scholarship;
      if (!updated) return;
      setScholarships((prev) =>
        prev.map((s) =>
          s.id === updated.id ||
          s.slug === updated.slug ||
          (s.source_id && s.source_id === updated.source_id)
            ? { ...s, ...updated }
            : s
        )
      );
    };
    const handleDeleted = (e) => {
      const deletedId = e.detail?.id;
      const keys = e.detail?.keys || [];
      const lowerKeys = new Set([deletedId, ...keys].filter(Boolean).map((k) => String(k).toLowerCase()));
      setScholarships((prev) =>
        prev.filter((s) => {
          const idKey = String(s.id || '').toLowerCase();
          const sourceKey = String(s.source_id || '').toLowerCase();
          const slugKey = String(s.slug || '').toLowerCase();
          return !lowerKeys.has(idKey) && !lowerKeys.has(sourceKey) && !lowerKeys.has(slugKey);
        })
      );
    };

    window.addEventListener('scholarship-updated', handleUpdated);
    window.addEventListener('scholarship-deleted', handleDeleted);
    return () => {
      window.removeEventListener('scholarship-updated', handleUpdated);
      window.removeEventListener('scholarship-deleted', handleDeleted);
    };
  }, []);

  // Debounce search input — 250ms delay before re-filtering
  useEffect(() => {
    if (debounceTimer.current) clearTimeout(debounceTimer.current);
    debounceTimer.current = setTimeout(() => {
      setDebouncedSearch(search);
      setPage(1);
    }, 250);
    return () => clearTimeout(debounceTimer.current);
  }, [search]);

  async function handleRefresh() {
    invalidateScholarshipCache();
    await loadScholarships();
  }

  async function loadScholarships() {
    setLoading(true);
    try {
      const data = await getAllScholarships();
      setScholarships(data || []);
    } catch (err) {
      console.error('Error loading scholarships:', err);
    } finally {
      setLoading(false);
    }
  }

  async function handleStatusChange(id, newStatus) {
    try {
      await updateScholarshipStatus(id, newStatus, 'Admin User');
      setScholarships((prev) =>
        prev.map((s) => (s.id === id ? { ...s, application_status: newStatus, status: newStatus } : s))
      );
    } catch (err) {
      alert('Failed to update status: ' + err.message);
    }
  }

  async function handleTogglePublished(id, currentlyPublished) {
    try {
      await togglePublished(id, currentlyPublished);
      setScholarships((prev) =>
        prev.map((s) => (s.id === id ? { ...s, is_published: !currentlyPublished } : s))
      );
    } catch (err) {
      alert('Failed to toggle publication status.');
    }
  }

  async function handleDelete(targetId, title) {
    if (window.confirm(`Are you sure you want to permanently delete "${title}"? This cannot be undone.`)) {
      try {
        await deleteScholarship(targetId);
        const targetStr = String(targetId).toLowerCase();
        setScholarships((prev) =>
          prev.filter(
            (s) =>
              String(s.id || '').toLowerCase() !== targetStr &&
              String(s.source_id || '').toLowerCase() !== targetStr &&
              String(s.slug || '').toLowerCase() !== targetStr
          )
        );
      } catch (err) {
        alert('Failed to delete scholarship: ' + err.message);
      }
    }
  }

  async function handleArchive(id, title) {
    if (window.confirm(`Archive "${title}"? It will no longer appear in active public searches.`)) {
      try {
        await archiveScholarship(id);
        setScholarships((prev) =>
          prev.map((s) => (s.id === id ? { ...s, application_status: 'archived', status: 'archived' } : s))
        );
      } catch (err) {
        alert('Failed to archive: ' + err.message);
      }
    }
  }

  async function openHistory(s) {
    try {
      const history = await getStatusHistory(s.id);
      setHistoryModal({ open: true, title: s.title || s.name, items: history || [] });
    } catch (e) {
      setHistoryModal({ open: true, title: s.title || s.name, items: [] });
    }
  }

  // Safe client-side filtering with robust null handling
  const filtered = scholarships.filter((s) => {
    const title = String(s.title || s.name || '').toLowerCase();
    const providerStr = typeof s.provider === 'object' && s.provider ? String(s.provider.name || '') : String(s.provider || '');
    const instStr = typeof s.institution === 'object' && s.institution ? String(s.institution.name || '') : String(s.institution || '');
    const countryStr = String(s.host_country || '');
    const scopeStr = String(s.geographic_scope || s.scope || 'local');
    const q = debouncedSearch.toLowerCase().trim();

    const matchesSearch =
      !q ||
      title.includes(q) ||
      providerStr.toLowerCase().includes(q) ||
      instStr.toLowerCase().includes(q) ||
      countryStr.toLowerCase().includes(q) ||
      scopeStr.toLowerCase().includes(q);

    const currentStatus = s.application_status || s.status || 'open';
    const matchesStatus = statusFilter === 'all' || currentStatus === statusFilter;
    const matchesScope = scopeFilter === 'all' || scopeStr.toLowerCase() === scopeFilter.toLowerCase();

    return matchesSearch && matchesStatus && matchesScope;
  });

  const totalPages = Math.ceil(filtered.length / PAGE_SIZE) || 1;
  const paginated = filtered.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE);

  // Accurate Count helpers across all 162 records
  const openCount = scholarships.filter((s) => (s.application_status || s.status) === 'open').length;
  const intlCount = scholarships.filter((s) => (s.geographic_scope || s.scope) === 'international').length;
  const localCount = scholarships.filter((s) => (s.geographic_scope || s.scope) === 'local' || (s.geographic_scope || s.scope) === 'both').length;

  return (
    <div className="space-y-6">
      {/* Save Success Alert Banner */}
      {saveSuccessMsg && (
        <div className="p-4 bg-emerald-50 border border-emerald-200 rounded-xl flex items-center justify-between text-emerald-900 text-sm shadow-xs">
          <div className="flex items-center gap-2.5">
            <CheckCircle2 className="w-5 h-5 text-emerald-600 shrink-0" />
            <span className="font-medium">{saveSuccessMsg}</span>
          </div>
          <button
            onClick={() => setSaveSuccessMsg(null)}
            className="text-emerald-700 hover:text-emerald-900 text-xs font-bold"
          >
            Dismiss
          </button>
        </div>
      )}

      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold font-heading text-navy-deep">All Scholarships &amp; Listings</h1>
          <p className="text-sm text-slate-500 mt-1">
            {scholarships.length} total opportunities &nbsp;·&nbsp; {openCount} currently open &nbsp;·&nbsp; {localCount} local &nbsp;·&nbsp; {intlCount} international
          </p>
        </div>
        <div className="flex items-center gap-2">
          <button
            onClick={handleRefresh}
            className="p-2 text-slate-500 hover:text-royal hover:bg-slate-100 rounded-lg transition-colors border border-slate-200 bg-white"
            title="Refresh list"
          >
            <RefreshCw className="w-4 h-4" />
          </button>
          <Link to="/admin/scholarships/new">
            <Button variant="primary" size="sm" className="flex items-center gap-1.5">
              <PlusCircle className="w-4 h-4" />
              <span>Add Scholarship</span>
            </Button>
          </Link>
        </div>
      </div>

      {/* Filters Toolbar */}
      <div className="bg-white p-4 rounded-xl border border-slate-200 shadow-xs flex flex-wrap gap-3 items-center justify-between">
        <div className="relative flex-1 min-w-[240px]">
          <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            placeholder="Search by title, provider, or university..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full pl-9 pr-4 py-2 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
          />
        </div>

        <div className="flex items-center gap-2.5 flex-wrap">
          <select
            value={statusFilter}
            onChange={(e) => { setStatusFilter(e.target.value); setPage(1); }}
            className="px-3 py-2 bg-white rounded-lg border border-slate-200 text-xs font-medium text-slate-700 focus:outline-none focus:border-royal"
          >
            <option value="all">All Statuses ({scholarships.length})</option>
            <option value="open">Open ({scholarships.filter(s => (s.application_status || s.status) === 'open').length})</option>
            <option value="closed">Closed</option>
            <option value="upcoming">Opening Soon</option>
            <option value="rolling">Rolling</option>
            <option value="unannounced">Unannounced</option>
            <option value="archived">Archived</option>
          </select>

          <select
            value={scopeFilter}
            onChange={(e) => { setScopeFilter(e.target.value); setPage(1); }}
            className="px-3 py-2 bg-white rounded-lg border border-slate-200 text-xs font-medium text-slate-700 focus:outline-none focus:border-royal"
          >
            <option value="all">All Scopes</option>
            <option value="local">Local (Ghana)</option>
            <option value="international">International</option>
          </select>
        </div>
      </div>

      {/* Results count when filtering */}
      {(debouncedSearch || statusFilter !== 'all' || scopeFilter !== 'all') && (
        <div className="text-xs text-slate-500">
          Showing <span className="font-semibold text-royal">{filtered.length}</span> results
          {debouncedSearch && <> for "<span className="font-medium">{debouncedSearch}</span>"</>}
        </div>
      )}

      {/* Table */}
      <div className="bg-white rounded-xl border border-slate-200/80 shadow-xs overflow-hidden">
        {loading ? (
          <div className="p-8 space-y-3">
            {[...Array(8)].map((_, i) => (
              <div key={i} className="h-9 bg-slate-100 rounded animate-pulse" style={{ opacity: 1 - i * 0.1 }} />
            ))}
          </div>
        ) : filtered.length === 0 ? (
          <div className="p-12 text-center text-slate-500">
            <Search className="w-8 h-8 mx-auto text-slate-300 mb-3" />
            <p className="font-medium">No scholarships found</p>
            <p className="text-xs mt-1">Try adjusting the search or filters above.</p>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left text-sm">
              <thead className="bg-slate-50/75 border-b border-slate-200 text-slate-500 font-medium text-xs uppercase tracking-wider">
                <tr>
                  <th className="py-3 px-4">Title &amp; Provider</th>
                  <th className="py-3 px-4">Scope</th>
                  <th className="py-3 px-4">Status</th>
                  <th className="py-3 px-4">Deadline</th>
                  <th className="py-3 px-4 text-center">Published</th>
                  <th className="py-3 px-4 text-center">Audit</th>
                  <th className="py-3 px-4 text-right">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {paginated.map((s) => {
                  const title = s.title || s.name || 'Untitled';
                  const provider = typeof s.provider === 'object' && s.provider ? s.provider.name || 'Various' : (s.provider || 'Various');
                  const currentStatus = s.application_status || s.status || 'open';
                  const isPublished = s.is_published !== false;
                  const isIntl = (s.geographic_scope || s.scope) === 'international';
                  const publicSlug = s.slug || s.source_id || s.id;
                  const editId = s.id || s.source_id || s.slug;

                  return (
                    <tr key={s.id || s.slug} className="hover:bg-slate-50/60 transition-colors">
                      <td className="py-3 px-4 max-w-xs">
                        <Link
                          to={`/scholarship/${publicSlug}`}
                          target="_blank"
                          className="font-medium text-navy-deep hover:text-royal line-clamp-1 block"
                        >
                          {title}
                        </Link>
                        <div className="flex items-center gap-2 mt-0.5">
                          <span className="text-xs text-slate-500 truncate">{provider}</span>
                          {isIntl && (
                            <span className="shrink-0 text-[10px] font-semibold bg-indigo-50 text-indigo-700 border border-indigo-100 rounded px-1.5 py-0.5">
                              INTL
                            </span>
                          )}
                        </div>
                      </td>

                      <td className="py-3 px-4 text-xs capitalize text-slate-600">
                        {s.geographic_scope || s.scope || 'local'}
                      </td>

                      {/* Status Dropdown */}
                      <td className="py-3 px-4">
                        <select
                          value={currentStatus}
                          onChange={(e) => handleStatusChange(s.id, e.target.value)}
                          className={`text-xs font-semibold px-2 py-1 rounded-md border focus:outline-none transition-colors ${
                            currentStatus === 'open'
                              ? 'bg-emerald-50 text-emerald-800 border-emerald-200'
                              : currentStatus === 'closed'
                              ? 'bg-rose-50 text-rose-800 border-rose-200'
                              : currentStatus === 'upcoming'
                              ? 'bg-blue-50 text-blue-800 border-blue-200'
                              : currentStatus === 'rolling'
                              ? 'bg-indigo-50 text-indigo-800 border-indigo-200'
                              : currentStatus === 'archived'
                              ? 'bg-amber-50 text-amber-800 border-amber-200'
                              : 'bg-slate-50 text-slate-700 border-slate-200'
                          }`}
                        >
                          <option value="open">Open</option>
                          <option value="closed">Closed</option>
                          <option value="upcoming">Upcoming</option>
                          <option value="rolling">Rolling</option>
                          <option value="unannounced">Unannounced</option>
                          <option value="archived">Archived</option>
                        </select>
                      </td>

                      <td className="py-3 px-4 text-xs text-slate-500 whitespace-nowrap">
                        {s.deadline_text
                          ? <span title={s.deadline_text} className="truncate block max-w-[120px]">{s.deadline_text.length > 18 ? s.deadline_text.substring(0, 18) + '…' : s.deadline_text}</span>
                          : formatDate(s.application_deadline || s.deadline)
                        }
                      </td>

                      {/* Published Toggle */}
                      <td className="py-3 px-4 text-center">
                        <button
                          onClick={() => handleTogglePublished(s.id, isPublished)}
                          title={isPublished ? 'Click to unpublish' : 'Click to publish'}
                          className={`p-1.5 rounded-md transition-colors ${
                            isPublished
                              ? 'text-emerald-600 hover:bg-emerald-50'
                              : 'text-slate-400 hover:bg-slate-100'
                          }`}
                        >
                          {isPublished ? <Eye className="w-4 h-4" /> : <EyeOff className="w-4 h-4" />}
                        </button>
                      </td>

                      {/* Audit History */}
                      <td className="py-3 px-4 text-center">
                        <button
                          onClick={() => openHistory(s)}
                          title="View status change history"
                          className="p-1.5 text-slate-400 hover:text-royal hover:bg-slate-100 rounded-md transition-colors"
                        >
                          <History className="w-4 h-4" />
                        </button>
                      </td>

                      {/* Action buttons */}
                      <td className="py-3 px-4 text-right">
                        <div className="flex items-center justify-end gap-1.5">
                          <Link
                            to={`/admin/scholarships/edit/${editId}`}
                            className="p-1.5 text-slate-500 hover:text-royal hover:bg-slate-100 rounded-md transition-colors"
                            title="Edit Record"
                          >
                            <Edit2 className="w-4 h-4" />
                          </Link>
                          <button
                            onClick={() => handleArchive(s.id, title)}
                            className="p-1.5 text-slate-500 hover:text-amber-600 hover:bg-amber-50 rounded-md transition-colors"
                            title="Archive Record"
                          >
                            <Archive className="w-4 h-4" />
                          </button>
                          <button
                            onClick={() => handleDelete(editId, title)}
                            className="p-1.5 text-slate-500 hover:text-rose-600 hover:bg-rose-50 rounded-md transition-colors"
                            title="Delete Record"
                          >
                            <Trash2 className="w-4 h-4" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}

        {/* Pagination Bar */}
        {!loading && filtered.length > PAGE_SIZE && (
          <div className="p-4 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
            <span>
              Showing {(page - 1) * PAGE_SIZE + 1}–{Math.min(page * PAGE_SIZE, filtered.length)} of {filtered.length}
            </span>
            <div className="flex items-center gap-1.5">
              <button
                disabled={page === 1}
                onClick={() => setPage((p) => p - 1)}
                className="p-1.5 border border-slate-200 rounded-md hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed"
              >
                <ChevronLeft className="w-4 h-4" />
              </button>
              <span className="px-2 font-semibold text-navy-deep tabular-nums">
                {page} / {totalPages}
              </span>
              <button
                disabled={page === totalPages}
                onClick={() => setPage((p) => p + 1)}
                className="p-1.5 border border-slate-200 rounded-md hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed"
              >
                <ChevronRight className="w-4 h-4" />
              </button>
            </div>
          </div>
        )}
      </div>

      {/* History Modal */}
      {historyModal.open && (
        <div className="fixed inset-0 z-50 bg-black/40 flex items-center justify-center p-4" onClick={(e) => e.target === e.currentTarget && setHistoryModal({ open: false, title: '', items: [] })}>
          <div className="bg-white rounded-xl max-w-lg w-full p-6 space-y-4 shadow-xl">
            <div className="flex items-center justify-between border-b pb-3">
              <div>
                <h3 className="font-bold text-navy-deep text-base">Status Change Audit</h3>
                <p className="text-xs text-slate-500 mt-0.5 line-clamp-1">{historyModal.title}</p>
              </div>
              <button
                onClick={() => setHistoryModal({ open: false, title: '', items: [] })}
                className="text-slate-400 hover:text-slate-700"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            <div className="max-h-72 overflow-y-auto space-y-2.5">
              {historyModal.items.length === 0 ? (
                <p className="text-xs text-slate-400 py-6 text-center">
                  No previous manual status changes recorded for this entry.
                </p>
              ) : (
                historyModal.items.map((item, idx) => (
                  <div key={idx} className="p-3 bg-slate-50 rounded-lg text-xs space-y-1">
                    <div className="flex justify-between font-semibold">
                      <span className="text-navy-deep">
                        {item.previous_status || item.old_status || 'Initial'} → {item.new_status}
                      </span>
                      <span className="text-slate-400">{new Date(item.created_at).toLocaleString()}</span>
                    </div>
                    <div className="text-slate-500">
                      Changed by: {item.changed_by || 'Admin'}
                    </div>
                    {item.reason && <div className="text-slate-400 italic">{item.reason}</div>}
                  </div>
                ))
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export { AdminScholarships };
