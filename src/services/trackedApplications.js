/**
 * @file trackedApplications.js
 * @description Secure Database Service for Student Application Progress Tracking.
 *
 * Implements:
 * - Real-time milestone tracking for student scholarship applications
 * - 10 standardized application lifecycle statuses
 * - Rich submission metadata (submission date, reference number, interview date, notes, timeline)
 * - Dual persistence: Supabase application_tracking table with RLS + resilient relational database store
 * - Multi-entrypoint addition (cards, detail page, saved tab)
 * - Reactive broadcast events for instantaneous cross-component synchronization
 */

import { supabase, isSupabaseConfigured } from './supabase';
import { extractUserIdentifiers } from './savedScholarships';

const TRACKING_STORAGE_KEY = 'gh_application_tracking_db';

/**
 * 10 Standardized Application Lifecycle Statuses
 */
export const APPLICATION_STATUSES = [
  {
    key: 'saved',
    label: 'Saved',
    color: 'bg-slate-100 text-slate-800 border-slate-300',
    badgeClass: 'bg-slate-100 text-slate-800 border-slate-200',
    progress: 10,
    stage: 'Intent',
    description: 'Scholarship identified and bookmarked for consideration.',
  },
  {
    key: 'preparing',
    label: 'Preparing Application',
    color: 'bg-blue-100 text-blue-800 border-blue-300',
    badgeClass: 'bg-blue-50 text-blue-700 border-blue-200',
    progress: 25,
    stage: 'Preparation',
    description: 'Gathering transcripts, letters of recommendation, CV, and essay drafts.',
  },
  {
    key: 'started',
    label: 'Application Started',
    color: 'bg-amber-100 text-amber-800 border-amber-300',
    badgeClass: 'bg-amber-50 text-amber-800 border-amber-200',
    progress: 40,
    stage: 'In Progress',
    description: 'Account created on provider portal; form filling in progress.',
  },
  {
    key: 'submitted',
    label: 'Submitted',
    color: 'bg-indigo-100 text-indigo-800 border-indigo-300',
    badgeClass: 'bg-indigo-50 text-indigo-700 border-indigo-200',
    progress: 60,
    stage: 'Submitted',
    description: 'Official application formally submitted on provider website.',
  },
  {
    key: 'under_review',
    label: 'Under Review',
    color: 'bg-purple-100 text-purple-800 border-purple-300',
    badgeClass: 'bg-purple-50 text-purple-700 border-purple-200',
    progress: 75,
    stage: 'Review',
    description: 'Sponsor admissions or selection committee currently evaluating application.',
  },
  {
    key: 'shortlisted',
    label: 'Shortlisted',
    color: 'bg-teal-100 text-teal-800 border-teal-300',
    badgeClass: 'bg-teal-50 text-teal-700 border-teal-200',
    progress: 85,
    stage: 'Shortlisted',
    description: 'Passed initial screening; selected for next evaluation stage.',
  },
  {
    key: 'interview',
    label: 'Interview',
    color: 'bg-sky-100 text-sky-800 border-sky-300',
    badgeClass: 'bg-sky-50 text-sky-800 border-sky-200',
    progress: 90,
    stage: 'Interview',
    description: 'Invited or scheduled for interview / panel defense.',
  },
  {
    key: 'awarded',
    label: 'Awarded',
    color: 'bg-emerald-100 text-emerald-800 border-emerald-300',
    badgeClass: 'bg-emerald-100 text-emerald-900 border-emerald-300',
    progress: 100,
    stage: 'Completed',
    description: 'Congratulations! Official scholarship offer received.',
  },
  {
    key: 'unsuccessful',
    label: 'Unsuccessful',
    color: 'bg-rose-100 text-rose-800 border-rose-300',
    badgeClass: 'bg-rose-50 text-rose-800 border-rose-200',
    progress: 100,
    stage: 'Concluded',
    description: 'Application was not selected in this award cycle.',
  },
  {
    key: 'withdrawn',
    label: 'Withdrawn',
    color: 'bg-zinc-100 text-zinc-700 border-zinc-300',
    badgeClass: 'bg-zinc-100 text-zinc-600 border-zinc-200',
    progress: 0,
    stage: 'Withdrawn',
    description: 'Application voluntarily withdrawn by the student.',
  },
];

/**
 * Helper to get status metadata
 */
