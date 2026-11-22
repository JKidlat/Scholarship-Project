/**
 * @file ScholarshipCard.jsx
 * @description Standardized, high-density scholarship opportunity card.
 *
 * Design Guidelines:
 * - Content-first layout: Prioritizes sponsor identity, verified badges, and deadline urgency
 * - Handles authentic sponsor logos with fallback to monogram badges
 * - Completely avoids generic AI cliparts or artificial decorative illustrations
 * - Responsive support for both 'default' grid card and 'compact' list row variants
 */

import React, { memo, useState, useEffect } from 'react';
import { Link, useNavigate, useLocation } from 'react-router-dom';
import {
  ExternalLink,
  Calendar,
  Globe,
  Award,
  GraduationCap,
  Building2,
  CheckCircle2,
  XCircle,
  Clock,
  Sparkles,
  Users,
  Bookmark,
  BookmarkCheck,
  Send,
} from 'lucide-react';
import { useAuth } from '../../context/AuthContext';
import { isScholarshipSaved, saveScholarship, removeSavedScholarship } from '../../services/savedScholarships';
import { isScholarshipTracked, addTrackedApplication } from '../../services/trackedApplications';
import {
  cn,
  statusLabel,
  fundingTypeLabel,
  formatDate,
  studyLevelLabel,
  scopeLabel,
} from '../../utils/formatters';

