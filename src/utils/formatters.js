import { clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';
import { format, parseISO } from 'date-fns';

export function cn(...inputs) {
  return twMerge(clsx(inputs));
}

export function formatDate(dateString) {
  if (!dateString) return 'Not announced';
  try {
    return format(parseISO(dateString), 'MMMM d, yyyy');
  } catch {
    return dateString;
  }
}

export function statusLabel(status) {
  const labels = {
    open: 'Open',
    closed: 'Closed',
    upcoming: 'Opening Soon',
    rolling: 'Rolling Applications',
    unannounced: 'Deadline Not Announced',
    archived: 'Archived',
  };
  return labels[status] || status || 'Unannounced';
}

export function statusClass(status) {
  const classes = {
    open: 'bg-emerald-100 text-emerald-800',
    closed: 'bg-rose-100 text-rose-800',
    upcoming: 'bg-indigo-100 text-indigo-800',
    rolling: 'bg-amber-100 text-amber-800',
    unannounced: 'bg-slate-100 text-slate-700',
    archived: 'bg-slate-100 text-slate-500',
  };
  return classes[status] || 'bg-slate-100 text-slate-700';
}

export function fundingTypeLabel(type) {
  const labels = {
    fully_funded: 'Fully Funded',
    partially_funded: 'Partially Funded',
    tuition_only: 'Tuition Only',
    bursary: 'Bursary',
    grant: 'Grant',
    fellowship: 'Fellowship',
    research: 'Research Funding',
    loan: 'Student Loan',
    other: 'Other Support',
  };
  return labels[type] || type || 'Other';
}

export function studyLevelLabel(level) {
  const labels = {
    shs: 'Senior High School (SHS)',
    diploma: 'Diploma',
    vocational: 'Vocational & Technical',
    undergraduate: 'Undergraduate',
    postgraduate: 'Postgraduate',
    masters: "Master's Degree",
    phd: 'PhD / Doctorate',
    postdoctoral: 'Postdoctoral',
    other: 'Other Programmes',
  };
  return labels[level] || level;
}

export function genderLabel(gender) {
  const labels = {
    all: 'Open to All Genders',
    women: 'Women Only',
    men: 'Men Only',
    women_priority: 'Women Encouraged / Priority',
    men_priority: 'Men Priority',
  };
  return labels[gender] || gender || 'Open to All';
}

export function scopeLabel(scope) {
  const labels = {
    local: 'Local (Within Ghana)',
    international: 'International (Study Abroad)',
    both: 'Local & International',
  };
  return labels[scope] || scope || 'Local (Ghana)';
}

export function generateSlug(name) {
  return String(name || '')
    .toLowerCase()
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .trim();
}

/**
 * Validate and sanitize external URLs to prevent XSS (javascript:, data: schemes)
 * Strictly permits only http:// and https:// protocols.
 * @param {string} url
 * @returns {string | null} Safe URL or null
 */
export function sanitizeUrl(url) {
  if (!url || typeof url !== 'string') return null;
  const trimmed = url.trim();
  if (!trimmed) return null;

  try {
    const parsed = new URL(trimmed);
    if (parsed.protocol === 'http:' || parsed.protocol === 'https:') {
      return trimmed;
    }
    return null;
  } catch {
    // If not a full URL with protocol, check if it looks like a valid web domain or relative path
    if (/^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]\.[a-zA-Z]{2,}/.test(trimmed)) {
      return `https://${trimmed}`;
    }
    if (trimmed.startsWith('/') && !trimmed.startsWith('//')) {
      return trimmed;
    }
    return null;
  }
}

/**
 * Sanitize internal redirect paths to prevent Open Redirect vulnerabilities
 * Ensures target is an internal relative route and blocks protocol-relative or external URLs.
 * @param {string} targetUrl
 * @param {string} defaultFallback
 * @returns {string} Safe internal relative path
 */
export function sanitizeRedirect(targetUrl, defaultFallback = '/dashboard') {
  if (!targetUrl || typeof targetUrl !== 'string') return defaultFallback;
  const trimmed = targetUrl.trim();

  // Must start with single / and not // (protocol-relative) or /\
  if (trimmed.startsWith('/') && !trimmed.startsWith('//') && !trimmed.startsWith('/\\')) {
    // Avoid double encoding or external host indicators
    if (!trimmed.includes('://')) {
      return trimmed;
    }
  }

  return defaultFallback;
}
