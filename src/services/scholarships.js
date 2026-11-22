/**
 * @file scholarships.js
 * @description Central scholarship data access, filtering, and caching layer.
 *
 * Responsibilities:
 * - Supabase PostgreSQL client integration with offline seed / localStorage fallback
 * - 5-minute TTL in-memory fast caching for high-speed repeated queries
 * - Full-text and faceted search (scope, levels, funding types, destinations, fields)
 * - CRUD operations: create, update, delete, status audit logging, and view analytics
 * - Live state synchronization through 'scholarship-updated' CustomEvent dispatching
 */

import { supabase, isSupabaseConfigured } from './supabase.js';
import initialSeedData from '../data/scholarships_seed.json' with { type: 'json' };

const STORAGE_KEY = 'ghana_scholarships_data';
const STATUS_HISTORY_KEY = 'ghana_scholarships_status_history';
const ANALYTICS_EVENTS_KEY = 'ghana_scholarships_analytics_events';

// In-Memory Fast Cache
const memoryCache = new Map();
const CACHE_TTL_MS = 5 * 60 * 1000; // 5 minutes

export function getFromCache(key) {
  const entry = memoryCache.get(key);
  if (!entry) return null;
  if (Date.now() - entry.timestamp > CACHE_TTL_MS) {
    memoryCache.delete(key);
    return null;
  }
  return entry.data;
}

export function setInCache(key, data) {
  memoryCache.set(key, { data, timestamp: Date.now() });
}

export function invalidateScholarshipCache() {
  memoryCache.clear();
}

/**
 * Selective columns for card/directory views — avoids transferring huge description/audit payloads
 */
// Selective columns for card/directory views.
// Joins provider and institution via foreign-key relations for PostgREST compatibility.
// Compatibility columns (title, status, scope, deadline, is_verified) are added by migration 009.
export const CARD_SELECT_FIELDS = [
  'id',
  'slug',
  'name',
  'title',
  'institution_category',
  'application_status',
  'status',
  'funding_type',
  'study_levels',
  'geographic_scope',
  'scope',
  'application_deadline',
  'deadline',
  'deadline_text',
  'gender_eligibility',
  'is_featured',
  'is_verified',
  'verification_status',
  'logo_url',
  'logo_storage_path',
  'logo_alt_text',
  'short_description',
  'is_published',
  'created_at',
  'provider:scholarship_providers(id, name, logo_url)',
  'institution:institutions(id, name)',
].join(', ');

/**
 * Normalize a raw Supabase DB row into the flat shape expected by all components.
 * Maps relational FK objects to their string values and aligns canonical ↔ compat column names.
 * @param {object} row - Raw row returned from PostgREST
 * @returns {object} Normalized scholarship record
 */
export function normalizeScholarshipRecord(row) {
  if (!row) return row;

  // Resolve provider: may be a joined object { id, name, logo_url } or already a string
  const providerObj = row.provider && typeof row.provider === 'object' ? row.provider : null;
  const providerName = providerObj ? (providerObj.name || '') : (row.provider || '');
  const providerLogoUrl = providerObj ? (providerObj.logo_url || null) : null;

  // Resolve institution: may be a joined object { id, name } or already a string
  const institutionObj = row.institution && typeof row.institution === 'object' ? row.institution : null;
  const institutionName = institutionObj ? (institutionObj.name || '') : (row.institution || '');

  // Normalize study_levels: in DB it's a text[] or joined table rows; in seed it's an array
  let studyLevels = row.study_levels;
  if (Array.isArray(studyLevels) && studyLevels.length > 0 && typeof studyLevels[0] === 'object') {
    // Joined scholarship_study_levels rows — not used in CARD_SELECT_FIELDS but guard anyway
    studyLevels = studyLevels.map((r) => r.level || r);
  }

  return {
    ...row,
    // Flat provider and institution strings for all components
    provider: providerName,
    provider_id: providerObj ? providerObj.id : (row.provider_id || null),
    provider_logo_url: providerLogoUrl || row.logo_url || null,
    institution: institutionName,
    institution_id: institutionObj ? institutionObj.id : (row.institution_id || null),
    // Canonical ↔ compat alignment
    title: row.title || row.name || '',
    name: row.name || row.title || '',
    status: row.status || (row.application_status ? String(row.application_status) : ''),
    application_status: row.application_status || row.status || '',
    scope: row.scope || (row.geographic_scope ? String(row.geographic_scope) : ''),
    geographic_scope: row.geographic_scope || row.scope || '',
    deadline: row.deadline || row.application_deadline || null,
    application_deadline: row.application_deadline || row.deadline || null,
    // URL aliases
    official_url: row.official_url || row.application_url || null,
    application_url: row.application_url || row.official_url || null,
    // Study levels
    study_levels: studyLevels || [],
    // Description aliases
    description: row.description || row.short_description || row.full_description || '',
  };
}

const DELETED_KEYS_KEY = 'gh_scholarships_deleted_ids';

export function getDeletedKeys() {
  if (typeof window === 'undefined') return new Set();
  try {
    const stored = localStorage.getItem(DELETED_KEYS_KEY);
    return new Set(stored ? JSON.parse(stored) : []);
  } catch {
    return new Set();
  }
}

