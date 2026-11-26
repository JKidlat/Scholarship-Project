/**
 * @file ScholarshipDetail.jsx
 * @description Comprehensive institutional detail view for an individual scholarship.
 *
 * Responsibilities:
 * - Fetches verified scholarship data by slug or source_id from Supabase/cache
 * - Listens for live 'scholarship-updated' CustomEvent for instant admin preview
 * - Tracks view and apply_click analytics events
 * - Provides verified official application URL routing with security indicators
 * - Recommends similar opportunities based on academic scope and level
 */

import React, { useState, useEffect } from 'react';
import { useParams, useLocation, useNavigate, Link } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import {
  saveScholarship,
  removeSavedScholarship,
  isScholarshipSaved,
} from '../services/savedScholarships';
import {
  isScholarshipTracked,
  getTrackedRecord,
  addTrackedApplication,
  updateTrackedApplication,
  getStatusMeta,
} from '../services/trackedApplications';
import { ApplicationStatusModal } from '../components/dashboard/ApplicationStatusModal';
import {
  ExternalLink,
  Calendar,
  Globe,
  Award,
  GraduationCap,
  Building2,
  CheckCircle2,
  XCircle,
  FileText,
  ShieldCheck,
  Share2,
  Bookmark,
  BookmarkCheck,
  AlertTriangle,
  ArrowLeft,
  Clock,
  Sparkles,
  School,
  Check,
  Send,
} from 'lucide-react';
import {
  getScholarshipBySlug,
  getPublishedScholarships,
  recordAnalyticsEvent,
} from '../services/scholarships';
import { ScholarshipCard } from '../components/scholarship/ScholarshipCard';
import {
  formatDate,
  fundingTypeLabel,
  studyLevelLabel,
  genderLabel,
  scopeLabel,
  statusLabel,
  sanitizeUrl,
} from '../utils/formatters';