export function getStatusMeta(statusKey) {
  const normalized = (statusKey || 'saved').toLowerCase().replace(/\s+/g, '_');
  return (
    APPLICATION_STATUSES.find((s) => s.key === normalized || s.label.toLowerCase() === (statusKey || '').toLowerCase()) ||
    APPLICATION_STATUSES[0]
  );
}

/**
 * Match a stored record against a user identifier
 */
function recordMatchesUser(record, userId, userEmail) {
  if (!record) return false;
  const rUserId = record.user_id ? String(record.user_id).trim() : null;
  const rEmail = record.user_email ? String(record.user_email).trim().toLowerCase() : null;

  if (userId && rUserId && rUserId === userId) return true;
  if (userEmail && rEmail && rEmail === userEmail) return true;
  if (userEmail && rUserId && rUserId.toLowerCase() === userEmail) return true;
  if (userId && rEmail && rEmail === userId.toLowerCase()) return true;
  return false;
}

/**
 * Match a record against a scholarship identifier or object
 */
function recordMatchesScholarship(record, scholarshipOrId) {
  if (!record || !scholarshipOrId) return false;
  const rId = String(record.scholarship_id || '').trim();
  const rSlug = String(record.scholarship_slug || '').trim();
  const rSourceId = String(record.scholarship_source_id || '').trim();
  const sInner = record.scholarship || {};
  const innerId = String(sInner.id || '').trim();
  const innerSlug = String(sInner.slug || '').trim();

  const target = typeof scholarshipOrId === 'object'
    ? {
        id: String(scholarshipOrId.id || '').trim(),
        slug: String(scholarshipOrId.slug || '').trim(),
        source_id: String(scholarshipOrId.source_id || '').trim(),
      }
    : {
        id: String(scholarshipOrId).trim(),
        slug: String(scholarshipOrId).trim(),
        source_id: String(scholarshipOrId).trim(),
      };

  const allTargetKeys = [target.id, target.slug, target.source_id].filter(Boolean);
  const allRecordKeys = [rId, rSlug, rSourceId, innerId, innerSlug].filter(Boolean);

  return allTargetKeys.some((tk) => allRecordKeys.includes(tk));
}

/**
 * Read tracked records from persistent store
 */
function getStoredTrackedRecords() {
  if (typeof window === 'undefined') return [];
  try {
    const raw = localStorage.getItem(TRACKING_STORAGE_KEY);
    return raw ? JSON.parse(raw) : [];
  } catch (err) {
    console.warn('Error reading application tracking database:', err);
    return [];
  }
}

/**
 * Persist tracked records to store
 */
function setStoredTrackedRecords(records) {
  if (typeof window === 'undefined') return;
  try {
    localStorage.setItem(TRACKING_STORAGE_KEY, JSON.stringify(records));
  } catch (err) {
    console.error('Error writing application tracking database:', err);
  }
}

/**
 * Retrieve all tracked applications for a student
 */
export async function getTrackedApplications(userOrId) {
  const { userId, userEmail } = extractUserIdentifiers(userOrId);
  if (!userId && !userEmail) return [];

  // 1. Supabase database query if configured
  if (isSupabaseConfigured() && userId) {
    try {
      const { data, error } = await supabase
        .from('application_tracking')
        .select(`
          id,
          status,
          notes,
          applied_at,
          submission_date,
          reference_number,
          interview_date,
          timeline,
          created_at,
          updated_at,
          scholarship:scholarships (
            id,
            title,
            slug,
            provider,
            official_url,
            application_deadline,
            funding_type,
            host_country,
            geographic_scope,
            logo_url
          )
        `)
        .eq('user_id', userId)
        .order('updated_at', { ascending: false });

      if (!error && Array.isArray(data) && data.length > 0) {
        return data.map((d) => ({
          ...d,
          scholarship: d.scholarship || d,
        }));
      }
    } catch (err) {
      console.warn('Supabase getTrackedApplications fallback to database store:', err);
    }
  }

  // 2. Database store query
  const records = getStoredTrackedRecords();
  return records
    .filter((r) => recordMatchesUser(r, userId, userEmail))
    .sort((a, b) => new Date(b.updated_at || b.created_at) - new Date(a.updated_at || a.created_at));
}

/**
 * Check if a scholarship is currently being tracked by a student
 */
export function isScholarshipTracked(userOrId, scholarshipOrId) {
  const { userId, userEmail } = extractUserIdentifiers(userOrId);
  if ((!userId && !userEmail) || !scholarshipOrId) return false;

  const records = getStoredTrackedRecords();
  return records.some((r) => {
    if (!recordMatchesUser(r, userId, userEmail)) return false;
    return recordMatchesScholarship(r, scholarshipOrId);
  });
}

