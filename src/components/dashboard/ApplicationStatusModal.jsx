/**
 * @file ApplicationStatusModal.jsx
 * @description Comprehensive status management and milestone update modal for tracked scholarships.
 */

import React, { useState, useEffect } from 'react';
import {
  X,
  ExternalLink,
  Calendar,
  Clock,
  FileText,
  Hash,
  CheckCircle2,
  AlertCircle,
  History,
  Send,
  Sparkles,
} from 'lucide-react';
import { APPLICATION_STATUSES, getStatusMeta } from '../../services/trackedApplications';
import { formatDate } from '../../utils/formatters';

export function ApplicationStatusModal({ isOpen, onClose, application, onSave }) {
  if (!isOpen || !application) return null;

  const s = application.scholarship || {};
  const currentMeta = getStatusMeta(application.status);

  const [status, setStatus] = useState(application.status || 'preparing');
  const [referenceNumber, setReferenceNumber] = useState(application.reference_number || '');
  const [submissionDate, setSubmissionDate] = useState(
    application.submission_date ? application.submission_date.substring(0, 10) : ''
  );
  const [interviewDate, setInterviewDate] = useState(
    application.interview_date ? application.interview_date.substring(0, 16) : ''
  );
  const [notes, setNotes] = useState(application.notes || '');
  const [statusNote, setStatusNote] = useState('');
  const [saving, setSaving] = useState(false);
  const [activeSubTab, setActiveSubTab] = useState('details'); // 'details' | 'timeline'

  useEffect(() => {
    if (application) {
      setStatus(application.status || 'preparing');
      setReferenceNumber(application.reference_number || '');
      setSubmissionDate(application.submission_date ? application.submission_date.substring(0, 10) : '');
      setInterviewDate(application.interview_date ? application.interview_date.substring(0, 16) : '');
      setNotes(application.notes || '');
      setStatusNote('');
    }
  }, [application]);

  const handleQuickSubmit = () => {
    setStatus('submitted');
    const today = new Date().toISOString().substring(0, 10);
    setSubmissionDate(today);
    setStatusNote('Marked as submitted via quick action.');
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSaving(true);
    try {
      await onSave({
        status,
        reference_number: referenceNumber.trim(),
        submission_date: submissionDate ? new Date(submissionDate).toISOString() : null,
        interview_date: interviewDate ? new Date(interviewDate).toISOString() : null,
        notes: notes.trim(),
        status_change_note: statusNote.trim() || undefined,
      });
      onClose();
    } catch (err) {
      console.error('Failed to update application progress:', err);
    } finally {
      setSaving(false);
    }
  };

  const timeline = Array.isArray(application.timeline) ? application.timeline : [];

  return (
    <div className="fixed inset-0 z-50 overflow-y-auto bg-slate-900/60 backdrop-blur-xs flex items-center justify-center p-4 animate-in fade-in duration-200">
      <div className="bg-white rounded-3xl max-w-2xl w-full border border-slate-200 shadow-2xl overflow-hidden flex flex-col max-h-[90vh]">
        {/* Modal Header */}
        <div className="bg-gradient-to-r from-navy-deep via-navy-dark to-royal p-6 text-white relative">
          <button
            onClick={onClose}
            className="absolute top-5 right-5 text-white/70 hover:text-white p-1 rounded-lg hover:bg-white/10 transition-colors"
            title="Close modal"
          >
            <X className="w-5 h-5" />
          </button>

          <span className="text-[11px] font-bold uppercase tracking-wider text-gold bg-white/10 px-2.5 py-0.5 rounded-full inline-block mb-2">
            Application Progress Tracker
          </span>
          <h2 className="font-heading font-extrabold text-xl sm:text-2xl text-white pr-8 line-clamp-1">
            {s.title || s.name || 'Scholarship Application'}
          </h2>
          <p className="text-xs text-slate-300 mt-1 flex items-center gap-2">
            <span>Provider: <strong>{s.provider || 'Scholarship Sponsor'}</strong></span>
            {s.official_url && (
              <>
                <span>•</span>
                <a
                  href={s.official_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-gold hover:underline inline-flex items-center gap-1"
                >
                  Provider Portal
                  <ExternalLink className="w-3 h-3" />
                </a>
              </>
            )}
          </p>
        </div>

        {/* Disclaimer Strip */}
        <div className="bg-amber-50 border-b border-amber-200/80 px-6 py-2.5 text-xs text-amber-900 flex items-center justify-between gap-3">
          <div className="flex items-center gap-2 min-w-0">
            <AlertCircle className="w-4 h-4 text-amber-600 shrink-0" />
            <span className="truncate">
              Applications are submitted externally on the provider portal. Update your progress below.
            </span>
          </div>
          {status !== 'submitted' && status !== 'awarded' && (
            <button
              type="button"
              onClick={handleQuickSubmit}
              className="px-2.5 py-1 bg-amber-200/80 hover:bg-amber-300 text-amber-950 font-bold rounded-lg text-[11px] whitespace-nowrap transition-colors"
            >
              Mark as Submitted Now
            </button>
          )}
        </div>

        {/* Tabs: Details vs Milestone History */}
        <div className="flex border-b border-slate-200 px-6 pt-3 bg-slate-50 gap-4">
          <button
            type="button"
            onClick={() => setActiveSubTab('details')}
            className={`pb-3 text-xs font-bold border-b-2 transition-colors flex items-center gap-1.5 ${
              activeSubTab === 'details'
                ? 'border-royal text-royal'
                : 'border-transparent text-slate-500 hover:text-slate-800'
            }`}
          >
            <FileText className="w-3.5 h-3.5" />
            Update Status & Info
          </button>
          <button
            type="button"
            onClick={() => setActiveSubTab('timeline')}
            className={`pb-3 text-xs font-bold border-b-2 transition-colors flex items-center gap-1.5 ${
              activeSubTab === 'timeline'
                ? 'border-royal text-royal'
                : 'border-transparent text-slate-500 hover:text-slate-800'
            }`}
          >
            <History className="w-3.5 h-3.5" />
            Progress Timeline ({timeline.length})
          </button>
        </div>

        {/* Modal Body */}
        <div className="p-6 overflow-y-auto space-y-5 flex-1">
          {activeSubTab === 'details' ? (
            <form id="tracker-form" onSubmit={handleSubmit} className="space-y-4">
              {/* Status Picker */}
              <div>
                <label className="block text-xs font-bold text-[#101828] mb-1.5">
                  Current Application Status
                </label>
                <div className="grid grid-cols-2 sm:grid-cols-3 gap-2">
                  {APPLICATION_STATUSES.map((st) => (
                    <button
                      key={st.key}
                      type="button"
                      onClick={() => setStatus(st.key)}
                      className={`text-left p-2.5 rounded-xl border text-xs transition-all flex flex-col justify-between ${
                        status === st.key
                          ? 'border-royal ring-2 ring-royal/20 bg-royal/5 text-navy-deep font-bold'
                          : 'border-slate-200 hover:border-slate-300 bg-white text-slate-700'
                      }`}
                    >
                      <div className="flex items-center justify-between w-full mb-1">
                        <span className="truncate">{st.label}</span>
                        {status === st.key && <CheckCircle2 className="w-3.5 h-3.5 text-royal shrink-0" />}
                      </div>
                      <span className="text-[10px] text-slate-400 font-normal line-clamp-1">
                        {st.stage} ({st.progress}%)
                      </span>
                    </button>
                  ))}
                </div>
                <p className="text-[11px] text-slate-500 mt-2 italic">
                  {getStatusMeta(status).description}
                </p>
              </div>

              {/* Status Change Note (if status differs from original) */}
              {status !== application.status && (
                <div className="p-3 bg-blue-50/80 border border-blue-200 rounded-xl space-y-1">
                  <label className="block text-xs font-bold text-blue-900">
                    Status Transition Note (Optional)
                  </label>
                  <input
                    type="text"
                    value={statusNote}
                    onChange={(e) => setStatusNote(e.target.value)}
                    placeholder={`e.g., Shortlisted for interview scheduled next week, or Received submission confirmation email.`}
                    className="w-full text-xs px-3 py-2 rounded-lg border border-blue-300 bg-white focus:outline-none focus:ring-2 focus:ring-blue-400 text-slate-800"
                  />
                </div>
              )}

              {/* Submission Date & Reference Number Grid */}
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                  <label className="block text-xs font-bold text-[#101828] mb-1 flex items-center gap-1.5">
                    <Calendar className="w-3.5 h-3.5 text-royal" />
                    Application Submission Date
                  </label>
                  <input
                    type="date"
                    value={submissionDate}
                    onChange={(e) => setSubmissionDate(e.target.value)}
                    className="w-full px-3 py-2 text-xs rounded-xl border border-slate-200 focus:outline-none focus:ring-2 focus:ring-royal text-slate-800 bg-slate-50/50"
                  />
                  <span className="text-[10px] text-slate-400 mt-0.5 block">
                    Date you clicked submit on the external portal
                  </span>
                </div>

                <div>
                  <label className="block text-xs font-bold text-[#101828] mb-1 flex items-center gap-1.5">
                    <Hash className="w-3.5 h-3.5 text-royal" />
                    Application Reference Number
                  </label>
                  <input
                    type="text"
                    value={referenceNumber}
                    onChange={(e) => setReferenceNumber(e.target.value)}
                    placeholder="e.g. GSA-2026-98124, CHEV-8821"
                    className="w-full px-3 py-2 text-xs rounded-xl border border-slate-200 focus:outline-none focus:ring-2 focus:ring-royal text-slate-800"
                  />
                  <span className="text-[10px] text-slate-400 mt-0.5 block">
                    Confirmation or tracking ID assigned by sponsor
                  </span>
                </div>
              </div>

              {/* Interview Date (shown especially if status is interview or shortlisted) */}
              {(status === 'interview' || status === 'shortlisted' || interviewDate) && (
                <div className="p-3.5 bg-sky-50/80 border border-sky-200 rounded-xl space-y-1.5 animate-in fade-in duration-200">
                  <label className="block text-xs font-bold text-sky-900 flex items-center gap-1.5">
                    <Clock className="w-3.5 h-3.5 text-sky-700" />
                    Interview Date & Time
                  </label>
                  <input
                    type="datetime-local"
                    value={interviewDate}
                    onChange={(e) => setInterviewDate(e.target.value)}
                    className="w-full px-3 py-2 text-xs rounded-lg border border-sky-300 bg-white focus:outline-none focus:ring-2 focus:ring-sky-400 text-slate-800"
                  />
                  <span className="text-[10px] text-sky-700 block">
                    The portal will automatically remind you 5 days and 1 day before your interview.
                  </span>
                </div>
              )}

              {/* Personal Notes */}
              <div>
                <label className="block text-xs font-bold text-[#101828] mb-1 flex items-center gap-1.5">
                  <FileText className="w-3.5 h-3.5 text-royal" />
                  Personal Application Notes
                </label>
                <textarea
                  rows={4}
                  value={notes}
                  onChange={(e) => setNotes(e.target.value)}
                  placeholder="Record credentials used, essay topic chosen, required document checklist, interview panel feedback, or next steps..."
                  className="w-full px-3 py-2 text-xs rounded-xl border border-slate-200 focus:outline-none focus:ring-2 focus:ring-royal text-slate-800 resize-none leading-relaxed"
                />
              </div>
            </form>
          ) : (
            /* Progress Timeline Tab */
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <h4 className="text-xs font-bold text-slate-800 uppercase tracking-wider">
                  Chronological Milestone History
                </h4>
                <span className="text-xs text-slate-400">
                  {timeline.length} milestone{timeline.length === 1 ? '' : 's'} recorded
                </span>
              </div>

              {timeline.length === 0 ? (
                <div className="py-8 text-center text-slate-400 text-xs">
                  No timeline history recorded yet. Updates will automatically be tracked here.
                </div>
              ) : (
                <div className="relative pl-6 space-y-6 before:absolute before:left-2 before:top-2 before:bottom-2 before:w-0.5 before:bg-slate-200">
                  {timeline.map((entry, idx) => {
                    const meta = getStatusMeta(entry.status);
                    return (
                      <div key={entry.id || idx} className="relative group">
                        <div className="absolute -left-6 top-0.5 w-4 h-4 rounded-full bg-white border-2 border-royal flex items-center justify-center shadow-xs" />
                        <div>
                          <div className="flex items-center gap-2">
                            <span className={`text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded-full border ${meta.badgeClass}`}>
                              {entry.status_label || meta.label}
                            </span>
                            <span className="text-[11px] text-slate-400">
                              {entry.date ? new Date(entry.date).toLocaleString([], { dateStyle: 'medium', timeStyle: 'short' }) : 'Date not recorded'}
                            </span>
                          </div>
                          {entry.note && (
                            <p className="text-xs text-slate-700 mt-1.5 leading-relaxed bg-slate-50 p-2.5 rounded-lg border border-slate-100">
                              {entry.note}
                            </p>
                          )}
                        </div>
                      </div>
                    );
                  })}
                </div>
              )}
            </div>
          )}
        </div>

        {/* Modal Footer */}
        <div className="p-4 px-6 bg-slate-50 border-t border-slate-200 flex items-center justify-between gap-3">
          <button
            type="button"
            onClick={onClose}
            disabled={saving}
            className="px-4 py-2 text-xs font-semibold text-slate-600 hover:text-slate-900 transition-colors"
          >
            Cancel
          </button>

          <div className="flex items-center gap-2">
            {activeSubTab === 'timeline' && (
              <button
                type="button"
                onClick={() => setActiveSubTab('details')}
                className="px-4 py-2 bg-white border border-slate-200 hover:bg-slate-50 text-slate-700 text-xs font-bold rounded-xl transition-colors shadow-2xs"
              >
                Back to Details
              </button>
            )}
            <button
              type="submit"
              form="tracker-form"
              disabled={saving}
              className="px-6 py-2.5 bg-[#FFC928] hover:bg-[#FFD84D] text-[#050D2B] text-xs font-bold rounded-xl transition-all shadow-gold inline-flex items-center gap-1.5"
            >
              {saving ? (
                <>
                  <div className="w-3.5 h-3.5 border-2 border-[#050D2B] border-t-transparent rounded-full animate-spin" />
                  <span>Saving...</span>
                </>
              ) : (
                <>
                  <CheckCircle2 className="w-4 h-4" />
                  <span>Save Progress</span>
                </>
              )}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default ApplicationStatusModal;