export default function ScholarshipDetailPage() {
  const { slug } = useParams();
  const location = useLocation();
  const navigate = useNavigate();
  const { user } = useAuth();

  // Instant render from navigation state if available (0ms transition)
  const initialData = location.state?.scholarship || null;
  const [scholarship, setScholarship] = useState(initialData);
  const [similar, setSimilar] = useState([]);
  const [loading, setLoading] = useState(!initialData);
  const [saved, setSaved] = useState(false);
  const [copied, setCopied] = useState(false);
  const [saveSuccessMsg, setSaveSuccessMsg] = useState(false);
  const [trackedRecord, setTrackedRecord] = useState(null);
  const [trackerModalOpen, setTrackerModalOpen] = useState(false);
  const [trackSuccessMsg, setTrackSuccessMsg] = useState(false);

  // Sync saved status from persistent database
  useEffect(() => {
    if (user && scholarship) {
      setSaved(isScholarshipSaved(user, scholarship));
    } else {
      setSaved(false);
    }

    const handleSavedSync = () => {
      if (user && scholarship) {
        setSaved(isScholarshipSaved(user, scholarship));
      }
    };

    window.addEventListener('saved-scholarships-changed', handleSavedSync);
    window.addEventListener('storage', handleSavedSync);
    return () => {
      window.removeEventListener('saved-scholarships-changed', handleSavedSync);
      window.removeEventListener('storage', handleSavedSync);
    };
  }, [user, scholarship]);

  // Sync application tracker status from database
  useEffect(() => {
    if (user && scholarship) {
      setTrackedRecord(getTrackedRecord(user, scholarship));
    } else {
      setTrackedRecord(null);
    }

    const handleTrackSync = () => {
      if (user && scholarship) {
        setTrackedRecord(getTrackedRecord(user, scholarship));
      }
    };

    window.addEventListener('tracked-applications-changed', handleTrackSync);
    window.addEventListener('storage', handleTrackSync);
    return () => {
      window.removeEventListener('tracked-applications-changed', handleTrackSync);
      window.removeEventListener('storage', handleTrackSync);
    };
  }, [user, scholarship]);

  // Live listener for real-time updates from admin edit without page refresh
  useEffect(() => {
    const handleUpdated = (e) => {
      const item = e.detail?.scholarship;
      if (item && (item.slug === slug || String(item.id) === String(slug) || item.source_id === slug)) {
        setScholarship((prev) => ({ ...prev, ...item }));
      }
    };
    window.addEventListener('scholarship-updated', handleUpdated);
    return () => window.removeEventListener('scholarship-updated', handleUpdated);
  }, [slug]);

  useEffect(() => {
    let isMounted = true;

    async function loadData() {
      // Always show loading spinner if no initialData or to fetch latest live data
      if (!initialData) {
        setLoading(true);
      }

      try {
        const data = await getScholarshipBySlug(slug, true);
        if (data && isMounted) {
          setScholarship(data);
          setLoading(false);

          // Track analytics view
          recordAnalyticsEvent('view', data.id, { slug, title: data.title || data.name });

          // Load 3 similar opportunities from cached published list
          const published = await getPublishedScholarships(8);
          if (isMounted) {
            const related = published
              .filter((s) => String(s.id) !== String(data.id) && s.slug !== data.slug)
              .slice(0, 3);
            setSimilar(related);
          }
        } else if (isMounted) {
          setLoading(false);
        }
      } catch (err) {
        if (isMounted) setLoading(false);
      }
    }

    loadData();
    window.scrollTo({ top: 0, behavior: 'smooth' });

    return () => {
      isMounted = false;
    };
  }, [slug]);

  const handleApplyClick = () => {
    if (scholarship) {
      recordAnalyticsEvent('apply_click', scholarship.id, {
        title: scholarship.title || scholarship.name,
        url: scholarship.official_url || scholarship.application_url,
      });
    }
  };

  const handleShare = () => {
    if (navigator.clipboard) {
      navigator.clipboard.writeText(window.location.href);
      setCopied(true);
      setTimeout(() => setCopied(false), 2500);
      recordAnalyticsEvent('share', scholarship?.id);
    }
  };

  const handleSave = async () => {
    if (!user) {
      // Store pending save target so upon login or registration it automatically saves
      if (typeof sessionStorage !== 'undefined') {
        sessionStorage.setItem('pending_save_slug', slug || scholarship?.slug || scholarship?.id);
      }
      navigate(`/auth/login?prompt=save&redirect=${encodeURIComponent(location.pathname)}`);
      return;
    }

    if (!scholarship) return;

    try {
      if (saved) {
        await removeSavedScholarship(user, scholarship.id || scholarship.slug);
        setSaved(false);
      } else {
        await saveScholarship(user, scholarship);
        setSaved(true);
        setSaveSuccessMsg(true);
        setTimeout(() => setSaveSuccessMsg(false), 4500);
        recordAnalyticsEvent('save', scholarship.id, { title: scholarship.title || scholarship.name });
      }
    } catch (err) {
      console.error('Failed to update saved scholarship:', err);
    }
  };

  const handleTrackApplication = async () => {
    if (!user) {
      if (typeof sessionStorage !== 'undefined') {
        sessionStorage.setItem('pending_track_slug', slug || scholarship?.slug || scholarship?.id);
      }
      navigate(`/auth/login?prompt=track&redirect=${encodeURIComponent(location.pathname)}`);
      return;
    }

    if (trackedRecord) {
      setTrackerModalOpen(true);
    } else {
      try {
        const res = await addTrackedApplication(user, scholarship, 'preparing');
        if (res?.record) {
          setTrackedRecord(res.record);
        }
        setTrackSuccessMsg(true);
        setTimeout(() => setTrackSuccessMsg(false), 4500);
        setTrackerModalOpen(true);
      } catch (err) {
        console.error('Failed to add to tracker:', err);
      }
    }
  };

  const handleModalSave = async (updates) => {
    if (!user || !trackedRecord) return;
    try {
      const updated = await updateTrackedApplication(user, trackedRecord.id, updates);
      if (updated) {
        setTrackedRecord(updated);
      }
    } catch (err) {
      console.error('Failed to update tracker record:', err);
    }
  };

  if (loading) {
    return (
      <div className="bg-[#F5F7FC] min-h-screen pt-28 pb-20">
        <div className="site-container max-w-4xl animate-pulse space-y-6">
          <div className="h-6 w-36 bg-slate-200 rounded" />
          <div className="h-56 bg-white rounded-3xl border border-slate-200 p-8 space-y-4">
            <div className="h-6 w-24 bg-slate-200 rounded-full" />
            <div className="h-8 w-3/4 bg-slate-200 rounded" />
            <div className="h-4 w-1/2 bg-slate-100 rounded" />
          </div>
          <div className="h-72 bg-white rounded-3xl border border-slate-200 p-8 space-y-4">
            <div className="h-6 w-48 bg-slate-200 rounded" />
            <div className="h-20 bg-slate-100 rounded" />
          </div>
        </div>
      </div>
    );
  }

  if (!scholarship) {
    return (
      <div className="bg-[#F5F7FC] min-h-screen pt-28 pb-20">
        <div className="site-container max-w-xl text-center py-16 bg-white rounded-2xl border border-slate-200 p-8 shadow-card">
          <AlertTriangle className="w-12 h-12 text-amber-500 mx-auto mb-4" />
          <h1 className="font-heading font-extrabold text-2xl text-[#101828] mb-2">
            Scholarship Not Found
          </h1>
          <p className="text-sm text-[#667085] mb-6">
            The opportunity you are looking for may have been archived, renamed, or moved.
          </p>
          <Link
            to="/scholarships"
            className="inline-flex items-center gap-2 px-6 py-3 bg-[#173A8A] text-white font-bold text-sm rounded-xl hover:bg-[#122d6e] transition-colors shadow-sm"
          >
            <ArrowLeft className="w-4 h-4" />
            Browse All Scholarships
          </Link>
        </div>
      </div>
    );
  }

  const {
    title,
    name,
    provider,
    institution,
    funding_type,
    application_status,
    status,
    study_levels,
    geographic_scope,
    scope,
    host_country,
    application_deadline,
    deadline,
    deadline_text,
    official_url,
    application_url,
    description,
    short_description,
    eligibility_criteria,
    eligibility_requirements,
    benefits,
    required_documents,
    gender_eligibility,
    is_verified,
    is_featured,
    logo_url,
    logo_alt_text,
  } = scholarship;

  const displayTitle = title || name;
  const providerName = typeof provider === 'object' && provider ? provider.name : (provider || 'Various Sponsors');
  const institutionName = typeof institution === 'object' && institution ? institution.name : institution;

  const currentStatus = application_status || status || 'open';
  const isOpen = currentStatus === 'open';
  const isClosed = currentStatus === 'closed';

  const rawDeadline = application_deadline || deadline;
  const deadlineDisplay = rawDeadline
    ? formatDate(rawDeadline)
    : deadline_text || (currentStatus === 'rolling' ? 'Rolling Applications' : 'Deadline unannounced');

  const finalOfficialUrl = sanitizeUrl(official_url || application_url);
  const initial = providerName ? providerName.trim().charAt(0).toUpperCase() : 'S';

  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-24 pb-20">
      {/* Breadcrumb Bar */}
      <div className="bg-white border-b border-[#E4E7EC] py-3.5 mb-8">
        <div className="site-container flex items-center justify-between text-xs text-[#667085]">
          <Link
            to="/scholarships"
            className="inline-flex items-center gap-1.5 hover:text-[#173A8A] font-semibold transition-colors"
          >
            <ArrowLeft className="w-3.5 h-3.5" />
            Back to All Scholarships
          </Link>
          <div className="flex items-center gap-2">
            {/* Track Application Quick Button */}
            <button
              type="button"
              onClick={handleTrackApplication}
              className={`inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg border text-xs font-bold transition-all ${
                trackedRecord
                  ? 'bg-blue-50 border-blue-300 text-blue-900 shadow-2xs'
                  : 'bg-white border-slate-200 text-slate-700 hover:border-slate-300 hover:bg-slate-50'
              }`}
              title={trackedRecord ? 'Update Application Progress' : 'Track Scholarship Application'}
            >
              <Send className="w-3.5 h-3.5 text-royal" />
              <span>{trackedRecord ? `Tracking: ${getStatusMeta(trackedRecord.status).label}` : 'Track Progress'}</span>
            </button>

            <button
              type="button"
              onClick={handleSave}
              className={`inline-flex items-center gap-1.5 px-3.5 py-1.5 rounded-lg border text-xs font-bold transition-all ${
                saved
                  ? 'bg-amber-100 border-amber-300 text-amber-900 shadow-2xs'
                  : 'bg-white border-slate-200 text-slate-700 hover:border-slate-300 hover:bg-slate-50'
              }`}
              title={saved ? 'Remove from Saved Scholarships' : 'Save Scholarship'}
            >
              {saved ? (
                <>
                  <BookmarkCheck className="w-4 h-4 text-amber-600" />
                  <span>Saved to Portal</span>
                </>
              ) : (
                <>
                  <Bookmark className="w-4 h-4 text-slate-500" />
                  <span>Save Scholarship</span>
                </>
              )}
            </button>
            <button
              type="button"
              onClick={handleShare}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg border border-slate-200 text-slate-700 hover:bg-slate-50 text-xs font-semibold transition-colors"
            >
              {copied ? <Check className="w-3.5 h-3.5 text-emerald-600" /> : <Share2 className="w-3.5 h-3.5" />}
              {copied ? 'Link Copied!' : 'Share'}
            </button>
          </div>
        </div>
      </div>

      <div className="site-container max-w-4xl space-y-8">
        {/* Real-time Tracking Confirmation Alert */}
        {trackSuccessMsg && (
          <div className="p-4 bg-blue-50 border border-blue-200 rounded-2xl flex items-center justify-between text-blue-900 text-xs sm:text-sm font-medium shadow-xs animate-in fade-in slide-in-from-top-2 duration-300">
            <div className="flex items-center gap-2.5">
              <CheckCircle2 className="w-5 h-5 text-blue-600 shrink-0" />
              <span>Scholarship successfully added to your <strong>Application Progress Tracker</strong>!</span>
            </div>
            <Link to="/dashboard?tab=tracker" className="text-royal hover:underline font-bold whitespace-nowrap ml-3">
              Open Tracker →
            </Link>
          </div>
        )}

        {/* Real-time Save Confirmation Alert */}
        {saveSuccessMsg && (
          <div className="p-4 bg-emerald-50 border border-emerald-200 rounded-2xl flex items-center justify-between text-emerald-900 text-xs sm:text-sm font-medium shadow-xs animate-in fade-in slide-in-from-top-2 duration-300">
            <div className="flex items-center gap-2.5">
              <CheckCircle2 className="w-5 h-5 text-emerald-600 shrink-0" />
              <span>Scholarship successfully saved to your personal <strong>Student Portal</strong>!</span>
            </div>
            <Link to="/dashboard" className="text-emerald-700 hover:text-emerald-950 font-bold underline whitespace-nowrap ml-3">
              View Saved List →
            </Link>
          </div>
        )}
        {/* Main Header Card */}
        <div className="bg-white rounded-3xl border border-[#E4E7EC] p-6 sm:p-8 shadow-sm relative overflow-hidden">
          {/* Status Top Strip */}
          <div className="flex flex-wrap items-center justify-between gap-3 mb-5">
            <div className="flex items-center gap-2">
              <span
                className={`text-xs font-extrabold uppercase tracking-wider px-3 py-1 rounded-full flex items-center gap-1.5 ${
                  isOpen
                    ? 'bg-emerald-600 text-white'
                    : isClosed
                    ? 'bg-rose-600 text-white'
                    : currentStatus === 'upcoming'
                    ? 'bg-[#173A8A] text-white'
                    : 'bg-amber-100 text-amber-900 border border-amber-300'
                }`}
              >
                {isOpen ? <CheckCircle2 className="w-3.5 h-3.5" /> : isClosed ? <XCircle className="w-3.5 h-3.5" /> : <Clock className="w-3.5 h-3.5" />}
                {isOpen ? 'APPLICATIONS OPEN' : isClosed ? 'APPLICATIONS CLOSED' : statusLabel(currentStatus)}
              </span>

              {is_featured && (
                <span className="text-xs font-bold uppercase tracking-wider px-2.5 py-1 rounded-full bg-[#FFC928]/25 text-[#854D0E] flex items-center gap-1">
                  <Sparkles className="w-3 h-3" />
                  Featured
                </span>
              )}

              {is_verified && (
                <span className="text-xs font-semibold px-2.5 py-1 rounded-full bg-blue-50 text-[#173A8A] flex items-center gap-1">
                  <ShieldCheck className="w-3.5 h-3.5" />
                  Verified
                </span>
              )}
            </div>

            <div className="text-xs text-[#667085] flex items-center gap-1.5 font-medium">
              <Calendar className="w-3.5 h-3.5 text-[#173A8A]" />
              <span>
                Deadline: <strong className="text-[#101828]">{deadlineDisplay}</strong>
              </span>
            </div>
          </div>

          {/* Provider Logo & Title Row */}
          <div className="flex flex-col sm:flex-row items-start gap-5 mb-5">
            {/* Flexible Logo Container */}
            <div className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl bg-slate-50 border border-slate-200/90 p-2 flex items-center justify-center shrink-0 shadow-2xs overflow-hidden">
              {logo_url ? (
                <img
                  src={logo_url}
                  alt={logo_alt_text || providerName}
                  className="max-w-full max-h-full object-contain"
                />
              ) : (
                <div className="w-full h-full rounded-xl bg-gradient-to-br from-[#050D2B] to-[#173A8A] text-[#FFC928] flex items-center justify-center font-heading font-extrabold text-2xl shadow-2xs">
                  {initial}
                </div>
              )}
            </div>

            <div className="flex-1 min-w-0">
              <h1 className="font-heading font-extrabold text-2xl sm:text-3xl text-[#101828] leading-tight mb-2">
                {displayTitle}
              </h1>

              <div className="flex flex-wrap items-center gap-y-2 gap-x-6 text-sm text-[#667085]">
                {providerName && (
                  <div className="flex items-center gap-1.5">
                    <span className="text-xs uppercase tracking-wider font-semibold text-[#173A8A]">Provider:</span>
                    <span className="font-bold text-[#101828]">{providerName}</span>
                  </div>
                )}
                {institutionName && (
                  <div className="flex items-center gap-1.5">
                    <Building2 className="w-4 h-4 text-[#173A8A]" />
                    <span className="font-medium text-[#101828]">{institutionName}</span>
                  </div>
                )}
                <div className="flex items-center gap-1.5">
                  <Globe className="w-4 h-4 text-[#173A8A]" />
                  <span>{host_country || 'Ghana'}</span>
                </div>
              </div>
            </div>
          </div>

          {/* Key Attributes Pills */}
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 pt-5 border-t border-slate-100 text-xs">
            <div className="bg-[#F5F7FC] p-3 rounded-xl border border-slate-100">
              <span className="text-[#667085] block mb-1">Funding Type</span>
              <strong className="text-[#101828] font-bold block truncate">
                {fundingTypeLabel(funding_type)}
              </strong>
            </div>

            <div className="bg-[#F5F7FC] p-3 rounded-xl border border-slate-100">
              <span className="text-[#667085] block mb-1">Geographic Scope</span>
              <strong className="text-[#101828] font-bold block truncate">
                {scopeLabel(geographic_scope || scope)}
              </strong>
            </div>

            <div className="bg-[#F5F7FC] p-3 rounded-xl border border-slate-100">
              <span className="text-[#667085] block mb-1">Study Level</span>
              <strong className="text-[#101828] font-bold block truncate">
                {Array.isArray(study_levels) && study_levels.length > 0
                  ? study_levels.map((l) => studyLevelLabel(l)).join(', ')
                  : 'All Levels'}
              </strong>
            </div>

            <div className="bg-[#F5F7FC] p-3 rounded-xl border border-slate-100">
              <span className="text-[#667085] block mb-1">Gender Eligibility</span>
              <strong className="text-[#101828] font-bold block truncate">
                {genderLabel(gender_eligibility)}
              </strong>
            </div>
          </div>

          {/* Action Toolbar inside Header Card */}
          <div className="flex flex-wrap items-center justify-between gap-3 pt-5 mt-5 border-t border-slate-100">
            <div className="flex flex-wrap items-center gap-2.5">
              {/* Track Application Button */}
              <button
                type="button"
                onClick={handleTrackApplication}
                className={`inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-xs sm:text-sm font-bold transition-all shadow-xs ${
                  trackedRecord
                    ? 'bg-blue-100 border border-blue-300 text-blue-900 shadow-2xs hover:bg-blue-200'
                    : 'bg-[#173A8A] text-white hover:bg-[#122d6e]'
                }`}
              >
                <Send className="w-4 h-4 shrink-0" />
                <span>{trackedRecord ? `Tracked: ${getStatusMeta(trackedRecord.status).label}` : 'Track Application'}</span>
              </button>

              {/* Save Scholarship Button */}
              <button
                type="button"
                onClick={handleSave}
                className={`inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-xs sm:text-sm font-bold transition-all shadow-xs ${
                  saved
                    ? 'bg-amber-100 border border-amber-300 text-amber-900 shadow-2xs hover:bg-amber-200'
                    : 'bg-[#FFC928] text-[#050D2B] hover:bg-[#FFD84D]'
                }`}
              >
                {saved ? <BookmarkCheck className="w-4 h-4 text-amber-700 shrink-0" /> : <Bookmark className="w-4 h-4 text-[#050D2B] shrink-0" />}
                <span>{saved ? 'Saved in Portal' : 'Save Scholarship'}</span>
              </button>

              {trackedRecord && (
                <Link
                  to="/dashboard?tab=tracker"
                  className="text-xs font-bold text-royal hover:underline ml-1"
                >
                  View in Tracker →
                </Link>
              )}
            </div>

            {finalOfficialUrl && (
              <a
                href={finalOfficialUrl}
                target="_blank"
                rel="noopener noreferrer"
                onClick={handleApplyClick}
                className="inline-flex items-center gap-2 px-5 py-2.5 bg-slate-900 text-white font-bold text-xs sm:text-sm rounded-xl hover:bg-slate-800 transition-colors shadow-2xs"
              >
                <span>Apply on Official Website</span>
                <ExternalLink className="w-3.5 h-3.5" />
              </a>
            )}
          </div>
        </div>

        {/* Structured Detail Sections */}
        <div className="space-y-6">
          {/* 1. Overview */}
          <div className="bg-white rounded-3xl border border-[#E4E7EC] p-6 sm:p-8 shadow-sm">
            <h2 className="font-heading font-extrabold text-lg text-[#101828] mb-4 flex items-center gap-2">
              <FileText className="w-5 h-5 text-[#173A8A]" />
              Scholarship Overview
            </h2>
            <div className="text-sm text-[#475467] leading-relaxed space-y-4">
              <p>{description || short_description || 'Detailed opportunity description will be provided shortly.'}</p>
            </div>
          </div>

          {/* 2. Eligibility Criteria */}
          {(eligibility_criteria || eligibility_requirements) && (
            <div className="bg-white rounded-3xl border border-[#E4E7EC] p-6 sm:p-8 shadow-sm">
              <h2 className="font-heading font-extrabold text-lg text-[#101828] mb-4 flex items-center gap-2">
                <CheckCircle2 className="w-5 h-5 text-emerald-600" />
                Eligibility Criteria
              </h2>
              {Array.isArray(eligibility_criteria) ? (
                <ul className="space-y-2.5 text-sm text-[#475467]">
                  {eligibility_criteria.map((req, i) => (
                    <li key={i} className="flex items-start gap-2.5">
                      <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 mt-2 shrink-0" />
                      <span>{req}</span>
                    </li>
                  ))}
                </ul>
              ) : (
                <div className="text-sm text-[#475467] leading-relaxed whitespace-pre-line">
                  {eligibility_criteria || eligibility_requirements}
                </div>
              )}
            </div>
          )}

          {/* 3. Benefits & Coverage */}
          {benefits && (
            <div className="bg-white rounded-3xl border border-[#E4E7EC] p-6 sm:p-8 shadow-sm">
              <h2 className="font-heading font-extrabold text-lg text-[#101828] mb-4 flex items-center gap-2">
                <Award className="w-5 h-5 text-[#FFC928]" />
                Benefits & Coverage
              </h2>
              {Array.isArray(benefits) ? (
                <ul className="space-y-2.5 text-sm text-[#475467]">
                  {benefits.map((b, i) => (
                    <li key={i} className="flex items-start gap-2.5">
                      <span className="w-1.5 h-1.5 rounded-full bg-[#FFC928] mt-2 shrink-0" />
                      <span>{b}</span>
                    </li>
                  ))}
                </ul>
              ) : (
                <div className="text-sm text-[#475467] leading-relaxed whitespace-pre-line">
                  {benefits}
                </div>
              )}
            </div>
          )}

          {/* 4. Required Documents */}
          {required_documents && (
            <div className="bg-white rounded-3xl border border-[#E4E7EC] p-6 sm:p-8 shadow-sm">
              <h2 className="font-heading font-extrabold text-lg text-[#101828] mb-4 flex items-center gap-2">
                <FileText className="w-5 h-5 text-[#173A8A]" />
                Required Application Documents
              </h2>
              {Array.isArray(required_documents) ? (
                <ul className="space-y-2.5 text-sm text-[#475467]">
                  {required_documents.map((doc, i) => (
                    <li key={i} className="flex items-start gap-2.5">
                      <span className="w-1.5 h-1.5 rounded-full bg-[#173A8A] mt-2 shrink-0" />
                      <span>{doc}</span>
                    </li>
                  ))}
                </ul>
              ) : (
                <div className="text-sm text-[#475467] leading-relaxed whitespace-pre-line">
                  {required_documents}
                </div>
              )}
            </div>
          )}
        </div>

        {/* Official Application Portal Banner */}
        <div className="bg-gradient-to-br from-[#050D2B] to-[#173A8A] text-white rounded-3xl p-6 sm:p-8 shadow-card space-y-4">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
            <div>
              <span className="text-xs font-bold text-[#FFC928] uppercase tracking-wider block mb-1">
                Official External Portal
              </span>
              <h3 className="font-heading font-extrabold text-xl text-white">
                Apply Directly Through {providerName}
              </h3>
              <p className="text-xs text-white/75 mt-1 max-w-xl">
                Students do not apply through this discovery portal. You will be redirected to the provider's verified external portal.
              </p>
            </div>

            <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-3 shrink-0">
              <button
                type="button"
                onClick={handleTrackApplication}
                className={`inline-flex items-center justify-center gap-2 px-5 py-3.5 rounded-xl font-heading font-bold text-sm transition-all shadow-sm ${
                  trackedRecord
                    ? 'bg-blue-500 text-white hover:bg-blue-400'
                    : 'bg-white/10 hover:bg-white/20 text-white border border-white/25'
                }`}
              >
                <Send className="w-4 h-4 text-white" />
                <span>{trackedRecord ? `Tracked: ${getStatusMeta(trackedRecord.status).label}` : 'Track Application'}</span>
              </button>

              <button
                type="button"
                onClick={handleSave}
                className={`inline-flex items-center justify-center gap-2 px-5 py-3.5 rounded-xl font-heading font-bold text-sm transition-all shadow-sm ${
                  saved
                    ? 'bg-amber-400 text-slate-950 hover:bg-amber-300'
                    : 'bg-white/10 hover:bg-white/20 text-white border border-white/25'
                }`}
              >
                {saved ? <BookmarkCheck className="w-4 h-4 text-slate-950" /> : <Bookmark className="w-4 h-4 text-[#FFC928]" />}
                <span>{saved ? 'Saved in Portal' : 'Save Scholarship'}</span>
              </button>

              {finalOfficialUrl ? (
                <a
                  href={finalOfficialUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  onClick={handleApplyClick}
                  className="inline-flex items-center justify-center gap-2 px-6 py-3.5 bg-[#FFC928] text-[#050D2B] font-heading font-black text-sm rounded-xl hover:bg-[#FFD84D] transition-all shadow-gold"
                >
                  <span>Visit Official Portal</span>
                  <ExternalLink className="w-4 h-4" />
                </a>
              ) : (
                <button
                  disabled
                  className="px-6 py-3.5 bg-white/20 text-white/60 font-bold text-xs rounded-xl cursor-not-allowed"
                >
                  Application Link Not Announced
                </button>
              )}
            </div>
          </div>
        </div>

        {/* Similar Opportunities */}
        {similar.length > 0 && (
          <div className="space-y-4 pt-6">
            <h2 className="font-heading font-extrabold text-xl text-[#101828]">
              Similar Opportunities You May Qualify For
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              {similar.map((s) => (
                <ScholarshipCard key={s.id} scholarship={s} />
              ))}
            </div>
          </div>
        )}
      </div>

      {/* Interactive Application Progress Tracker Modal */}
      <ApplicationStatusModal
        isOpen={trackerModalOpen}
        onClose={() => setTrackerModalOpen(false)}
        application={trackedRecord}
        onSave={handleModalSave}
      />
    </div>
  );
}

export { ScholarshipDetailPage };