export function recordDeletedKeys(keys) {
  if (typeof window === 'undefined') return;
  try {
    const set = getDeletedKeys();
    keys.forEach((k) => {
      if (k !== null && k !== undefined && String(k).trim()) {
        set.add(String(k).trim().toLowerCase());
      }
    });
    localStorage.setItem(DELETED_KEYS_KEY, JSON.stringify([...set]));
  } catch (e) {
    console.warn('Failed to record deleted keys:', e);
  }
}

// Initialize and synchronize local storage state
function getLocalStore() {
  const deletedKeys = getDeletedKeys();

  if (typeof window === 'undefined') {
    return initialSeedData.filter((s) => {
      const idKey = String(s.id || '').toLowerCase();
      const sourceKey = String(s.source_id || '').toLowerCase();
      const slugKey = String(s.slug || '').toLowerCase();
      return !deletedKeys.has(idKey) && !deletedKeys.has(sourceKey) && !deletedKeys.has(slugKey);
    });
  }

  const stored = localStorage.getItem(STORAGE_KEY);
  if (!stored) {
    const initial = initialSeedData.filter((s) => {
      const idKey = String(s.id || '').toLowerCase();
      const sourceKey = String(s.source_id || '').toLowerCase();
      const slugKey = String(s.slug || '').toLowerCase();
      return !deletedKeys.has(idKey) && !deletedKeys.has(sourceKey) && !deletedKeys.has(slugKey);
    });
    localStorage.setItem(STORAGE_KEY, JSON.stringify(initial));
    return initial;
  }

  try {
    const parsed = JSON.parse(stored);
    if (!Array.isArray(parsed) || parsed.length === 0) {
      const initial = initialSeedData.filter((s) => {
        const idKey = String(s.id || '').toLowerCase();
        const sourceKey = String(s.source_id || '').toLowerCase();
        const slugKey = String(s.slug || '').toLowerCase();
        return !deletedKeys.has(idKey) && !deletedKeys.has(sourceKey) && !deletedKeys.has(slugKey);
      });
      localStorage.setItem(STORAGE_KEY, JSON.stringify(initial));
      return initial;
    }

    // Filter out any explicitly deleted records that may be in parsed array
    const activeParsed = parsed.filter((s) => {
      const idKey = String(s.id || '').toLowerCase();
      const sourceKey = String(s.source_id || '').toLowerCase();
      const slugKey = String(s.slug || '').toLowerCase();
      return (!idKey || !deletedKeys.has(idKey)) &&
             (!sourceKey || !deletedKeys.has(sourceKey)) &&
             (!slugKey || !deletedKeys.has(slugKey));
    });

    // Merge any seed records that are missing from localStorage (e.g. newly imported international records)
    // NEVER resurrect records that were explicitly deleted!
    const existingKeys = new Set(
      activeParsed.flatMap((s) => [
        String(s.id || '').toLowerCase(),
        String(s.source_id || '').toLowerCase(),
        String(s.slug || '').toLowerCase(),
      ]).filter(Boolean)
    );

    let hasMissing = false;
    const toAdd = [];

    for (const seedItem of initialSeedData) {
      const idKey = String(seedItem.id || '').toLowerCase();
      const sourceKey = String(seedItem.source_id || '').toLowerCase();
      const slugKey = String(seedItem.slug || '').toLowerCase();

      // Skip if this record was deleted
      if ((idKey && deletedKeys.has(idKey)) ||
          (sourceKey && deletedKeys.has(sourceKey)) ||
          (slugKey && deletedKeys.has(slugKey))) {
        continue;
      }

      const exists = (idKey && existingKeys.has(idKey)) ||
                     (sourceKey && existingKeys.has(sourceKey)) ||
                     (slugKey && existingKeys.has(slugKey));

      if (!exists) {
        toAdd.push(seedItem);
        hasMissing = true;
      }
    }

    if (hasMissing || activeParsed.length !== parsed.length) {
      const merged = [...activeParsed, ...toAdd];
      localStorage.setItem(STORAGE_KEY, JSON.stringify(merged));
      return merged;
    }

    return activeParsed;
  } catch (e) {
    const initial = initialSeedData.filter((s) => {
      const idKey = String(s.id || '').toLowerCase();
      const sourceKey = String(s.source_id || '').toLowerCase();
      const slugKey = String(s.slug || '').toLowerCase();
      return !deletedKeys.has(idKey) && !deletedKeys.has(sourceKey) && !deletedKeys.has(slugKey);
    });
    localStorage.setItem(STORAGE_KEY, JSON.stringify(initial));
    return initial;
  }
}

function setLocalStore(data) {
  if (typeof window !== 'undefined') {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
  }
}

function getLocalHistory() {
  if (typeof window === 'undefined') return [];
  const stored = localStorage.getItem(STATUS_HISTORY_KEY);
  return stored ? JSON.parse(stored) : [];
}

function addLocalHistory(entry) {
  if (typeof window !== 'undefined') {
    const history = getLocalHistory();
    history.unshift(entry);
    localStorage.setItem(STATUS_HISTORY_KEY, JSON.stringify(history));
  }
}

function getLocalAnalytics() {
  if (typeof window === 'undefined') return [];
  const stored = localStorage.getItem(ANALYTICS_EVENTS_KEY);
  return stored ? JSON.parse(stored) : [];
}

/**
 * Fetch all scholarships (for Admin Console)
 */