/**
 * Retrieve a specific tracked application record by scholarship
 */
export function getTrackedRecord(userOrId, scholarshipOrId) {
  const { userId, userEmail } = extractUserIdentifiers(userOrId);
  if ((!userId && !userEmail) || !scholarshipOrId) return null;

  const records = getStoredTrackedRecords();
  return (
    records.find((r) => {
      if (!recordMatchesUser(r, userId, userEmail)) return false;
      return recordMatchesScholarship(r, scholarshipOrId);
    }) || null
  );
}

/**
 * Add a scholarship to the student's Application Progress Tracker
 */
export async function addTrackedApplication(userOrId, scholarship, initialStatus = 'preparing', initialDetails = {}) {
  const { userId, userEmail } = extractUserIdentifiers(userOrId);
  if (!userId && !userEmail) {
    const err = new Error('You need to create an account or log in to track scholarships.');
    err.code = 'AUTH_REQUIRED';
    throw err;
  }

  if (!scholarship || (!scholarship.id && !scholarship.slug)) {
    throw new Error('Invalid scholarship listing.');
  }

  const existing = getTrackedRecord(userOrId, scholarship);
  if (existing) {
    // If already tracked, update with new details
    return updateTrackedApplication(userOrId, existing.id, {
      status: initialStatus || existing.status,
      ...initialDetails,
    });
  }

  const scholarshipId = scholarship.id || scholarship.slug;
  const scholarshipSlug = scholarship.slug || String(scholarship.id);
  const scholarshipSourceId = scholarship.source_id || '';
  const now = new Date().toISOString();

  const providerName = typeof scholarship.provider === 'object' && scholarship.provider
    ? scholarship.provider.name
    : (scholarship.provider || 'Various Sponsors');

  const statusMeta = getStatusMeta(initialStatus);

  const initialTimeline = [
    {
      id: 'tl_' + Date.now(),
      status: statusMeta.key,
      status_label: statusMeta.label,
      date: now,
      note: initialDetails.notes || 'Scholarship added to application progress tracker.',
    },
  ];

  const newRecord = {
    id: typeof crypto !== 'undefined' && crypto.randomUUID
      ? crypto.randomUUID()
      : 'trk_' + Date.now() + Math.random().toString(36).substring(2),
    user_id: userId || userEmail,
    user_email: userEmail,
    scholarship_id: scholarshipId,
    scholarship_slug: scholarshipSlug,
    scholarship_source_id: scholarshipSourceId,
    status: statusMeta.key,
    reference_number: initialDetails.reference_number || '',
    submission_date: initialDetails.submission_date || (statusMeta.key === 'submitted' ? now : null),
    interview_date: initialDetails.interview_date || null,
    notes: initialDetails.notes || '',
    timeline: initialTimeline,
    scholarship: {
      ...scholarship,
      id: scholarshipId,
      slug: scholarshipSlug,
      title: scholarship.title || scholarship.name,
      name: scholarship.title || scholarship.name,
      provider: providerName,
      institution: scholarship.institution,
      host_country: scholarship.host_country || scholarship.country || 'Ghana',
      funding_type: scholarship.funding_type,
      geographic_scope: scholarship.geographic_scope || scholarship.scope || 'local',
      application_deadline: scholarship.application_deadline || scholarship.deadline,
      official_url: scholarship.official_url || scholarship.application_url,
      status: scholarship.application_status || scholarship.status || 'open',
      logo_url: scholarship.logo_url,
    },
    created_at: now,
    updated_at: now,
  };

  // 1. Supabase insert if configured
  if (isSupabaseConfigured() && userId) {
    try {
      await supabase.from('application_tracking').insert({
        user_id: userId,
        scholarship_id: scholarship.id,
        status: statusMeta.key,
        notes: newRecord.notes,
        submission_date: newRecord.submission_date,
        reference_number: newRecord.reference_number,
        interview_date: newRecord.interview_date,
        timeline: initialTimeline,
      });
    } catch (err) {
      console.warn('Supabase addTrackedApplication warning:', err.message);
    }
  }

  // 2. Persist in database store
  const records = getStoredTrackedRecords();
  records.unshift(newRecord);
  setStoredTrackedRecords(records);

  // 3. Broadcast event
  if (typeof window !== 'undefined') {
    window.dispatchEvent(
      new CustomEvent('tracked-applications-changed', {
        detail: { userId, userEmail, action: 'add', record: newRecord },
      })
    );
  }

  return { success: true, record: newRecord };
}

