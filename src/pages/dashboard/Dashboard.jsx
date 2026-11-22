/**
 * @file Dashboard.jsx
 * @description Authenticated student dashboard.
 *
 * Responsibilities:
 * - Manages bookmarked scholarships
 * - Tracks application submission milestones
 * - Manages academic profile attributes (GPA, field, study level) for scholarship matching
 */

import React, { useState, useEffect, useCallback, useMemo, useRef } from 'react';
import { Link, useSearchParams, useNavigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';
import { supabase, isSupabaseConfigured } from '../../services/supabase';
import {
  uploadAvatar,
  removeAvatar,
  deleteUserAccount,
  updateUserProfile,
} from '../../services/auth';
import { getSavedScholarships, removeSavedScholarship } from '../../services/savedScholarships';
import {
  getTrackedApplications,
  addTrackedApplication,
  updateTrackedApplication,
  removeTrackedApplication,
  getApplicationReminders,
  getStatusMeta,
  APPLICATION_STATUSES,
} from '../../services/trackedApplications';
import { ApplicationStatusModal } from '../../components/dashboard/ApplicationStatusModal';
import { DeleteAccountModal } from '../../components/dashboard/DeleteAccountModal';
import { Button } from '../../components/common/Button';
import { StatusBadge } from '../../components/common/StatusBadge';
import { EmptyState } from '../../components/common/EmptyState';
import { formatDate } from '../../utils/formatters';
import {
  Bookmark,
  Send,
  User,
  GraduationCap,
  Calendar,
  ExternalLink,
  Trash2,
  CheckCircle2,
  Clock,
  Sparkles,
  ArrowRight,
  School,
  BookOpen,
  Building2,
  Globe,
  Filter,
  Search,
  Bell,
  Award,
  AlertCircle,
  X,
  ChevronRight,
  Info,
  ListChecks,
  Hash,
  FileCheck2,
  Camera,
  Upload,
  AlertTriangle,
  Loader2,
} from 'lucide-react';

export default function Dashboard() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const initialTab = searchParams.get('tab') === 'tracker' ? 'tracker' : (searchParams.get('tab') === 'profile' ? 'profile' : 'saved');

  const { user, profile, loading: authLoading } = useAuth();
  const [activeTab, setActiveTab] = useState(initialTab);
  const [savedItems, setSavedItems] = useState([]);
  const [applications, setApplications] = useState([]);
  const [loading, setLoading] = useState(true);

  // Avatar Management State
  const avatarInputRef = useRef(null);
  const [avatarUploading, setAvatarUploading] = useState(false);
  const [avatarError, setAvatarError] = useState('');
  const [avatarSuccess, setAvatarSuccess] = useState('');

  // Account Deletion State
  const [deleteModalOpen, setDeleteModalOpen] = useState(false);
  const [isDeletingAccount, setIsDeletingAccount] = useState(false);

  // Tracker Filters & Modal State
  const [statusFilter, setStatusFilter] = useState('all');
  const [deadlineFilter, setDeadlineFilter] = useState('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedApp, setSelectedApp] = useState(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [dismissedReminderIds, setDismissedReminderIds] = useState(() => {
    if (typeof sessionStorage === 'undefined') return [];
    try {
      const raw = sessionStorage.getItem('gh_dismissed_reminders');
      return raw ? JSON.parse(raw) : [];
    } catch {
      return [];
    }
  });

  // Academic Profile state
  const [profileData, setProfileData] = useState({
    institution: '',
    field_of_study: '',
    study_level: 'undergraduate',
    gpa: '',
    graduation_year: '2026',
    gender: 'all',
  });
  const [savingProfile, setSavingProfile] = useState(false);
  const [profileSavedMsg, setProfileSavedMsg] = useState(false);

  const loadUserData = useCallback(async () => {
    if (!user) {
      setLoading(false);
      return;
    }

    setLoading(true);
    try {
      // 1. Fetch saved scholarships from database service
      const savedData = await getSavedScholarships(user);
      setSavedItems(savedData || []);

      // 2. Fetch tracked applications from tracking service
      const trackedData = await getTrackedApplications(user);
      setApplications(trackedData || []);

      // 3. User profile data
      if (profile) {
        setProfileData({
          institution: profile.institution || '',
          field_of_study: profile.field_of_study || '',
          study_level: profile.study_level || 'undergraduate',
          gpa: profile.gpa || '',
          graduation_year: profile.graduation_year || '2026',
          gender: profile.gender || 'all',
        });
      }
    } catch (err) {
      console.error('Error loading dashboard data:', err);
    } finally {
      setLoading(false);
    }
  }, [user, profile]);

  useEffect(() => {
    loadUserData();

    // Real-time synchronization whenever scholarships or tracking records change
    const handleSync = () => {
      loadUserData();
    };

    window.addEventListener('saved-scholarships-changed', handleSync);
    window.addEventListener('tracked-applications-changed', handleSync);
    window.addEventListener('storage', handleSync);

    return () => {
      window.removeEventListener('saved-scholarships-changed', handleSync);
      window.removeEventListener('tracked-applications-changed', handleSync);
      window.removeEventListener('storage', handleSync);
    };
  }, [loadUserData]);

  async function removeSaved(savedId) {
    if (!user) return;
    try {
      await removeSavedScholarship(user, savedId);
      setSavedItems((prev) =>
        prev.filter((item) => {
          const s = item.scholarship || item;
          const linkSlug = s.slug || s.id || item.scholarship_slug || item.scholarship_id;
          return item.id !== savedId && item.scholarship_id !== savedId && linkSlug !== savedId;
        })
      );
    } catch (err) {
      console.error('Failed to remove saved scholarship:', err);
    }
  }

  async function handleTrackFromSaved(scholarship) {
    if (!user || !scholarship) return;
    try {
      await addTrackedApplication(user, scholarship, 'preparing');
      setActiveTab('tracker');
    } catch (err) {
      console.error('Failed to track from saved tab:', err);
    }
  }

  async function handleQuickMarkSubmitted(app) {
    if (!user || !app) return;
    try {
      const today = new Date().toISOString();
      await updateTrackedApplication(user, app.id, {
        status: 'submitted',
        submission_date: today,
        status_change_note: 'Marked as submitted from Application Tracker.',
      });
    } catch (err) {
      console.error('Quick mark submitted failed:', err);
    }
  }

  async function handleRemoveTracked(appId) {
    if (!user || !appId) return;
    if (window.confirm('Are you sure you want to remove this scholarship from your Application Progress Tracker? Your personal notes and status history for this item will be deleted.')) {
      try {
        await removeTrackedApplication(user, appId);
        setApplications((prev) => prev.filter((a) => a.id !== appId));
      } catch (err) {
        console.error('Failed to remove tracked application:', err);
      }
    }
  }

  async function handleSaveModal(updates) {
    if (!user || !selectedApp) return;
    try {
      const updated = await updateTrackedApplication(user, selectedApp.id, updates);
      if (updated) {
        setApplications((prev) => prev.map((a) => (a.id === updated.id ? updated : a)));
      }
    } catch (err) {
      console.error('Failed to save modal updates:', err);
    }
  }

  const handleDismissReminder = (reminderId) => {
    setDismissedReminderIds((prev) => {
      const next = [...prev, reminderId];
      if (typeof sessionStorage !== 'undefined') {
        sessionStorage.setItem('gh_dismissed_reminders', JSON.stringify(next));
      }
      return next;
    });
  };

  const handleAvatarFileChange = async (e) => {
    const file = e.target.files?.[0];
    if (!file || !user) return;
    setAvatarUploading(true);
    setAvatarError('');
    setAvatarSuccess('');
    try {
      await uploadAvatar(user.id, file);
      setAvatarSuccess('Profile picture updated successfully!');
      setTimeout(() => setAvatarSuccess(''), 4000);
    } catch (err) {
      setAvatarError(err.message || 'Failed to upload profile picture.');
    } finally {
      setAvatarUploading(false);
      if (avatarInputRef.current) avatarInputRef.current.value = '';
    }
  };

  const handleRemoveAvatar = async () => {
    if (!user) return;
    setAvatarUploading(true);
    setAvatarError('');
    setAvatarSuccess('');
    try {
      await removeAvatar(user.id);
      setAvatarSuccess('Profile picture removed. Reverted to default avatar.');
      setTimeout(() => setAvatarSuccess(''), 4000);
    } catch (err) {
      setAvatarError(err.message || 'Failed to remove profile picture.');
    } finally {
      setAvatarUploading(false);
    }
  };

  const handleConfirmDeleteAccount = async () => {
    if (!user) return;
    setIsDeletingAccount(true);
    try {
      await deleteUserAccount(user.id);
      setDeleteModalOpen(false);
      navigate('/auth/login?prompt=deleted');
    } catch (err) {
      console.error('Account deletion error:', err);
      throw err;
    } finally {
      setIsDeletingAccount(false);
    }
  };

  async function updateProfile(e) {
    e.preventDefault();
    setSavingProfile(true);
    setProfileSavedMsg(false);
    try {
      await updateUserProfile(user.id, profileData);
      setProfileSavedMsg(true);
      setTimeout(() => setProfileSavedMsg(false), 3000);
    } catch (err) {
      console.error('Failed to update profile:', err);
    } finally {
      setSavingProfile(false);
    }
  }

  // Summary Metrics
  const summaryMetrics = useMemo(() => {
    const total = applications.length;
    const inPrep = applications.filter((a) => ['preparing', 'started', 'saved'].includes(a.status)).length;
    const submitted = applications.filter((a) => ['submitted', 'under_review', 'shortlisted'].includes(a.status)).length;
    const interview = applications.filter((a) => a.status === 'interview').length;
    const awarded = applications.filter((a) => a.status === 'awarded').length;
    return { total, inPrep, submitted, interview, awarded };
  }, [applications]);

  // Active Reminders
  const activeReminders = useMemo(() => {
    const reminders = getApplicationReminders(applications);
    return reminders.filter((r) => !dismissedReminderIds.includes(r.id));
  }, [applications, dismissedReminderIds]);

  // Filtered Applications
  const filteredApplications = useMemo(() => {
    return applications.filter((app) => {
      const s = app.scholarship || {};
      // Status filter
      if (statusFilter !== 'all' && app.status !== statusFilter) return false;

      // Search query filter
      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase();
        const matchTitle = (s.title || s.name || '').toLowerCase().includes(q);
        const matchProvider = (typeof s.provider === 'object' ? s.provider?.name : (s.provider || '')).toLowerCase().includes(q);
        const matchRef = (app.reference_number || '').toLowerCase().includes(q);
        if (!matchTitle && !matchProvider && !matchRef) return false;
      }

      // Deadline filter
      if (deadlineFilter !== 'all') {
        const dl = s.application_deadline || s.deadline;
        if (!dl) return deadlineFilter === 'rolling';
        const dlDate = new Date(dl);
        const now = new Date();
        const diffDays = Math.ceil((dlDate.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
        if (deadlineFilter === '7days') return diffDays >= 0 && diffDays <= 7;
        if (deadlineFilter === '14days') return diffDays >= 0 && diffDays <= 14;
        if (deadlineFilter === '30days') return diffDays >= 0 && diffDays <= 30;
        if (deadlineFilter === 'past') return diffDays < 0;
        if (deadlineFilter === 'rolling') return !dl || s.application_status === 'rolling';
      }

      return true;
    });
  }, [applications, statusFilter, deadlineFilter, searchQuery]);

  if (authLoading) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-royal border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

  if (!user) {
    return (
      <div className="min-h-screen bg-[#F5F7FC] py-16 pt-28">
        <div className="container-custom max-w-lg mx-auto">
          <div className="bg-white rounded-3xl border border-[#E4E7EC] p-8 text-center shadow-card space-y-6">
            <div className="w-16 h-16 rounded-2xl bg-amber-50 border border-amber-200 text-amber-600 flex items-center justify-center mx-auto">
              <Bookmark className="w-8 h-8" />
            </div>

            <div>
              <span className="text-xs font-bold uppercase tracking-wider text-royal bg-royal/10 px-3 py-1 rounded-full">
                Student Portal
              </span>
              <h1 className="font-heading font-extrabold text-2xl text-[#101828] mt-3">
                Saved Scholarships Access
              </h1>
              <p className="text-sm text-[#667085] mt-2 leading-relaxed">
                You need to create an account or log in to save scholarships, view your saved listings, and access your personal Student Portal.
              </p>
            </div>

            <div className="space-y-3 pt-2">
              <Link
                to="/auth/login?prompt=save&redirect=/dashboard"
                className="w-full inline-flex items-center justify-center gap-2 px-6 py-3.5 bg-[#FFC928] text-[#050D2B] font-bold text-sm rounded-xl hover:bg-[#FFD84D] transition-all shadow-gold"
              >
                <span>Log In to Your Account</span>
                <ArrowRight className="w-4 h-4" />
              </Link>
              <Link
                to="/auth/register?redirect=/dashboard"
                className="w-full inline-flex items-center justify-center gap-2 px-6 py-3.5 bg-[#173A8A] text-white font-bold text-sm rounded-xl hover:bg-[#122d6e] transition-colors shadow-2xs"
              >
                <span>Create a Free Student Account</span>
              </Link>
            </div>

            <p className="text-xs text-slate-400">
              New students can create an account in 30 seconds to start saving opportunities.
            </p>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-slate-50 py-8">
      <div className="container-custom">
        {/* Header Greeting */}
        <div className="bg-gradient-to-r from-navy-deep via-navy-dark to-royal rounded-3xl p-6 sm:p-8 text-white shadow-xl mb-8 relative overflow-hidden">
          <div className="relative z-10 flex flex-col sm:flex-row sm:items-center justify-between gap-6">
            <div className="flex items-center gap-4 sm:gap-6">
              {/* Profile Avatar Frame with quick update trigger */}
              <div className="relative shrink-0 group">
                {profile?.avatar_url ? (
                  <img
                    src={profile.avatar_url}
                    alt={profile.full_name || 'Profile'}
                    className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl object-cover border-2 border-[#FFC928]/80 shadow-lg shadow-black/25"
                  />
                ) : (
                  <div className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl bg-[#050D2B] border-2 border-white/20 text-[#FFC928] flex items-center justify-center font-heading font-extrabold text-2xl sm:text-3xl shadow-lg">
                    {(profile?.full_name || user?.email || 'S').trim().charAt(0).toUpperCase()}
                  </div>
                )}
                <button
                  type="button"
                  onClick={() => {
                    setActiveTab('profile');
                    setTimeout(() => avatarInputRef.current?.click(), 100);
                  }}
                  className="absolute -bottom-1.5 -right-1.5 p-1.5 bg-[#FFC928] text-[#050D2B] rounded-xl hover:bg-[#FFD84D] shadow-md transition-transform group-hover:scale-110"
                  title="Upload or change profile picture"
                >
                  <Camera className="w-3.5 h-3.5" />
                </button>
              </div>

              <div>
                <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/10 text-gold text-xs font-semibold uppercase tracking-wider mb-2">
                  <Sparkles className="w-3.5 h-3.5" />
                  Student Portal
                </div>
                <h1 className="font-heading text-2xl sm:text-3xl font-extrabold">
                  Welcome back, {profile?.full_name || user?.email?.split('@')[0] || 'Scholar'}!
                </h1>
                <p className="text-slate-300 text-xs sm:text-sm mt-1 leading-relaxed max-w-xl">
                  Track deadlines, manage saved opportunities, and view personalized scholarships tailored to your academic profile.
                </p>
              </div>
            </div>
          </div>
          <div className="absolute -right-12 -bottom-12 w-64 h-64 bg-royal/30 rounded-full blur-3xl pointer-events-none" />
        </div>

        {/* Dashboard Navigation Tabs */}
        <div className="flex border-b border-slate-200 mb-6 gap-2 sm:gap-6 overflow-x-auto">
          <button
            onClick={() => setActiveTab('saved')}
            className={`flex items-center gap-2 py-3 px-3 text-sm font-semibold border-b-2 transition-all whitespace-nowrap ${
              activeTab === 'saved'
                ? 'border-royal text-royal'
                : 'border-transparent text-slate-500 hover:text-slate-900'
            }`}
          >
            <Bookmark className="w-4 h-4" />
            Saved Scholarships ({savedItems.length})
          </button>
          <button
            onClick={() => setActiveTab('tracker')}
            className={`flex items-center gap-2 py-3 px-3 text-sm font-semibold border-b-2 transition-all whitespace-nowrap ${
              activeTab === 'tracker'
                ? 'border-royal text-royal'
                : 'border-transparent text-slate-500 hover:text-slate-900'
            }`}
          >
            <Send className="w-4 h-4" />
            Application Tracker ({applications.length})
          </button>
          <button
            onClick={() => setActiveTab('profile')}
            className={`flex items-center gap-2 py-3 px-3 text-sm font-semibold border-b-2 transition-all whitespace-nowrap ${
              activeTab === 'profile'
                ? 'border-royal text-royal'
                : 'border-transparent text-slate-500 hover:text-slate-900'
            }`}
          >
            <User className="w-4 h-4" />
            Academic Profile
          </button>
        </div>

        {/* TAB 1: SAVED SCHOLARSHIPS */}
        {activeTab === 'saved' && (
          <div>
            {loading ? (
              <div className="py-12 text-center text-slate-400">Loading saved scholarships...</div>
            ) : savedItems.length === 0 ? (
              <EmptyState
                title="No saved scholarships yet"
                description="Browse available opportunities and click the bookmark button on any scholarship card to save it for later."
                actionLabel="Explore Scholarships"
                actionHref="/scholarships"
              />
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                {savedItems.map((item) => {
                  const s = item.scholarship || item;
                  if (!s) return null;
                  const linkSlug = s.slug || s.id || item.scholarship_slug || item.scholarship_id;
                  const displayStatus = s.status || s.application_status || 'open';
                  const displayDeadline = s.application_deadline || s.deadline;
                  const displayFunding = s.funding_type ? s.funding_type.replace('_', ' ') : 'General Funding';
                  const targetRemoveId = item.id || item.scholarship_id || linkSlug;

                  const providerName = typeof s.provider === 'object' && s.provider ? s.provider.name : (s.provider || 'Various Sponsors');
                  const initial = providerName ? providerName.trim().charAt(0).toUpperCase() : 'S';
                  const country = s.host_country || s.country || 'Ghana';

                  return (
                    <div
                      key={item.id || linkSlug}
                      className="bg-white rounded-2xl border border-slate-200 p-5 shadow-card hover:shadow-card-hover transition-all flex flex-col justify-between"
                    >
                      <div>
                        {/* Provider & Status Row */}
                        <div className="flex items-center justify-between gap-2 mb-3">
                          <div className="flex items-center gap-2 min-w-0">
                            {s.logo_url ? (
                              <div className="w-7 h-7 rounded-lg bg-slate-50 border border-slate-200/80 p-0.5 flex items-center justify-center shrink-0 overflow-hidden">
                                <img
                                  src={s.logo_url}
                                  alt={providerName}
                                  className="max-w-full max-h-full object-contain"
                                  onError={(e) => {
                                    e.target.style.display = 'none';
                                  }}
                                />
                              </div>
                            ) : (
                              <div className="w-7 h-7 rounded-lg bg-gradient-to-br from-[#050D2B] to-[#173A8A] text-[#FFC928] flex items-center justify-center font-heading font-extrabold text-[10px] shrink-0">
                                {initial}
                              </div>
                            )}
                            <span className="text-xs font-semibold text-royal uppercase tracking-wider truncate">
                              {providerName}
                            </span>
                          </div>
                          <StatusBadge status={displayStatus} size="sm" />
                        </div>

                        {/* Title */}
                        <h3 className="font-heading font-bold text-navy-deep text-base mb-2 hover:text-royal transition-colors line-clamp-2">
                          <Link to={`/scholarship/${linkSlug}`}>{s.title || s.name}</Link>
                        </h3>

                        {/* Metadata items */}
                        <div className="space-y-1.5 text-xs text-slate-600 mb-4 bg-slate-50/80 p-3 rounded-xl border border-slate-100">
                          <div className="flex items-center gap-1.5">
                            <Clock className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                            <span><strong className="text-slate-800">Deadline:</strong> {displayDeadline ? formatDate(displayDeadline) : 'Rolling / Open'}</span>
                          </div>
                          <div className="flex items-center gap-1.5">
                            <GraduationCap className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                            <span className="capitalize">{displayFunding}</span>
                          </div>
                          <div className="flex items-center gap-1.5">
                            <Globe className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                            <span>{country}</span>
                          </div>
                        </div>
                      </div>

                      {/* Footer Actions */}
                      <div className="flex flex-wrap items-center justify-between gap-2 pt-3 border-t border-slate-100">
                        <div className="flex items-center gap-2">
                          <Link
                            to={`/scholarship/${linkSlug}`}
                            className="text-xs font-bold text-royal hover:underline inline-flex items-center gap-1"
                          >
                            View Details
                            <ArrowRight className="w-3.5 h-3.5" />
                          </Link>
                          <button
                            type="button"
                            onClick={() => handleTrackFromSaved(s)}
                            className="text-xs font-bold text-blue-700 hover:text-blue-900 bg-blue-50 hover:bg-blue-100 px-2.5 py-1 rounded-lg border border-blue-200 inline-flex items-center gap-1 transition-colors"
                            title="Add to Application Progress Tracker"
                          >
                            <Send className="w-3 h-3 text-royal" />
                            <span>Track Application</span>
                          </button>
                        </div>
                        <button
                          type="button"
                          onClick={() => removeSaved(targetRemoveId)}
                          className="text-slate-400 hover:text-red-600 p-1.5 rounded-lg hover:bg-red-50 transition-colors inline-flex items-center gap-1 text-xs font-medium"
                          title="Remove from saved scholarships"
                        >
                          <Trash2 className="w-4 h-4 text-slate-400 hover:text-red-600" />
                          <span className="hidden sm:inline">Remove</span>
                        </button>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        )}

        {/* TAB 2: APPLICATION TRACKER */}
        {activeTab === 'tracker' && (
          <div className="space-y-6">
            {/* Top Metric Summary Counters */}
            <div className="grid grid-cols-2 sm:grid-cols-5 gap-3">
              <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs">
                <span className="text-[11px] font-bold text-slate-400 uppercase tracking-wider block mb-1">
                  Total Tracked
                </span>
                <div className="flex items-baseline justify-between">
                  <span className="font-heading font-extrabold text-2xl text-navy-deep">
                    {summaryMetrics.total}
                  </span>
                  <ListChecks className="w-4 h-4 text-royal opacity-70" />
                </div>
              </div>

              <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs">
                <span className="text-[11px] font-bold text-blue-600 uppercase tracking-wider block mb-1">
                  In Preparation
                </span>
                <div className="flex items-baseline justify-between">
                  <span className="font-heading font-extrabold text-2xl text-blue-800">
                    {summaryMetrics.inPrep}
                  </span>
                  <Clock className="w-4 h-4 text-blue-600 opacity-70" />
                </div>
              </div>

              <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs">
                <span className="text-[11px] font-bold text-indigo-600 uppercase tracking-wider block mb-1">
                  Submitted / Review
                </span>
                <div className="flex items-baseline justify-between">
                  <span className="font-heading font-extrabold text-2xl text-indigo-800">
                    {summaryMetrics.submitted}
                  </span>
                  <FileCheck2 className="w-4 h-4 text-indigo-600 opacity-70" />
                </div>
              </div>

              <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs">
                <span className="text-[11px] font-bold text-sky-600 uppercase tracking-wider block mb-1">
                  Interview
                </span>
                <div className="flex items-baseline justify-between">
                  <span className="font-heading font-extrabold text-2xl text-sky-800">
                    {summaryMetrics.interview}
                  </span>
                  <Send className="w-4 h-4 text-sky-600 opacity-70" />
                </div>
              </div>

              <div className="bg-white p-4 rounded-2xl border border-slate-200 shadow-2xs col-span-2 sm:col-span-1">
                <span className="text-[11px] font-bold text-emerald-600 uppercase tracking-wider block mb-1">
                  Awarded
                </span>
                <div className="flex items-baseline justify-between">
                  <span className="font-heading font-extrabold text-2xl text-emerald-800">
                    {summaryMetrics.awarded}
                  </span>
                  <Award className="w-4 h-4 text-emerald-600 opacity-70" />
                </div>
              </div>
            </div>

            {/* Proactive Notification / Reminder Alerts */}
            {activeReminders.length > 0 && (
              <div className="space-y-2.5">
                {activeReminders.map((rem) => (
                  <div
                    key={rem.id}
                    className={`p-3.5 sm:p-4 rounded-2xl border flex items-start justify-between gap-3 shadow-xs transition-all ${
                      rem.type === 'urgent'
                        ? 'bg-rose-50/90 border-rose-200 text-rose-950'
                        : rem.type === 'interview'
                        ? 'bg-sky-50/90 border-sky-200 text-sky-950'
                        : rem.type === 'warning'
                        ? 'bg-amber-50/90 border-amber-200 text-amber-950'
                        : 'bg-blue-50/90 border-blue-200 text-blue-950'
                    }`}
                  >
                    <div className="flex items-start gap-3 min-w-0">
                      <div className="mt-0.5 shrink-0">
                        {rem.type === 'urgent' && <AlertCircle className="w-4 h-4 text-rose-600" />}
                        {rem.type === 'interview' && <Clock className="w-4 h-4 text-sky-600" />}
                        {rem.type === 'warning' && <Clock className="w-4 h-4 text-amber-600" />}
                        {rem.type === 'info' && <Info className="w-4 h-4 text-blue-600" />}
                      </div>
                      <div className="text-xs space-y-0.5">
                        <strong className="block text-sm font-bold">{rem.title}</strong>
                        <p className="leading-relaxed opacity-90">{rem.message}</p>
                      </div>
                    </div>

                    <div className="flex items-center gap-2 shrink-0">
                      {rem.actionUrl && (
                        rem.actionUrl.startsWith('http') ? (
                          <a
                            href={rem.actionUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="px-3 py-1 bg-white border border-current rounded-lg text-xs font-bold inline-flex items-center gap-1 shadow-2xs hover:bg-white/80"
                          >
                            <span>{rem.actionLabel || 'Visit Portal'}</span>
                            <ExternalLink className="w-3 h-3" />
                          </a>
                        ) : (
                          <button
                            type="button"
                            onClick={() => {
                              const targetApp = applications.find((a) => a.id === rem.appId);
                              if (targetApp) {
                                setSelectedApp(targetApp);
                                setModalOpen(true);
                              }
                            }}
                            className="px-3 py-1 bg-white border border-current rounded-lg text-xs font-bold inline-flex items-center gap-1 shadow-2xs hover:bg-white/80"
                          >
                            <span>{rem.actionLabel || 'Update Status'}</span>
                            <ChevronRight className="w-3 h-3" />
                          </button>
                        )
                      )}
                      <button
                        type="button"
                        onClick={() => handleDismissReminder(rem.id)}
                        className="p-1 rounded-md hover:bg-black/5 opacity-60 hover:opacity-100 transition-opacity"
                        title="Dismiss reminder"
                      >
                        <X className="w-4 h-4" />
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            )}

            {/* External Workflow Notice */}
            <div className="bg-amber-50 border border-amber-200 rounded-2xl p-4 text-xs text-amber-900 flex items-start justify-between gap-3 shadow-2xs">
              <div className="flex items-start gap-2.5">
                <Info className="w-4 h-4 shrink-0 text-amber-600 mt-0.5" />
                <div className="space-y-0.5">
                  <strong>Official External Application Workflow:</strong>
                  <p className="text-amber-800 leading-relaxed">
                    Scholarship applications are submitted directly on each provider's official portal. Use this tracker to record reference numbers, log interview schedules, monitor deadlines, and update your personal progress milestones.
                  </p>
                </div>
              </div>
            </div>

            {/* Filter and Search Bar */}
            <div className="bg-white rounded-2xl border border-slate-200 p-4 shadow-2xs flex flex-col md:flex-row items-stretch md:items-center justify-between gap-3">
              {/* Search */}
              <div className="relative flex-1">
                <input
                  type="text"
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  placeholder="Search tracked scholarships or reference number..."
                  className="w-full pl-9 pr-4 py-2 text-xs rounded-xl border border-slate-200 focus:outline-none focus:ring-2 focus:ring-royal text-slate-800"
                />
                <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
              </div>

              {/* Status Filter Dropdown */}
              <div className="flex items-center gap-2">
                <select
                  value={statusFilter}
                  onChange={(e) => setStatusFilter(e.target.value)}
                  className="text-xs px-3 py-2 rounded-xl border border-slate-200 bg-white text-slate-700 focus:outline-none focus:ring-2 focus:ring-royal"
                >
                  <option value="all">All Statuses ({applications.length})</option>
                  {APPLICATION_STATUSES.map((st) => (
                    <option key={st.key} value={st.key}>
                      {st.label} ({applications.filter((a) => a.status === st.key).length})
                    </option>
                  ))}
                </select>

                {/* Deadline Filter */}
                <select
                  value={deadlineFilter}
                  onChange={(e) => setDeadlineFilter(e.target.value)}
                  className="text-xs px-3 py-2 rounded-xl border border-slate-200 bg-white text-slate-700 focus:outline-none focus:ring-2 focus:ring-royal"
                >
                  <option value="all">All Deadlines</option>
                  <option value="7days">Ending in ≤ 7 Days</option>
                  <option value="14days">Ending in ≤ 14 Days</option>
                  <option value="30days">Ending in ≤ 30 Days</option>
                  <option value="rolling">Rolling / Open</option>
                  <option value="past">Past Deadlines</option>
                </select>
              </div>
            </div>

            {/* Tracked Applications List */}
            {filteredApplications.length === 0 ? (
              <EmptyState
                title={applications.length === 0 ? "No tracked applications yet" : "No applications match your filter"}
                description={
                  applications.length === 0
                    ? "When you find a scholarship you want to apply for, click 'Track Application' on any card or detail page to monitor your milestones and deadlines."
                    : "Try adjusting your search query, status filter, or deadline criteria to see other tracked opportunities."
                }
                actionLabel={applications.length === 0 ? "Find Scholarships to Track" : "Clear Filters"}
                actionHref={applications.length === 0 ? "/scholarships" : undefined}
                onAction={
                  applications.length > 0
                    ? () => {
                        setStatusFilter('all');
                        setDeadlineFilter('all');
                        setSearchQuery('');
                      }
                    : undefined
                }
              />
            ) : (
              <div className="space-y-4">
                {filteredApplications.map((app) => {
                  const s = app.scholarship || {};
                  const linkSlug = s.slug || s.id || app.scholarship_slug || app.scholarship_id;
                  const providerName = typeof s.provider === 'object' && s.provider ? s.provider.name : (s.provider || 'Scholarship Sponsor');
                  const initial = providerName ? providerName.trim().charAt(0).toUpperCase() : 'S';
                  const statusMeta = getStatusMeta(app.status);
                  const deadlineStr = s.application_deadline || s.deadline;

                  // Deadline urgency
                  let deadlineBadge = null;
                  if (deadlineStr) {
                    const dlDate = new Date(deadlineStr);
                    const now = new Date();
                    const diffDays = Math.ceil((dlDate.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
                    if (diffDays < 0) {
                      deadlineBadge = <span className="text-[10px] font-bold text-slate-500 bg-slate-100 px-2 py-0.5 rounded-full">Passed</span>;
                    } else if (diffDays <= 7) {
                      deadlineBadge = <span className="text-[10px] font-bold text-rose-700 bg-rose-50 px-2 py-0.5 rounded-full">{diffDays === 0 ? 'Due Today' : `${diffDays}d left`}</span>;
                    } else if (diffDays <= 14) {
                      deadlineBadge = <span className="text-[10px] font-bold text-amber-700 bg-amber-50 px-2 py-0.5 rounded-full">{diffDays}d left</span>;
                    }
                  }

                  const latestTimeline = Array.isArray(app.timeline) && app.timeline.length > 0 ? app.timeline[0] : null;

                  return (
                    <div
                      key={app.id}
                      className="bg-white rounded-2xl border border-slate-200 p-5 shadow-card hover:shadow-card-hover transition-all flex flex-col justify-between gap-4"
                    >
                      <div>
                        {/* Header: Provider, Status Badge & Progress */}
                        <div className="flex flex-wrap items-center justify-between gap-2 mb-3">
                          <div className="flex items-center gap-2 min-w-0">
                            {s.logo_url ? (
                              <div className="w-8 h-8 rounded-lg bg-slate-50 border border-slate-200/80 p-0.5 flex items-center justify-center shrink-0 overflow-hidden">
                                <img
                                  src={s.logo_url}
                                  alt={providerName}
                                  className="max-w-full max-h-full object-contain"
                                  onError={(e) => {
                                    e.target.style.display = 'none';
                                  }}
                                />
                              </div>
                            ) : (
                              <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-[#050D2B] to-[#173A8A] text-[#FFC928] flex items-center justify-center font-heading font-extrabold text-xs shrink-0">
                                {initial}
                              </div>
                            )}
                            <div className="min-w-0">
                              <span className="text-xs font-bold text-royal uppercase tracking-wider block truncate">
                                {providerName}
                              </span>
                              <span className="text-[11px] text-slate-400">
                                Last updated: {new Date(app.updated_at || app.created_at).toLocaleDateString()}
                              </span>
                            </div>
                          </div>

                          <div className="flex items-center gap-2 shrink-0">
                            <span className={`text-xs font-bold uppercase tracking-wider px-3 py-1 rounded-full border ${statusMeta.badgeClass}`}>
                              {statusMeta.label}
                            </span>
                            <span className="text-xs font-bold text-slate-500 bg-slate-100 px-2 py-1 rounded-lg">
                              {statusMeta.progress}%
                            </span>
                          </div>
                        </div>

                        {/* Visual Progress Bar */}
                        <div className="w-full bg-slate-100 h-1.5 rounded-full overflow-hidden mb-3">
                          <div
                            className={`h-full transition-all duration-500 rounded-full ${
                              statusMeta.key === 'awarded'
                                ? 'bg-emerald-500'
                                : statusMeta.key === 'unsuccessful' || statusMeta.key === 'withdrawn'
                                ? 'bg-slate-400'
                                : statusMeta.key === 'interview'
                                ? 'bg-sky-500'
                                : statusMeta.key === 'submitted' || statusMeta.key === 'under_review' || statusMeta.key === 'shortlisted'
                                ? 'bg-royal'
                                : 'bg-amber-400'
                            }`}
                            style={{ width: `${Math.max(statusMeta.progress, 5)}%` }}
                          />
                        </div>

                        {/* Title */}
                        <h3 className="font-heading font-bold text-navy-deep text-base sm:text-lg hover:text-royal transition-colors mb-2">
                          <Link to={`/scholarship/${linkSlug}`}>{s.title || s.name}</Link>
                        </h3>

                        {/* Key Application Meta Grid */}
                        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-2.5 text-xs text-slate-600 bg-slate-50 p-3 rounded-xl border border-slate-100 mb-3">
                          <div className="flex items-center gap-1.5 min-w-0">
                            <Clock className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                            <div className="min-w-0 flex items-center gap-1.5">
                              <span className="truncate">Deadline: {deadlineStr ? formatDate(deadlineStr) : 'Rolling / Open'}</span>
                              {deadlineBadge}
                            </div>
                          </div>

                          <div className="flex items-center gap-1.5 min-w-0">
                            <Hash className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                            <span className="truncate">
                              Ref: <strong>{app.reference_number || 'Not added'}</strong>
                            </span>
                          </div>

                          <div className="flex items-center gap-1.5 min-w-0">
                            <Calendar className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                            <span className="truncate">
                              Submitted: {app.submission_date ? formatDate(app.submission_date) : 'Pending'}
                            </span>
                          </div>

                          <div className="flex items-center gap-1.5 min-w-0">
                            <Send className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                            <span className={`truncate ${app.interview_date ? 'text-sky-700 font-bold' : ''}`}>
                              Interview: {app.interview_date ? new Date(app.interview_date).toLocaleDateString([], { month: 'short', day: 'numeric' }) : 'None'}
                            </span>
                          </div>
                        </div>

                        {/* Latest Milestone / Note Snippet */}
                        {latestTimeline && latestTimeline.note && (
                          <div className="text-[11px] text-slate-600 bg-blue-50/50 p-2.5 rounded-lg border border-blue-100/80 mb-3 flex items-start gap-2">
                            <CheckCircle2 className="w-3.5 h-3.5 text-royal shrink-0 mt-0.5" />
                            <div className="min-w-0">
                              <span className="font-semibold text-royal">Latest Update: </span>
                              <span>{latestTimeline.note}</span>
                            </div>
                          </div>
                        )}
                      </div>

                      {/* Card Footer Action Toolbar */}
                      <div className="flex flex-wrap items-center justify-between gap-3 pt-3 border-t border-slate-100">
                        <div className="flex flex-wrap items-center gap-2">
                          <button
                            type="button"
                            onClick={() => {
                              setSelectedApp(app);
                              setModalOpen(true);
                            }}
                            className="px-3.5 py-2 bg-royal text-white text-xs font-bold rounded-xl hover:bg-navy-dark transition-colors shadow-2xs inline-flex items-center gap-1.5"
                          >
                            <span>Update Status & Details</span>
                            <ChevronRight className="w-3.5 h-3.5" />
                          </button>

                          {/* Quick Mark as Submitted button if in prep */}
                          {['preparing', 'started', 'saved'].includes(app.status) && (
                            <button
                              type="button"
                              onClick={() => handleQuickMarkSubmitted(app)}
                              className="px-3 py-2 bg-indigo-50 border border-indigo-200 text-indigo-700 hover:bg-indigo-100 text-xs font-bold rounded-xl transition-colors inline-flex items-center gap-1"
                              title="One-click mark as submitted on external portal"
                            >
                              <CheckCircle2 className="w-3.5 h-3.5" />
                              <span>Mark as Submitted</span>
                            </button>
                          )}

                          {s.official_url && (
                            <a
                              href={s.official_url}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="px-3 py-2 bg-slate-50 border border-slate-200 text-slate-700 hover:bg-slate-100 text-xs font-semibold rounded-xl transition-colors inline-flex items-center gap-1"
                            >
                              <span>Provider Portal</span>
                              <ExternalLink className="w-3 h-3 text-slate-400" />
                            </a>
                          )}
                        </div>

                        <div className="flex items-center gap-2">
                          <Link
                            to={`/scholarship/${linkSlug}`}
                            className="text-xs font-semibold text-royal hover:underline"
                          >
                            View Details
                          </Link>
                          <button
                            type="button"
                            onClick={() => handleRemoveTracked(app.id)}
                            className="p-1.5 rounded-lg text-slate-400 hover:text-red-600 hover:bg-red-50 transition-colors"
                            title="Remove from tracker"
                          >
                            <Trash2 className="w-4 h-4" />
                          </button>
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}

            {/* Modal */}
            <ApplicationStatusModal
              isOpen={modalOpen}
              onClose={() => setModalOpen(false)}
              application={selectedApp}
              onSave={handleSaveModal}
            />
          </div>
        )}

        {/* TAB 3: ACADEMIC PROFILE */}
        {activeTab === 'profile' && (
          <div className="max-w-2xl space-y-6">
            {/* 1. Optional Profile Picture Card */}
            <div className="bg-white rounded-2xl border border-slate-200 p-6 sm:p-8 shadow-card">
              <div className="flex items-start justify-between gap-4 mb-4">
                <div>
                  <h3 className="font-heading font-bold text-lg text-navy-deep">
                    Profile Picture
                  </h3>
                  <p className="text-xs text-slate-500 mt-0.5">
                    Upload an optional profile photo to personalize your Student Portal experience.
                  </p>
                </div>
                <span className="text-[11px] font-semibold text-slate-500 bg-slate-100 px-2.5 py-1 rounded-full uppercase tracking-wider">
                  Optional
                </span>
              </div>

              {/* Status Messages */}
              {avatarSuccess && (
                <div className="mb-4 p-3 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-700 text-xs flex items-center gap-2">
                  <CheckCircle2 className="w-4 h-4 shrink-0 text-emerald-600" />
                  <span>{avatarSuccess}</span>
                </div>
              )}

              {avatarError && (
                <div className="mb-4 p-3 rounded-xl bg-rose-50 border border-rose-200 text-rose-700 text-xs flex items-center gap-2">
                  <AlertCircle className="w-4 h-4 shrink-0 text-rose-600" />
                  <span>{avatarError}</span>
                </div>
              )}

              <div className="flex flex-col sm:flex-row items-center gap-5 pt-2">
                {/* Avatar Preview */}
                <div className="relative shrink-0">
                  {profile?.avatar_url ? (
                    <img
                      src={profile.avatar_url}
                      alt={profile.full_name || 'Profile'}
                      className="w-24 h-24 rounded-2xl object-cover border-2 border-slate-200 shadow-sm"
                    />
                  ) : (
                    <div className="w-24 h-24 rounded-2xl bg-[#050D2B] border-2 border-slate-200 text-[#FFC928] flex items-center justify-center font-heading font-extrabold text-3xl shadow-sm">
                      {(profile?.full_name || user?.email || 'S').trim().charAt(0).toUpperCase()}
                    </div>
                  )}

                  {avatarUploading && (
                    <div className="absolute inset-0 bg-black/50 rounded-2xl flex items-center justify-center text-white backdrop-blur-2xs">
                      <Loader2 className="w-6 h-6 animate-spin text-[#FFC928]" />
                    </div>
                  )}
                </div>

                {/* Controls & Guidance */}
                <div className="flex-1 text-center sm:text-left space-y-2.5">
                  <input
                    type="file"
                    ref={avatarInputRef}
                    onChange={handleAvatarFileChange}
                    accept="image/png, image/jpeg, image/jpg, image/webp"
                    className="hidden"
                  />

                  <div className="flex flex-wrap items-center justify-center sm:justify-start gap-2.5">
                    <button
                      type="button"
                      onClick={() => avatarInputRef.current?.click()}
                      disabled={avatarUploading}
                      className="px-4 py-2 bg-royal text-white text-xs font-bold rounded-xl hover:bg-navy-dark transition-colors shadow-2xs inline-flex items-center gap-2"
                    >
                      <Upload className="w-3.5 h-3.5" />
                      <span>{profile?.avatar_url ? 'Change Photo' : 'Upload Photo'}</span>
                    </button>

                    {profile?.avatar_url && (
                      <button
                        type="button"
                        onClick={handleRemoveAvatar}
                        disabled={avatarUploading}
                        className="px-3.5 py-2 bg-slate-100 hover:bg-red-50 text-slate-600 hover:text-red-600 text-xs font-semibold rounded-xl transition-colors border border-slate-200 hover:border-red-200 inline-flex items-center gap-1.5"
                      >
                        <Trash2 className="w-3.5 h-3.5" />
                        <span>Remove</span>
                      </button>
                    )}
                  </div>

                  <p className="text-[11px] text-slate-400">
                    Supports PNG, JPG, JPEG, or WebP. Maximum file size is 5 MB.
                  </p>
                </div>
              </div>
            </div>

            {/* 2. Academic & Eligibility Profile Card */}
            <div className="bg-white rounded-2xl border border-slate-200 p-6 sm:p-8 shadow-card">
              <h3 className="font-heading font-bold text-lg text-navy-deep mb-2">
                Academic & Eligibility Profile
              </h3>
              <p className="text-xs text-slate-500 mb-6">
                Complete your profile so we can highlight scholarships tailored to your program, GPA, and
                level of study.
              </p>

              {profileSavedMsg && (
                <div className="mb-4 p-3 rounded-xl bg-emerald-50 border border-emerald-200 text-emerald-700 text-xs flex items-center gap-2">
                  <CheckCircle2 className="w-4 h-4" />
                  Profile updated successfully!
                </div>
              )}

              <form onSubmit={updateProfile} className="space-y-4">
                <div>
                  <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                    Current / Target Institution
                  </label>
                  <div className="relative">
                    <input
                      type="text"
                      value={profileData.institution}
                      onChange={(e) => setProfileData({ ...profileData, institution: e.target.value })}
                      placeholder="e.g. University of Ghana, KNUST, UCC"
                      className="w-full pl-9 pr-3.5 py-2 bg-slate-50 border border-slate-300 rounded-xl text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
                    />
                    <School className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
                  </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                      Field of Study
                    </label>
                    <input
                      type="text"
                      value={profileData.field_of_study}
                      onChange={(e) => setProfileData({ ...profileData, field_of_study: e.target.value })}
                      placeholder="e.g. Computer Science, Medicine"
                      className="w-full px-3.5 py-2 bg-slate-50 border border-slate-300 rounded-xl text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
                    />
                  </div>

                  <div>
                    <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                      Study Level
                    </label>
                    <select
                      value={profileData.study_level}
                      onChange={(e) => setProfileData({ ...profileData, study_level: e.target.value })}
                      className="w-full px-3.5 py-2 bg-slate-50 border border-slate-300 rounded-xl text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
                    >
                      <option value="shs">SHS</option>
                      <option value="undergraduate">Undergraduate</option>
                      <option value="postgraduate">Postgraduate</option>
                      <option value="masters">Master's</option>
                      <option value="phd">PhD</option>
                      <option value="other">Other</option>
                    </select>
                  </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                      Cumulative GPA (or WASSCE aggregate)
                    </label>
                    <input
                      type="text"
                      value={profileData.gpa}
                      onChange={(e) => setProfileData({ ...profileData, gpa: e.target.value })}
                      placeholder="e.g. 3.7 / 4.0 or 8 (WASSCE)"
                      className="w-full px-3.5 py-2 bg-slate-50 border border-slate-300 rounded-xl text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
                    />
                  </div>

                  <div>
                    <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                      Expected Graduation
                    </label>
                    <input
                      type="text"
                      value={profileData.graduation_year}
                      onChange={(e) => setProfileData({ ...profileData, graduation_year: e.target.value })}
                      placeholder="2026"
                      className="w-full px-3.5 py-2 bg-slate-50 border border-slate-300 rounded-xl text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
                    />
                  </div>
                </div>

                <div className="pt-2">
                  <Button type="submit" variant="gold" className="shadow-gold" disabled={savingProfile}>
                    {savingProfile ? 'Saving...' : 'Save Profile'}
                  </Button>
                </div>
              </form>
            </div>

            {/* 3. Account Settings & Danger Zone Card */}
            <div className="bg-white rounded-2xl border border-rose-200 p-6 sm:p-8 shadow-card">
              <div className="flex items-start gap-3.5">
                <div className="w-10 h-10 rounded-2xl bg-rose-50 text-rose-600 flex items-center justify-center shrink-0 border border-rose-100">
                  <AlertTriangle className="w-5 h-5" />
                </div>
                <div className="flex-1">
                  <h3 className="font-heading font-bold text-lg text-slate-900 leading-tight">
                    Account Settings & Danger Zone
                  </h3>
                  <p className="text-xs text-slate-600 mt-1 leading-relaxed">
                    Permanently delete your student account, saved scholarships, tracked applications, and personal profile data. This action is irreversible.
                  </p>

                  <div className="mt-5 pt-4 border-t border-rose-100 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
                    <div>
                      <p className="text-xs font-semibold text-slate-800">
                        Delete Student Account
                      </p>
                      <p className="text-[11px] text-slate-400">
                        Once deleted, your account cannot be recovered.
                      </p>
                    </div>

                    <button
                      type="button"
                      onClick={() => setDeleteModalOpen(true)}
                      className="px-4 py-2.5 bg-rose-600 hover:bg-rose-700 text-white font-bold text-xs rounded-xl transition-all shadow-sm shadow-rose-600/20 inline-flex items-center justify-center gap-1.5 shrink-0"
                    >
                      <Trash2 className="w-3.5 h-3.5" />
                      <span>Delete Account</span>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Delete Account Confirmation Modal */}
        <DeleteAccountModal
          isOpen={deleteModalOpen}
          onClose={() => setDeleteModalOpen(false)}
          onConfirm={handleConfirmDeleteAccount}
          isDeleting={isDeletingAccount}
          userEmail={user?.email || ''}
        />
      </div>
    </div>
  );
}