export async function getAllScholarships() {
  const cacheKey = 'admin_all_scholarships';
  const cached = getFromCache(cacheKey);
  if (cached) return cached;

  if (isSupabaseConfigured()) {
    try {
      const { data, error } = await supabase
        .from('scholarships')
        .select('*')
        .order('created_at', { ascending: false });

      if (!error && data && data.length > 0) {
        setInCache(cacheKey, data);
        return data;
      }
    } catch (err) {
      // fallback to local store
    }
  }

  const local = getLocalStore();
  setInCache(cacheKey, local);
  return local;
}

/**
 * Fetch published scholarships (for Public Directory) with selective columns & caching
 */
export async function getPublishedScholarships(limit = 300) {
  const cacheKey = `published_limit_${limit}`;
  const cached = getFromCache(cacheKey);
  if (cached) return cached;

  if (isSupabaseConfigured()) {
    try {
      const { data, error } = await supabase
        .from('scholarships')
        .select(CARD_SELECT_FIELDS)
        .eq('is_published', true)
        .order('created_at', { ascending: false })
        .limit(limit);

      if (!error && data && data.length > 0) {
        const normalized = data.map(normalizeScholarshipRecord);
        setInCache(cacheKey, normalized);
        return normalized;
      }
    } catch (err) {
      // fallback
    }
  }

  const local = getLocalStore();
  const filtered = local.filter((s) => s.is_published !== false).slice(0, limit);
  setInCache(cacheKey, filtered);
  return filtered;
}

/**
 * Fetch featured scholarships that strictly have status "Open"
 * Automatically returns the top `limit` Open opportunities.
 * Re-evaluating ensures that when a scholarship closes, the next
 * available Open scholarship takes its place to maintain the count.
 */
export async function getFeaturedOpenScholarships(limit = 6) {
  const cacheKey = `featured_open_limit_${limit}`;
  const cached = getFromCache(cacheKey);
  if (cached) return cached;

  if (isSupabaseConfigured()) {
    try {
      const { data, error } = await supabase
        .from('scholarships')
        .select(CARD_SELECT_FIELDS)
        .eq('is_published', true)
        .ilike('application_status', 'open')
        .order('created_at', { ascending: false })
        .limit(limit);

      if (!error && data && data.length > 0) {
        const normalized = data.map(normalizeScholarshipRecord);
        setInCache(cacheKey, normalized);
        return normalized;
      }
    } catch (err) {
      // fallback to local
    }
  }

  const local = getLocalStore();
  const openListings = local.filter((s) => {
    if (s.is_published === false) return false;
    const status = String(s.application_status || s.status || '').trim().toLowerCase();
    return status === 'open';
  }).slice(0, limit);

  setInCache(cacheKey, openListings);
  return openListings;
}

const DESTINATION_MAP = {
  GH: ['ghana'],
  GB: ['united kingdom', 'uk', 'britain', 'england', 'scotland', 'wales', 'chevening', 'commonwealth'],
  US: ['united states', 'usa', 'u.s.', 'america', 'fulbright', 'harvard', 'mit', 'columbia'],
  CA: ['canada', 'vanier', 'banting', 'toronto', 'british columbia', 'mcgill'],
  DE: ['germany', 'deutschland', 'daad', 'heinrich'],
  JP: ['japan', 'mext', 'jica', 'tokyo'],
  CN: ['china', 'csc', 'chinese'],
  AU: ['australia', 'australian', 'sydney', 'melbourne'],
  FR: ['france', 'french', 'eiffel'],
  NL: ['netherlands', 'holland', 'dutch', 'orange knowledge'],
  SE: ['sweden', 'swedish', 'si scholarship'],
  KR: ['korea', 'south korea', 'korean', 'gks'],
};

const FIELD_MAP = {
  engineering: ['engineering', 'mechanical', 'electrical', 'civil', 'chemical', 'biomedical', 'stem'],
  'medicine-health-sciences': ['medicine', 'medical', 'health', 'nursing', 'pharmacy', 'mbbs', 'clinical', 'public health'],
  'computer-science-it': ['computer', 'software', 'it', 'data', 'artificial intelligence', 'ai', 'technology', 'computing', 'cyber'],
  'business-management': ['business', 'management', 'finance', 'marketing', 'mba', 'accounting', 'economics', 'commerce'],
  agriculture: ['agriculture', 'agribusiness', 'crop', 'soil', 'forestry', 'fisheries', 'farming'],
  education: ['education', 'teaching', 'pedagogy', 'curriculum', 'teacher'],
  law: ['law', 'llb', 'llm', 'legal', 'human rights', 'justice'],
  'social-sciences': ['social', 'sociology', 'economics', 'politics', 'international relations', 'development'],
  'arts-humanities': ['arts', 'humanities', 'history', 'literature', 'languages', 'culture', 'philosophy'],
  science: ['science', 'physics', 'chemistry', 'biology', 'mathematics', 'biochemistry', 'stem'],
  architecture: ['architecture', 'urban', 'planning', 'design', 'surveying'],
  'environmental-studies': ['environment', 'climate', 'sustainability', 'ecology', 'water', 'renewable'],
};