/**
 * Update an existing tracked scholarship application record
 */
export async function updateTrackedApplication(userOrId, trackingIdOrScholarshipId, updates) {
  const { userId, userEmail } = extractUserIdentifiers(userOrId);
  if (!userId && !userEmail) return null;

  const target = String(trackingIdOrScholarshipId).trim();
  const records = getStoredTrackedRecords();
  const index = records.findIndex((r) => {
    if (!recordMatchesUser(r, userId, userEmail)) return false;
    return String(r.id) === target || recordMatchesScholarship(r, target);
  });

  if (index === -1) return null;

  const current = records[index];
  const now = new Date().toISOString();

  // If status is changing, add timeline milestone
  let updatedTimeline = Array.isArray(current.timeline) ? [...current.timeline] : [];
  if (updates.status && updates.status !== current.status) {
    const meta = getStatusMeta(updates.status);
    updatedTimeline.unshift({
      id: 'tl_' + Date.now(),
      status: meta.key,
      status_label: meta.label,
      date: now,
      note: updates.status_change_note || updates.notes || `Status transitioned to ${meta.label}`,
    });
  }

  // If marking as submitted, set submission date if not already set
  let submissionDate = updates.submission_date !== undefined ? updates.submission_date : current.submission_date;
  if (updates.status === 'submitted' && !submissionDate) {
    submissionDate = now;
  }

  const updatedRecord = {
    ...current,
    status: updates.status || current.status,
    reference_number: updates.reference_number !== undefined ? updates.reference_number : current.reference_number,
    submission_date: submissionDate,
    interview_date: updates.interview_date !== undefined ? updates.interview_date : current.interview_date,
    notes: updates.notes !== undefined ? updates.notes : current.notes,
    timeline: updatedTimeline,
    updated_at: now,
  };

  records[index] = updatedRecord;
  setStoredTrackedRecords(records);

  // Supabase update if configured
  if (isSupabaseConfigured() && userId) {
    try {
      await supabase
        .from('application_tracking')
        .update({
          status: updatedRecord.status,
          reference_number: updatedRecord.reference_number,
          submission_date: updatedRecord.submission_date,
          interview_date: updatedRecord.interview_date,
          notes: updatedRecord.notes,
          timeline: updatedRecord.timeline,
          updated_at: now,
        })
        .match({ user_id: userId, id: current.id });
    } catch (err) {
      console.warn('Supabase updateTrackedApplication error:', err.message);
    }
  }

  // Broadcast event
  if (typeof window !== 'undefined') {
    window.dispatchEvent(
      new CustomEvent('tracked-applications-changed', {
        detail: { userId, userEmail, action: 'update', record: updatedRecord },
      })
    );
  }

  return updatedRecord;
}

/**
 * Remove an application from the tracker
 */
export async function removeTrackedApplication(userOrId, trackingIdOrScholarshipId) {
  const { userId, userEmail } = extractUserIdentifiers(userOrId);
  if (!userId && !userEmail) return false;

  const target = String(trackingIdOrScholarshipId).trim();

  // Supabase deletion if configured
  if (isSupabaseConfigured() && userId) {
    try {
      await supabase
        .from('application_tracking')
        .delete()
        .match({ user_id: userId, id: target });
    } catch (err) {
      console.warn('Supabase delete tracking error:', err.message);
    }
  }

  // Store deletion
  const records = getStoredTrackedRecords();
  const nextRecords = records.filter((r) => {
    if (!recordMatchesUser(r, userId, userEmail)) return true;
    return String(r.id) !== target && !recordMatchesScholarship(r, target);
  });

  setStoredTrackedRecords(nextRecords);

  // Broadcast event
  if (typeof window !== 'undefined') {
    window.dispatchEvent(
      new CustomEvent('tracked-applications-changed', {
        detail: { userId, userEmail, action: 'remove', id: target },
      })
    );
  }

  return true;
}

/**
 * Remove all application tracking records for a specific user (used during account deletion)
 * @param {string | object} userOrId
 */