export const ScholarshipCard = memo(function ScholarshipCard({ scholarship, variant = 'default', className }) {
  if (!scholarship) return null;

  const navigate = useNavigate();
  const location = useLocation();
  const { user } = useAuth();

  const [isSaved, setIsSaved] = useState(() => isScholarshipSaved(user, scholarship));
  const [isTracked, setIsTracked] = useState(() => isScholarshipTracked(user, scholarship));

  useEffect(() => {
    setIsSaved(isScholarshipSaved(user, scholarship));

    const handleSync = () => {
      setIsSaved(isScholarshipSaved(user, scholarship));
    };

    window.addEventListener('saved-scholarships-changed', handleSync);
    window.addEventListener('storage', handleSync);
    return () => {
      window.removeEventListener('saved-scholarships-changed', handleSync);
      window.removeEventListener('storage', handleSync);
    };
  }, [user, scholarship]);

  useEffect(() => {
    setIsTracked(isScholarshipTracked(user, scholarship));

    const handleTrackSync = () => {
      setIsTracked(isScholarshipTracked(user, scholarship));
    };

    window.addEventListener('tracked-applications-changed', handleTrackSync);
    window.addEventListener('storage', handleTrackSync);
    return () => {
      window.removeEventListener('tracked-applications-changed', handleTrackSync);
      window.removeEventListener('storage', handleTrackSync);
    };
  }, [user, scholarship]);

  const handleBookmarkToggle = async (e) => {
    e.preventDefault();
    e.stopPropagation();

    if (!user) {
      if (typeof sessionStorage !== 'undefined') {
        sessionStorage.setItem('pending_save_slug', scholarship.slug || scholarship.id);
      }
      navigate(`/auth/login?prompt=save&redirect=${encodeURIComponent(location.pathname + location.search)}`);
      return;
    }

    try {
      if (isSaved) {
        await removeSavedScholarship(user, scholarship.id || scholarship.slug);
        setIsSaved(false);
      } else {
        await saveScholarship(user, scholarship);
        setIsSaved(true);
      }
    } catch (err) {
      console.error('Bookmark toggle failed:', err);
    }
  };

  const handleTrackerToggle = async (e) => {
    e.preventDefault();
    e.stopPropagation();

    if (!user) {
      if (typeof sessionStorage !== 'undefined') {
        sessionStorage.setItem('pending_track_slug', scholarship.slug || scholarship.id);
      }
      navigate(`/auth/login?prompt=track&redirect=${encodeURIComponent(location.pathname + location.search)}`);
      return;
    }

    if (isTracked) {
      navigate('/dashboard?tab=tracker');
    } else {
      try {
        await addTrackedApplication(user, scholarship, 'preparing');
        setIsTracked(true);
      } catch (err) {
        console.error('Failed to add to tracker:', err);
      }
    }
  };

  const {
    id,
    slug,
    title,
    name,
    description,
    short_description,
    application_status,
    status,
    funding_type,
    study_levels,
    geographic_scope,
    scope,
    application_deadline,
    deadline,
    deadline_text,
    provider,
    institution,
    gender_eligibility,
    is_featured,
    logo_url,
    logo_alt_text,
  } = scholarship;

  const displayTitle = title || name || 'Scholarship Opportunity';
  const providerName = typeof provider === 'object' && provider ? provider.name : (provider || 'Various Sponsors');
  const institutionName = typeof institution === 'object' && institution ? institution.name : institution;

  const currentStatus = application_status || status || 'open';
  const isOpen = currentStatus === 'open';
  const isClosed = currentStatus === 'closed';
  const isUpcoming = currentStatus === 'upcoming';

  const rawDeadline = application_deadline || deadline;
  const deadlineDisplay = rawDeadline
    ? formatDate(rawDeadline)
    : deadline_text || (currentStatus === 'rolling' ? 'Rolling Applications' : 'Deadline unannounced');

  // Provider initial for fallback logo
  const initial = providerName ? providerName.trim().charAt(0).toUpperCase() : 'S';

  const displayScope = geographic_scope || scope || 'local';
  const displayLevel = Array.isArray(study_levels) && study_levels.length > 0
    ? study_levels.slice(0, 2).map((l) => studyLevelLabel(l)).join(', ')
    : 'All Study Levels';

  if (variant === 'compact') {
    return (
      <Link
        to={`/scholarship/${slug || id}`}
        state={{ scholarship }}
        className={cn(
          'block bg-white border border-[#E4E7EC] rounded-xl p-4 card-hover group shadow-2xs hover:border-[#173A8A]/30 transition-all',
          className
        )}
      >
        <div className="flex items-start justify-between gap-3 mb-2">
          <div className="flex items-center gap-2.5 min-w-0">
            {logo_url ? (
              <div className="w-9 h-9 rounded-lg bg-slate-50 border border-slate-200/80 p-1 flex items-center justify-center shrink-0 overflow-hidden">
                <img
                  src={logo_url}
                  alt={logo_alt_text || providerName}
                  loading="lazy"
                  width="36"
                  height="36"
                  className="max-w-full max-h-full object-contain"
                  onError={(e) => {
                    e.target.style.display = 'none';
                  }}
                />
              </div>
            ) : (
              <div className="w-9 h-9 rounded-lg bg-gradient-to-br from-[#050D2B] to-[#173A8A] text-[#FFC928] flex items-center justify-center font-heading font-extrabold text-xs shrink-0">
                {initial}
              </div>
            )}
            <div className="min-w-0">
              <h3
                title={displayTitle}
                className="font-heading font-bold text-[#101828] text-sm leading-snug group-hover:text-[#173A8A] transition-colors line-clamp-1"
              >
                {displayTitle}
              </h3>
              <p className="text-[11px] text-[#667085] truncate">{providerName}</p>
            </div>
          </div>

          <div className="flex items-center gap-1.5 shrink-0">
            <span
              className={cn(
                'text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded-full shrink-0 flex items-center gap-1',
                isOpen
                  ? 'bg-emerald-600 text-white'
                  : isClosed
                  ? 'bg-rose-600 text-white'
                  : 'bg-amber-100 text-amber-800'
              )}
            >
              {isOpen ? <CheckCircle2 className="w-2.5 h-2.5" /> : isClosed ? <XCircle className="w-2.5 h-2.5" /> : null}
              {isOpen ? 'OPEN' : isClosed ? 'CLOSED' : statusLabel(currentStatus)}
            </span>
            <button
              type="button"
              onClick={handleBookmarkToggle}
              className={cn(
                'p-1 rounded-md border transition-all shrink-0',
                isSaved
                  ? 'bg-amber-100 border-amber-300 text-amber-900'
                  : 'bg-white border-slate-200 text-slate-400 hover:text-[#173A8A]'
              )}
              title={isSaved ? 'Saved in Student Portal' : 'Save to Student Portal'}
              aria-label={isSaved ? 'Remove from Saved' : 'Save Scholarship'}
            >
              {isSaved ? <BookmarkCheck className="w-3 h-3 text-amber-600" /> : <Bookmark className="w-3 h-3" />}
            </button>
          </div>
        </div>

        <div className="flex items-center gap-1.5 text-[11px] text-[#667085] mt-2 pt-2 border-t border-slate-100">
          <Calendar className="w-3 h-3 text-[#173A8A] shrink-0" />
          <span className="truncate">{deadlineDisplay}</span>
        </div>
      </Link>
    );
  }

  return (
    <article
      className={cn(
        'bg-white border rounded-2xl overflow-hidden card-hover group flex flex-col h-full justify-between transition-all duration-200',
        isOpen ? 'border-emerald-200/90 shadow-2xs hover:shadow-md hover:border-emerald-300' : 'border-[#E4E7EC] shadow-2xs hover:shadow-md hover:border-[#173A8A]/30',
        is_featured && 'ring-2 ring-[#FFC928]/80 shadow-md shadow-[#FFC928]/10',
        className
      )}
    >
      {/* Top indicator color strip */}
      <div
        className={cn(
          'h-1.5 w-full shrink-0',
          isOpen
            ? 'bg-emerald-500'
            : isClosed
            ? 'bg-rose-500'
            : isUpcoming
            ? 'bg-[#173A8A]'
            : 'bg-amber-400'
        )}
      />

      <div className="p-5 flex flex-col flex-1 justify-between">
        {/* UPPER BLOCK */}
        <div>
          {/* Header Row: Logo, Provider/Institution, Status Badge */}
          <div className="flex items-start justify-between gap-3 mb-3.5">
            <div className="flex items-center gap-2.5 min-w-0 flex-1">
              {/* Flexible Logo Container */}
              <div className="w-14 h-12 rounded-xl bg-slate-50/90 border border-slate-200/80 p-1 flex items-center justify-center shrink-0 overflow-hidden">
                {logo_url ? (
                  <img
                    src={logo_url}
                    alt={logo_alt_text || providerName}
                    loading="lazy"
                    width="48"
                    height="40"
                    className="max-w-full max-h-full object-contain"
                    onError={(e) => {
                      e.target.style.display = 'none';
                    }}
                  />
                ) : (
                  <div className="w-full h-full rounded-lg bg-gradient-to-br from-[#050D2B] to-[#173A8A] text-[#FFC928] flex items-center justify-center font-heading font-extrabold text-base shadow-2xs">
                    {initial}
                  </div>
                )}
              </div>

              {/* Provider & Institution Meta */}
              <div className="min-w-0 flex-1">
                <span
                  title={providerName}
                  className="text-xs font-bold text-[#173A8A] block truncate uppercase tracking-wider leading-tight"
                >
                  {providerName}
                </span>
                {institutionName ? (
                  <span
                    title={institutionName}
                    className="text-[11px] text-[#667085] flex items-center gap-1 truncate mt-0.5"
                  >
                    <Building2 className="w-3 h-3 shrink-0 text-slate-400" />
                    <span className="truncate">{institutionName}</span>
                  </span>
                ) : (
                  <span className="text-[11px] text-slate-400 block truncate mt-0.5">
                    Universal Eligibility
                  </span>
                )}
              </div>
            </div>

            {/* Status Indicator Badge and Bookmark Action */}
            <div className="shrink-0 flex items-center gap-1.5">
              {is_featured && (
                <span className="hidden sm:inline-flex text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded-full bg-[#FFC928]/20 text-[#854D0E] items-center gap-1">
                  <Sparkles className="w-2.5 h-2.5" />
                  Featured
                </span>
              )}
              <span
                className={cn(
                  'text-[10px] font-extrabold uppercase tracking-wider px-2.5 py-1 rounded-full flex items-center gap-1 shadow-2xs whitespace-nowrap',
                  isOpen
                    ? 'bg-emerald-600 text-white'
                    : isClosed
                    ? 'bg-rose-600 text-white'
                    : isUpcoming
                    ? 'bg-[#173A8A] text-white'
                    : 'bg-amber-100 text-amber-900 border border-amber-300'
                )}
              >
                {isOpen && <CheckCircle2 className="w-3 h-3 text-white shrink-0" />}
                {isClosed && <XCircle className="w-3 h-3 text-white shrink-0" />}
                {!isOpen && !isClosed && <Clock className="w-3 h-3 text-amber-800 shrink-0" />}
                <span>{isOpen ? 'OPEN' : isClosed ? 'CLOSED' : statusLabel(currentStatus)}</span>
              </span>

              {/* Tracker Button */}
              <button
                type="button"
                onClick={handleTrackerToggle}
                className={cn(
                  'p-1.5 rounded-lg border transition-all shrink-0',
                  isTracked
                    ? 'bg-blue-100 border-blue-300 text-royal shadow-2xs hover:bg-blue-200'
                    : 'bg-white border-slate-200 text-slate-400 hover:text-royal hover:border-slate-300 hover:bg-slate-50'
                )}
                title={isTracked ? 'Tracked in Student Portal (Click to view)' : 'Add to Application Tracker'}
                aria-label={isTracked ? 'View in Application Tracker' : 'Add to Application Tracker'}
              >
                <Send className="w-3.5 h-3.5" />
              </button>

              {/* Bookmark Save Button */}
              <button
                type="button"
                onClick={handleBookmarkToggle}
                className={cn(
                  'p-1.5 rounded-lg border transition-all shrink-0',
                  isSaved
                    ? 'bg-amber-100 border-amber-300 text-amber-900 shadow-2xs hover:bg-amber-200'
                    : 'bg-white border-slate-200 text-slate-400 hover:text-[#173A8A] hover:border-slate-300 hover:bg-slate-50'
                )}
                title={isSaved ? 'Saved in Student Portal (Click to remove)' : 'Save to Student Portal'}
                aria-label={isSaved ? 'Remove from Saved Scholarships' : 'Save Scholarship'}
              >
                {isSaved ? (
                  <BookmarkCheck className="w-3.5 h-3.5 text-amber-600" />
                ) : (
                  <Bookmark className="w-3.5 h-3.5" />
                )}
              </button>
            </div>
          </div>

          {/* Title with fixed height to guarantee vertical alignment across row */}
          <h3
            title={displayTitle}
            className="font-heading font-bold text-[#101828] text-base leading-snug mb-2 group-hover:text-[#173A8A] transition-colors line-clamp-2 min-h-[2.75rem] flex items-center"
          >
            <Link
              to={`/scholarship/${slug || id}`}
              state={{ scholarship }}
              className="line-clamp-2"
            >
              {displayTitle}
            </Link>
          </h3>

          {/* Description with fixed height */}
          <p className="text-xs text-[#667085] leading-relaxed mb-4 line-clamp-2 h-[2.5rem] overflow-hidden">
            {short_description || description || 'Verified scholarship opportunity for Ghanaian students.'}
          </p>

          {/* Standardized 2x2 Metadata Grid — identical height across all cards */}
          <div className="grid grid-cols-2 gap-2 mb-4 bg-slate-50/90 p-2.5 rounded-xl border border-slate-100/90 text-[11px] text-[#667085]">
            <div className="flex items-center gap-1.5 min-w-0" title={fundingTypeLabel(funding_type)}>
              <Award className="w-3.5 h-3.5 text-[#173A8A] shrink-0" />
              <span className="truncate font-medium">{fundingTypeLabel(funding_type)}</span>
            </div>

            <div className="flex items-center gap-1.5 min-w-0" title={scopeLabel(displayScope)}>
              <Globe className="w-3.5 h-3.5 text-[#173A8A] shrink-0" />
              <span className="truncate font-medium">{scopeLabel(displayScope)}</span>
            </div>

            <div className="flex items-center gap-1.5 min-w-0" title={displayLevel}>
              <GraduationCap className="w-3.5 h-3.5 text-[#173A8A] shrink-0" />
              <span className="truncate font-medium">{displayLevel}</span>
            </div>

            <div className="flex items-center gap-1.5 min-w-0">
              {gender_eligibility && gender_eligibility !== 'all' ? (
                <span className="flex items-center gap-1 text-amber-700 font-semibold truncate">
                  <span className="w-1.5 h-1.5 rounded-full bg-amber-500 shrink-0" />
                  <span className="truncate">Women Priority</span>
                </span>
              ) : (
                <span className="flex items-center gap-1 truncate text-slate-500">
                  <Users className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                  <span className="truncate">All Applicants</span>
                </span>
              )}
            </div>
          </div>
        </div>

        {/* LOWER BLOCK — Pinned to bottom of card */}
        <div className="mt-auto pt-3 border-t border-slate-100 flex flex-col justify-end">
          {/* Deadline Row */}
          <div className="flex items-center justify-between text-xs text-[#667085] mb-3">
            <div className="flex items-center gap-1.5 min-w-0">
              <Calendar className="w-3.5 h-3.5 text-slate-400 shrink-0" />
              <span className="truncate">
                <span className="font-semibold text-[#101828]">Deadline: </span>
                {deadlineDisplay}
              </span>
            </div>
          </div>

          {/* Action CTA Button */}
          <Link
            to={`/scholarship/${slug || id}`}
            state={{ scholarship }}
            className={cn(
              'w-full flex items-center justify-center gap-2 px-4 py-2.5 text-xs font-bold rounded-xl transition-all shadow-2xs',
              isOpen
                ? 'bg-[#FFC928] text-[#050D2B] hover:bg-[#FFD84D]'
                : 'bg-[#173A8A] text-white hover:bg-[#122d6e]'
            )}
          >
            <span>View Details & Apply</span>
            <ExternalLink className="w-3.5 h-3.5 shrink-0" />
          </Link>
        </div>
      </div>
    </article>
  );
});