function buildSearchableText(s) {
  const title = s.title || s.name || '';
  const desc = s.description || s.short_description || s.full_description || '';
  const prov = typeof s.provider === 'object' && s.provider ? s.provider.name || '' : String(s.provider || '');
  const inst = typeof s.institution === 'object' && s.institution ? s.institution.name || '' : String(s.institution || '');
  const country = s.host_country || '';
  const targetCountries = Array.isArray(s.target_countries) ? s.target_countries.join(' ') : String(s.target_countries || '');
  const category = s.institution_category || '';
  const levels = Array.isArray(s.study_levels) ? s.study_levels.join(' ') : String(s.study_levels || '');
  const funding = s.funding_type || '';
  const scope = s.geographic_scope || s.scope || '';
  const fields = Array.isArray(s.fields_of_study) ? s.fields_of_study.join(' ') : String(s.fields_of_study || '');

  return [
    title,
    prov,
    inst,
    country,
    targetCountries,
    desc,
    category,
    levels,
    funding,
    scope,
    fields,
  ]
    .join(' ')
    .toLowerCase();
}

/**
 * High-performance filtered & paginated query
 * Supports server-side filtering on Supabase or fast local fallback
 */
export async function getFilteredScholarships({
  page = 1,
  pageSize = 12,
  query = '',
  scope = 'all',
  levels = [],
  fundingTypes = [],
  gender = 'all',
  status = [],
  institutionCategory = 'all',
  field = '',
  destination = '',
  sort = 'newest',
} = {}) {
  const cacheKey = `filtered_${JSON.stringify({ page, pageSize, query, scope, levels, fundingTypes, gender, status, institutionCategory, field, destination, sort })}`;
  const cached = getFromCache(cacheKey);
  if (cached) return cached;

  const start = (page - 1) * pageSize;
  const end = start + pageSize - 1;

  // Try Supabase server-side query first if configured
  if (isSupabaseConfigured()) {
    try {
      let q = supabase
        .from('scholarships')
        .select(CARD_SELECT_FIELDS, { count: 'exact' })
        .eq('is_published', true);

      // Geographic Scope
      if (scope && scope !== 'all') {
        if (scope === 'local') {
          q = q.in('geographic_scope', ['local', 'both']);
        } else if (scope === 'international') {
          q = q.in('geographic_scope', ['international', 'both']);
        }
      }

      // Gender Eligibility
      if (gender && gender !== 'all') {
        q = q.eq('gender_eligibility', gender);
      }

      // Application Status
      if (status && status.length > 0) {
        q = q.in('application_status', status);
      }

      // Funding Types
      if (fundingTypes && fundingTypes.length > 0) {
        q = q.in('funding_type', fundingTypes);
      }

      // Keyword Search — use canonical columns that exist as flat text on the scholarships table
      if (query && query.trim()) {
        const term = query.trim();
        q = q.or(`name.ilike.%${term}%,title.ilike.%${term}%,short_description.ilike.%${term}%`);
      }

      // Sorting
      if (sort === 'deadline') {
        q = q.order('application_deadline', { ascending: true, nullsFirst: false });
      } else {
        q = q.order('created_at', { ascending: false });
      }

      q = q.range(start, end);

      const { data, count, error } = await q;

      if (!error && data && data.length > 0) {
        const result = {
          data: data.map(normalizeScholarshipRecord),
          total: count || data.length,
          page,
          pageSize,
          totalPages: Math.ceil((count || data.length) / pageSize),
        };
        setInCache(cacheKey, result);
        return result;
      }
    } catch (err) {
      // fallback to local filter
    }
  }

  // Resilient Local Filter Fallback
  const all = getLocalStore().filter((s) => s.is_published !== false);
  let filtered = [...all];

  // Comprehensive multi-field search as you type
  if (query && query.trim()) {
    const qTerm = query.toLowerCase().trim();
    const tokens = qTerm.split(/\s+/).filter(Boolean);
    filtered = filtered.filter((s) => {
      const searchable = buildSearchableText(s);
      return tokens.every((token) => searchable.includes(token));
    });
  }

  // Scope
  if (scope && scope !== 'all') {
    filtered = filtered.filter((s) => {
      const sc = s.geographic_scope || s.scope || 'local';
      return scope === 'local' ? sc === 'local' || sc === 'both' : sc === 'international' || sc === 'both';
    });
  }

  // Levels
  if (levels && levels.length > 0) {
    filtered = filtered.filter((s) => {
      const sLevels = s.study_levels || [];
      return levels.some((lvl) => sLevels.includes(lvl));
    });
  }

  // Funding types
  if (fundingTypes && fundingTypes.length > 0) {
    filtered = filtered.filter((s) => fundingTypes.includes(s.funding_type));
  }

  // Gender
  if (gender && gender !== 'all') {
    filtered = filtered.filter((s) => s.gender_eligibility === gender);
  }

  // Status
  if (status && status.length > 0) {
    filtered = filtered.filter((s) => status.includes(s.application_status || s.status));
  }

  // Institution category
  if (institutionCategory && institutionCategory !== 'all') {
    if (institutionCategory === 'institution_specific') {
      filtered = filtered.filter((s) => s.institution_specific === true || (s.institution && s.institution !== 'Various'));
    } else if (institutionCategory === 'public_university' || institutionCategory === 'public_tertiary') {
      filtered = filtered.filter((s) => s.institution_category === 'public_university' || s.institution_category === 'public_tertiary' || s.public_school_specific === true);
    } else {
      filtered = filtered.filter((s) => s.institution_category === institutionCategory);
    }
  }

  // Field of Study Filter
  if (field && field !== 'all') {
    const keywords = FIELD_MAP[field] || [field.toLowerCase().replace(/[-_]/g, ' ')];
    filtered = filtered.filter((s) => {
      const sFields = [
        Array.isArray(s.fields_of_study) ? s.fields_of_study.join(' ') : (s.fields_of_study || ''),
        s.title || '',
        s.description || ''
      ].join(' ').toLowerCase();
      return keywords.some((k) => sFields.includes(k));
    });
  }

  // Destination Country Filter
  if (destination && destination !== 'all') {
    const destKeywords = DESTINATION_MAP[destination.toUpperCase()] || [destination.toLowerCase()];
    filtered = filtered.filter((s) => {
      const searchable = [
        s.host_country || '',
        Array.isArray(s.target_countries) ? s.target_countries.join(' ') : (s.target_countries || ''),
        s.title || '',
        s.description || ''
      ].join(' ').toLowerCase();
      return destKeywords.some((k) => searchable.includes(k));
    });
  }

  // Sorting
  filtered.sort((a, b) => {
    // Open scholarships always take natural precedence
    const aOpen = (a.application_status || a.status) === 'open';
    const bOpen = (b.application_status || b.status) === 'open';
    if (aOpen && !bOpen) return -1;
    if (!aOpen && bOpen) return 1;

    if (sort === 'deadline') {
      const dateA = a.application_deadline ? new Date(a.application_deadline).getTime() : Infinity;
      const dateB = b.application_deadline ? new Date(b.application_deadline).getTime() : Infinity;
      return dateA - dateB;
    }
    return new Date(b.created_at || 0) - new Date(a.created_at || 0);
  });

  const total = filtered.length;
  const paginatedData = filtered.slice(start, start + pageSize);

  const result = {
    data: paginatedData,
    total,
    page,
    pageSize,
    totalPages: Math.ceil(total / pageSize) || 1,
  };

  setInCache(cacheKey, result);
  return result;
}