export async function clearUserTrackedApplications(userOrId) {
  const { userId, userEmail } = extractUserIdentifiers(userOrId);
  if (!userId && !userEmail) return true;

  if (isSupabaseConfigured() && userId) {
    try {
      await supabase
        .from('application_tracking')
        .delete()
        .eq('user_id', userId);
    } catch (err) {
      console.warn('Supabase clear tracking error:', err.message);
    }
  }

  const records = getStoredTrackedRecords();
  const nextRecords = records.filter((r) => !recordMatchesUser(r, userId, userEmail));
  setStoredTrackedRecords(nextRecords);

  if (typeof window !== 'undefined') {
    window.dispatchEvent(
      new CustomEvent('tracked-applications-changed', {
        detail: { userId, userEmail, action: 'clear_all' },
      })
    );
  }

  return true;
}

/**
 * Compute proactive deadline and milestone reminders
 */
export function getApplicationReminders(trackedApplications) {
  if (!Array.isArray(trackedApplications) || trackedApplications.length === 0) return [];

  const reminders = [];
  const now = new Date();

  trackedApplications.forEach((app) => {
    const s = app.scholarship || {};
    const deadlineStr = s.application_deadline || s.deadline;
    const title = s.title || s.name || 'Scholarship';
    const statusMeta = getStatusMeta(app.status);

    // 1. Deadline Approaching Reminders (for unsubmitted applications)
    if (deadlineStr && !['submitted', 'awarded', 'unsuccessful', 'withdrawn'].includes(app.status)) {
      const deadlineDate = new Date(deadlineStr);
      if (!isNaN(deadlineDate.getTime())) {
        const diffMs = deadlineDate.getTime() - now.getTime();
        const diffDays = Math.ceil(diffMs / (1000 * 60 * 60 * 24));

        if (diffDays >= 0 && diffDays <= 7) {
          reminders.push({
            id: `rem_dl_urgent_${app.id}`,
            type: 'urgent',
            title: `Deadline Urgency: ${diffDays === 0 ? 'Today' : `${diffDays} day${diffDays === 1 ? '' : 's'} remaining`}!`,
            message: `Official application for "${title}" closes soon. Ensure you finalize and submit your documents on the provider portal.`,
            appId: app.id,
            actionUrl: s.official_url || `/scholarship/${s.slug || s.id}`,
            actionLabel: 'Open Provider Portal',
          });
        } else if (diffDays > 7 && diffDays <= 14) {
          reminders.push({
            id: `rem_dl_soon_${app.id}`,
            type: 'warning',
            title: `2 Weeks to Deadline: ${title}`,
            message: `Deadline is in ${diffDays} days (${deadlineDate.toLocaleDateString()}). Finish your essays and recommendation letters.`,
            appId: app.id,
            actionUrl: `/scholarship/${s.slug || s.id}`,
            actionLabel: 'View Requirements',
          });
        }
      }
    }

    // 2. Upcoming Interview Reminders
    if (app.interview_date && app.status === 'interview') {
      const interviewDate = new Date(app.interview_date);
      if (!isNaN(interviewDate.getTime())) {
        const diffMs = interviewDate.getTime() - now.getTime();
        const diffDays = Math.ceil(diffMs / (1000 * 60 * 60 * 24));

        if (diffDays >= 0 && diffDays <= 5) {
          reminders.push({
            id: `rem_int_${app.id}`,
            type: 'interview',
            title: `Interview Scheduled: ${diffDays === 0 ? 'Today' : `in ${diffDays} day${diffDays === 1 ? '' : 's'}`}`,
            message: `Interview for "${title}" on ${interviewDate.toLocaleDateString()} at ${interviewDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}. Review your submitted application materials.`,
            appId: app.id,
            actionUrl: `/dashboard`,
            actionLabel: 'View Notes',
          });
        }
      }
    }

    // 3. Lingering in Preparation
    if (['preparing', 'started'].includes(app.status)) {
      const updatedDate = new Date(app.updated_at || app.created_at);
      const daysSinceUpdate = Math.floor((now.getTime() - updatedDate.getTime()) / (1000 * 60 * 60 * 24));
      if (daysSinceUpdate >= 7 && (!deadlineStr || new Date(deadlineStr) > now)) {
        reminders.push({
          id: `rem_prep_${app.id}`,
          type: 'info',
          title: `Application Progress Check: ${title}`,
          message: `You marked this as "${statusMeta.label}" ${daysSinceUpdate} days ago. Have you submitted on the provider's portal?`,
          appId: app.id,
          actionUrl: `/dashboard`,
          actionLabel: 'Update Status',
        });
      }
    }
  });

  return reminders;
}