export function ScholarshipCardSkeleton() {
  return (
    <div className="bg-white border border-[#E4E7EC] rounded-2xl overflow-hidden flex flex-col h-full justify-between animate-pulse">
      <div className="h-1.5 bg-[#E4E7EC] shrink-0" />
      <div className="p-5 flex flex-col flex-1 justify-between">
        <div>
          <div className="flex justify-between items-center mb-3.5">
            <div className="flex items-center gap-2.5">
              <div className="w-14 h-12 rounded-xl bg-slate-200" />
              <div className="space-y-1">
                <div className="h-3 w-24 bg-slate-200 rounded" />
                <div className="h-2.5 w-16 bg-slate-100 rounded" />
              </div>
            </div>
            <div className="h-6 w-16 bg-slate-200 rounded-full" />
          </div>
          <div className="h-5 bg-slate-200 rounded mb-2 w-5/6" />
          <div className="h-8 bg-slate-100 rounded mb-4" />
          <div className="h-16 bg-slate-100 rounded-xl mb-4" />
        </div>
        <div className="mt-auto pt-3 border-t border-slate-100 space-y-3">
          <div className="h-4 bg-slate-100 rounded w-1/2" />
          <div className="h-9 bg-slate-200 rounded-xl" />
        </div>
      </div>
    </div>
  );
}

export default ScholarshipCard;