/**
 * Fetch single scholarship by slug or ID with instant caching
 */
export async function getScholarshipBySlug(slug) {
  if (!slug) return null;

  const cacheKey = `slug_${slug}`;
  const cached = getFromCache(cacheKey);
  if (cached) return cached;

  if (isSupabaseConfigured()) {
    try {
      const { data, error } = await supabase
        .from('scholarships')
        .select('*')
        .or(`slug.eq.${slug},id.eq.${slug}`)
        .maybeSingle();

      if (!error && data) {
        const normalized = normalizeScholarshipRecord(data);
        setInCache(cacheKey, normalized);
        return normalized;
      }
    } catch (err) {
      // fallback
    }
  }

  const local = getLocalStore();
  const found = local.find((s) => s.slug === slug || String(s.id) === String(slug)) || null;
  if (found) {
    setInCache(cacheKey, found);
  }
  return found;
}

/**
 * Fetch a single scholarship by ID or slug — used by Admin Edit page.
 * Safely handles both UUID and string IDs (e.g. sch_gh001, INT001).
 */
export async function getScholarshipById(id) {
  if (!id) return null;

  const cacheKey = `scholarship_id_${id}`;
  const cached = getFromCache(cacheKey);
  if (cached) return cached;

  // Try Supabase: match by id OR by slug
  if (isSupabaseConfigured()) {
    try {
      const { data, error } = await supabase
        .from('scholarships')
        .select('*')
        .or(`id.eq.${id},slug.eq.${id}`)
        .maybeSingle();

      if (!error && data) {
        const normalized = normalizeScholarshipRecord(data);
        setInCache(cacheKey, normalized);
        return normalized;
      }
    } catch (err) {
      // fall through to local store
    }
  }

  // Local store fallback
  const local = getLocalStore();
  const found = local.find(
    (s) => String(s.id) === String(id) || s.slug === id || s.source_id === id
  ) || null;

  if (found) setInCache(cacheKey, found);
  return found;
}

/**
 * Create new scholarship
 */
export async function createScholarship(payload) {
  const timestamp = new Date().toISOString();
  const record = {
    ...payload,
    id: payload.id || `sch_${Date.now()}_${Math.random().toString(36).substring(2, 6)}`,
    created_at: timestamp,
    updated_at: timestamp,
  };

  try {
    await supabase.from('scholarships').insert([record]);
  } catch (e) {
    console.warn('Supabase create fallback:', e.message);
  }

  const items = getLocalStore();
  items.unshift(record);
  setLocalStore(items);

  // Invalidate caches
  invalidateScholarshipCache();
  return record;
}

/**
 * Update scholarship status with audit log and instant cache invalidation
 */
export async function updateScholarshipStatus(id, newStatus, reason = '', adminEmail = 'admin@ghanascholarships.gov.gh') {
  const timestamp = new Date().toISOString();

  const historyEntry = {
    id: `hist_${Date.now()}_${Math.random().toString(36).substring(2, 6)}`,
    scholarship_id: id,
    new_status: newStatus,
    reason: reason || 'Status updated by administrator',
    changed_by: adminEmail,
    created_at: timestamp,
  };

  try {
    await supabase.from('scholarships').update({ application_status: newStatus, updated_at: timestamp }).eq('id', id);
    await supabase.from('scholarship_status_history').insert([historyEntry]);
  } catch (e) {
    console.warn('Supabase status update fallback:', e.message);
  }

  const items = getLocalStore();
  const updated = items.map((item) => {
    if (item.id === id) {
      historyEntry.previous_status = item.application_status;
      return { ...item, application_status: newStatus, status: newStatus, updated_at: timestamp };
    }
    return item;
  });
  setLocalStore(updated);
  addLocalHistory(historyEntry);

  invalidateScholarshipCache();
  return true;
}

/**
 * Update full scholarship record with logo metadata, Supabase sync, and cache invalidation.
 * Correctly maps database columns and confirms successful updates.
 */
export async function updateScholarship(targetIdOrSlug, fields) {
  const timestamp = new Date().toISOString();

  // 1. Resolve target item in local store
  const localItems = getLocalStore();
  const targetIndex = localItems.findIndex((item) => {
    const idMatch = String(item.id || '').toLowerCase() === String(targetIdOrSlug || '').toLowerCase();
    const sourceMatch = item.source_id && String(item.source_id).toLowerCase() === String(targetIdOrSlug || '').toLowerCase();
    const slugMatch = item.slug && String(item.slug).toLowerCase() === String(targetIdOrSlug || '').toLowerCase();
    return idMatch || sourceMatch || slugMatch;
  });
  const target = targetIndex !== -1 ? localItems[targetIndex] : null;
  const canonicalId = target?.id || targetIdOrSlug;
  const canonicalSlug = target?.slug || fields.slug || targetIdOrSlug;

  // 2. Prepare database-compliant Supabase payload (only matching existing columns)
  const supabasePayload = {
    name: fields.title || fields.name,
    title: fields.title || fields.name,
    institution_category: fields.institution_category || 'other',
    geographic_scope: fields.geographic_scope || fields.scope || 'local',
    scope: fields.geographic_scope || fields.scope || 'local',
    funding_type: fields.funding_type || 'other',
    gender_eligibility: fields.gender_eligibility || 'all',
    application_status: fields.application_status || fields.status || 'open',
    status: fields.application_status || fields.status || 'open',
    verification_status: fields.verification_status || (fields.is_verified ? 'verified' : 'needs_verification'),
    is_verified: !!fields.is_verified,
    is_featured: !!fields.is_featured,
    is_published: fields.is_published !== false,
    application_url: fields.official_url || fields.application_url || null,
    information_url: fields.information_url || null,
    short_description: fields.short_description || (fields.description ? fields.description.substring(0, 160) : null),
    full_description: fields.description || fields.full_description || null,
    eligibility_requirements: Array.isArray(fields.eligibility_criteria)
      ? fields.eligibility_criteria.join('\n')
      : (fields.eligibility_requirements || fields.eligibility_criteria || null),
    benefits: Array.isArray(fields.benefits)
      ? fields.benefits
      : (fields.benefits ? [fields.benefits] : null),
    required_documents: Array.isArray(fields.required_documents)
      ? fields.required_documents
      : (fields.required_documents ? [fields.required_documents] : null),
    study_levels: Array.isArray(fields.study_levels)
      ? fields.study_levels
      : (fields.study_levels ? fields.study_levels.split(',').map((s) => s.trim()) : ['undergraduate']),
    fields_of_study: Array.isArray(fields.fields_of_study)
      ? fields.fields_of_study
      : (fields.fields_of_study ? fields.fields_of_study.split(',').map((s) => s.trim()) : ['All Fields']),
    host_country: fields.host_country || 'Ghana',
    deadline_text: fields.deadline_text || null,
    logo_url: fields.logo_url || null,
    logo_storage_path: fields.logo_storage_path || null,
    logo_alt_text: fields.logo_alt_text || null,
    logo_updated_at: timestamp,
    updated_at: timestamp,
  };

  // Safe format for DATE column: only set if valid YYYY-MM-DD
  if (fields.application_deadline && /^\d{4}-\d{2}-\d{2}/.test(fields.application_deadline)) {
    supabasePayload.application_deadline = fields.application_deadline.substring(0, 10);
  } else {
    supabasePayload.application_deadline = null;
    if (fields.application_deadline && !supabasePayload.deadline_text) {
      supabasePayload.deadline_text = String(fields.application_deadline);
    }
  }

  // 3. Update Supabase if configured
  if (isSupabaseConfigured()) {
    const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(canonicalId);
    let query = supabase.from('scholarships').update(supabasePayload);
    if (isUuid) {
      query = query.eq('id', canonicalId);
    } else if (canonicalSlug) {
      query = query.eq('slug', canonicalSlug);
    } else {
      query = query.or(`id.eq.${canonicalId},slug.eq.${canonicalId}`);
    }

    const { data, error } = await query.select().maybeSingle();
    if (error) {
      console.error('Supabase update rejected:', error);
      throw new Error(`Database error: ${error.message || 'Failed to update record in Supabase.'}`);
    }
  }

  // 4. Update Local Storage for instant offline & client persistence
  const mergedRecord = {
    ...(target || {}),
    ...fields,
    ...supabasePayload,
    id: canonicalId,
    source_id: target?.source_id,
    slug: canonicalSlug,
    updated_at: timestamp,
  };

  let updatedList;
  if (targetIndex !== -1) {
    updatedList = [...localItems];
    updatedList[targetIndex] = mergedRecord;
  } else {
    const exists = localItems.some((s) => s.id === canonicalId);
    if (exists) {
      updatedList = localItems.map((s) => (s.id === canonicalId ? mergedRecord : s));
    } else {
      updatedList = [mergedRecord, ...localItems];
    }
  }

  setLocalStore(updatedList);

  // 5. Invalidate all query & aggregate caches
  invalidateScholarshipCache();

  // 6. Broadcast event so currently mounted views immediately re-render
  if (typeof window !== 'undefined') {
    window.dispatchEvent(
      new CustomEvent('scholarship-updated', {
        detail: {
          id: mergedRecord.id,
          slug: mergedRecord.slug,
          scholarship: mergedRecord,
        },
      })
    );
  }

  return { success: true, scholarship: mergedRecord };
}

/**
 * Toggle published status
 */
export async function togglePublished(id, currentStatus) {
  return updateScholarship(id, { is_published: !currentStatus });
}

/**
 * Delete scholarship permanently
 */
export async function deleteScholarship(targetIdOrSlug) {
  if (!targetIdOrSlug) return false;

  const targetStr = String(targetIdOrSlug).trim().toLowerCase();

  // Find the target record in local store to collect all its keys (id, source_id, slug)
  const items = getLocalStore();
  const targetItem = items.find((item) => {
    return (item.id && String(item.id).toLowerCase() === targetStr) ||
           (item.source_id && String(item.source_id).toLowerCase() === targetStr) ||
           (item.slug && String(item.slug).toLowerCase() === targetStr);
  });

  const keysToDelete = [
    targetIdOrSlug,
    targetItem?.id,
    targetItem?.source_id,
    targetItem?.slug,
  ].filter(Boolean);

  // Permanently record all keys in the deleted tombstone registry
  recordDeletedKeys(keysToDelete);

  // Delete from Supabase if configured
  if (isSupabaseConfigured()) {
    try {
      const idToDelete = targetItem?.id || targetIdOrSlug;
      await supabase.from('scholarships').delete().eq('id', idToDelete);
      if (targetItem?.slug) {
        await supabase.from('scholarships').delete().eq('slug', targetItem.slug);
      }
    } catch (e) {
      console.warn('Supabase delete warning:', e.message);
    }
  }

  // Remove from local storage
  const filtered = items.filter((item) => {
    const idMatch = item.id && keysToDelete.some((k) => String(k).toLowerCase() === String(item.id).toLowerCase());
    const sourceMatch = item.source_id && keysToDelete.some((k) => String(k).toLowerCase() === String(item.source_id).toLowerCase());
    const slugMatch = item.slug && keysToDelete.some((k) => String(k).toLowerCase() === String(item.slug).toLowerCase());
    return !idMatch && !sourceMatch && !slugMatch;
  });
  setLocalStore(filtered);

  // Invalidate in-memory cache
  invalidateScholarshipCache();

  // Dispatch global event so all open views (admin, directory, featured) update immediately
  if (typeof window !== 'undefined') {
    window.dispatchEvent(
      new CustomEvent('scholarship-deleted', {
        detail: { id: targetIdOrSlug, keys: keysToDelete },
      })
    );
  }

  return true;
}

/**
 * Archive scholarship
 */
export async function archiveScholarship(id) {
  return updateScholarshipStatus(id, 'archived', 'Archived by administrator');
}

/**
 * Get Status Audit History
 */
export async function getStatusHistory(scholarshipId = null) {
  try {
    let query = supabase.from('scholarship_status_history').select('*').order('created_at', { ascending: false });
    if (scholarshipId) query = query.eq('scholarship_id', scholarshipId);
    const { data, error } = await query;
    if (!error && data && data.length > 0) return data;
  } catch (e) {
    // fallback
  }

  const localHistory = getLocalHistory();
  if (scholarshipId) {
    return localHistory.filter((h) => h.scholarship_id === scholarshipId);
  }
  return localHistory;
}

/**
 * Record Analytics Event
 */
export async function recordAnalyticsEvent(eventType, scholarshipId = null, metadata = {}) {
  const event = {
    id: `evt_${Date.now()}_${Math.random().toString(36).substring(2, 6)}`,
    event_type: eventType,
    scholarship_id: scholarshipId,
    metadata,
    created_at: new Date().toISOString(),
  };

  try {
    await supabase.from('analytics_events').insert([event]);
  } catch (e) {
    // fallback
  }

  if (typeof window !== 'undefined') {
    const events = getLocalAnalytics();
    events.unshift(event);
    if (events.length > 500) events.pop();
    localStorage.setItem(ANALYTICS_EVENTS_KEY, JSON.stringify(events));
  }
}

/**
 * Get Analytics Summary for Admin Dashboard
 */
export async function getAnalyticsSummary(period = 'all') {
  const cacheKey = `analytics_${period}`;
  const cached = getFromCache(cacheKey);
  if (cached) return cached;

  const scholarships = await getAllScholarships();
  const events = getLocalAnalytics();

  const now = new Date();
  let cutoff = new Date(0);
  if (period === '7d') cutoff = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);
  else if (period === '30d') cutoff = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000);
  else if (period === '90d') cutoff = new Date(now.getTime() - 90 * 24 * 60 * 60 * 1000);
  else if (period === '12m') cutoff = new Date(now.getTime() - 365 * 24 * 60 * 60 * 1000);

  const filteredEvents = events.filter((e) => new Date(e.created_at) >= cutoff);

  const viewsCount = filteredEvents.filter((e) => e.event_type === 'view').length;
  const savesCount = filteredEvents.filter((e) => e.event_type === 'save').length;
  const applyClicks = filteredEvents.filter((e) => e.event_type === 'apply_click').length;
  const searchEvents = filteredEvents.filter((e) => e.event_type === 'search');

  const statusCounts = {
    open: scholarships.filter((s) => (s.application_status || s.status) === 'open').length,
    closed: scholarships.filter((s) => (s.application_status || s.status) === 'closed').length,
    rolling: scholarships.filter((s) => ['rolling', 'unannounced'].includes(s.application_status || s.status)).length,
    archived: scholarships.filter((s) => (s.application_status || s.status) === 'archived').length,
  };

  const levelCounts = {
    undergraduate: scholarships.filter((s) => s.study_levels?.includes('undergraduate')).length,
    postgraduate: scholarships.filter((s) => s.study_levels?.some((l) => ['postgraduate', 'masters', 'phd'].includes(l))).length,
    shs: scholarships.filter((s) => s.study_levels?.includes('shs')).length,
    diploma: scholarships.filter((s) => s.study_levels?.includes('diploma') || s.study_levels?.includes('vocational')).length,
  };

  const fundingCounts = {};
  scholarships.forEach((s) => {
    const f = s.funding_type || 'other';
    fundingCounts[f] = (fundingCounts[f] || 0) + 1;
  });

  const institutionCounts = {};
  scholarships.forEach((s) => {
    const inst = typeof s.institution === 'object' ? s.institution?.name : s.institution;
    if (inst) {
      institutionCounts[inst] = (institutionCounts[inst] || 0) + 1;
    }
  });

  const providerCounts = {};
  scholarships.forEach((s) => {
    const prov = typeof s.provider === 'object' ? s.provider?.name : s.provider;
    if (prov) {
      providerCounts[prov] = (providerCounts[prov] || 0) + 1;
    }
  });

  const searchTerms = {};
  searchEvents.forEach((e) => {
    const q = e.metadata?.query?.trim().toLowerCase();
    if (q) searchTerms[q] = (searchTerms[q] || 0) + 1;
  });

  const localCount = scholarships.filter(
    (s) => (s.geographic_scope || s.scope) === 'local'
  ).length;

  const internationalCount = scholarships.filter(
    (s) => (s.geographic_scope || s.scope) === 'international' || (s.geographic_scope || s.scope) === 'both'
  ).length;

  const unpublishedCount = scholarships.filter((s) => s.is_published === false).length;
  const unverifiedCount = scholarships.filter((s) => s.verification_status !== 'verified' && !s.is_verified).length;

  const summary = {
    totalScholarships: scholarships.length,
    localCount,
    internationalCount,
    openCount: statusCounts.open,
    closedCount: statusCounts.closed,
    rollingCount: statusCounts.rolling,
    archivedCount: statusCounts.archived,
    unpublishedCount,
    unverifiedCount,
    viewsCount,
    savesCount,
    applyClicks,
    statusCounts,
    levelCounts,
    fundingCounts,
    institutionCounts,
    providerCounts,
    topSearchTerms: Object.entries(searchTerms)
      .sort((a, b) => b[1] - a[1])
      .slice(0, 10),
  };

  // Attempt live Supabase exact head counts when connected
  try {
    const [totalRes, localRes, intlRes, openRes, closedRes, unpubRes, unverRes] = await Promise.all([
      supabase.from('scholarships').select('id', { count: 'exact', head: true }),
      supabase.from('scholarships').select('id', { count: 'exact', head: true }).in('geographic_scope', ['local', 'both']),
      supabase.from('scholarships').select('id', { count: 'exact', head: true }).in('geographic_scope', ['international', 'both']),
      supabase.from('scholarships').select('id', { count: 'exact', head: true }).eq('application_status', 'open'),
      supabase.from('scholarships').select('id', { count: 'exact', head: true }).eq('application_status', 'closed'),
      supabase.from('scholarships').select('id', { count: 'exact', head: true }).eq('is_published', false),
      supabase.from('scholarships').select('id', { count: 'exact', head: true }).neq('verification_status', 'verified'),
    ]);
    if (!totalRes.error && totalRes.count !== null && totalRes.count > 0) {
      summary.totalScholarships = totalRes.count;
      if (!localRes.error && localRes.count !== null) summary.localCount = localRes.count;
      if (!intlRes.error && intlRes.count !== null) summary.internationalCount = intlRes.count;
      if (!openRes.error && openRes.count !== null) summary.openCount = openRes.count;
      if (!closedRes.error && closedRes.count !== null) summary.closedCount = closedRes.count;
      if (!unpubRes.error && unpubRes.count !== null) summary.unpublishedCount = unpubRes.count;
      if (!unverRes.error && unverRes.count !== null) summary.unverifiedCount = unverRes.count;
    }
  } catch (e) {
    // fallback
  }

  setInCache(cacheKey, summary);
  return summary;
}

/**
 * Fetch overview statistics with caching
 */
export async function getScholarshipStats() {
  const cacheKey = 'stats_overview';
  const cached = getFromCache(cacheKey);
  if (cached) return cached;

  const scholarships = await getAllScholarships();
  const published = scholarships.filter((s) => s.is_published !== false);
  const stats = {
    total: published.length,
    open: published.filter((s) => (s.application_status || s.status) === 'open').length,
    local: published.filter((s) => (s.geographic_scope || s.scope) === 'local').length,
    international: published.filter((s) => (s.geographic_scope || s.scope) === 'international' || (s.geographic_scope || s.scope) === 'both').length,
  };

  setInCache(cacheKey, stats);
  return stats;
}
