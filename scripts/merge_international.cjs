/**
 * merge_international.cjs
 * Parses the international scholarship xlsx and merges 50 records into scholarships_seed.json
 * Run with: node scripts/merge_international.cjs
 */
const xlsx = require('xlsx');
const fs = require('fs');
const path = require('path');

const XLSX_PATH = path.resolve(
  'C:/Users/PY TECH/.gemini/antigravity/brain/6cbc374d-31fe-49b9-b643-8f55ec9a8ad2/.user_uploaded/media_1795040861746_3d86ae79.xlsx'
);
const SEED_PATH = path.resolve(__dirname, '../src/data/scholarships_seed.json');
const SQL_PATH = path.resolve(__dirname, '../supabase/migrations/005_international_scholarships.sql');

function slugify(text, suffix) {
  return (
    text
      .toLowerCase()
      .replace(/['']/g, '')
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '')
      .substring(0, 80) +
    '-' +
    suffix.toLowerCase()
  );
}

function mapFundingType(raw) {
  if (!raw) return 'other';
  const r = raw.toLowerCase();
  if (r.includes('fully funded')) return 'fully_funded';
  if (r.includes('partial')) return 'partially_funded';
  if (r.includes('tuition') && !r.includes('full')) return 'tuition_only';
  if (r.includes('grant')) return 'grant';
  if (r.includes('bursary')) return 'bursary';
  return 'other';
}

function mapInstitutionCategory(raw) {
  if (!raw) return 'other';
  const r = raw.toLowerCase();
  if (r.includes('foreign university') || r.includes('foreign uni')) return 'foreign_university';
  if (r.includes('government')) return 'government';
  if (r.includes('foundation')) return 'foundation';
  if (r.includes('public')) return 'public_university';
  return 'other';
}

function mapStudyLevels(raw) {
  if (!raw) return ['other'];
  const parts = raw.split(/[\/,]/).map((s) => s.trim().toLowerCase());
  return parts.map((p) => {
    if (p.includes("master") || p.includes("postgraduate") || p === 'msc' || p === 'ma' || p === 'mba') return 'masters';
    if (p.includes('phd') || p.includes('doctoral') || p.includes('dphil') || p.includes('doctorate')) return 'phd';
    if (p.includes("bachelor") || p.includes('undergraduate') || p === 'bsc' || p === 'ba' || p === 'beng') return 'undergraduate';
    if (p.includes('diploma') || p.includes('technical') || p.includes('vocational') || p.includes('hnd')) return 'diploma';
    if (p.includes('research')) return 'research';
    if (p.includes('shs') || p.includes('secondary') || p.includes('high school')) return 'shs';
    if (p.includes('short') || p.includes('professional') || p.includes('certificate')) return 'professional';
    return p.replace(/[^a-z0-9]/g, '_') || 'other';
  }).filter((v, i, arr) => arr.indexOf(v) === i); // deduplicate
}

function mapGender(raw) {
  if (!raw) return 'all';
  const r = raw.toLowerCase();
  if (r.includes('women only') || r.includes('female only') || r.includes('women-only')) return 'women';
  if (r.includes('women encouraged') || r.includes('women priority') || r.includes('women are encouraged')) return 'women_priority';
  return 'all';
}

function mapVerificationStatus(raw) {
  if (!raw) return 'needs_verification';
  return raw.toLowerCase().includes('confirmed') ? 'verified' : 'needs_verification';
}

function tryParseDate(raw) {
  if (!raw) return null;
  // If it's clearly a descriptive string (not a parseable date), return null
  if (/annual|cycle|variable|rolling|tba|tbc|closed|pending|ongoing|various|not|check|verify/i.test(raw)) return null;
  // Try parsing as date
  try {
    const d = new Date(raw);
    if (!isNaN(d.getTime())) {
      return d.toISOString().split('T')[0]; // YYYY-MM-DD
    }
  } catch (e) {}
  return null;
}

function mapFieldsOfStudy(raw) {
  if (!raw) return ['All Fields'];
  const parts = raw.split(',').map((s) => s.trim()).filter(Boolean);
  if (parts.length > 5) return ['All Fields'];
  return parts;
}

function escSql(val) {
  if (val === null || val === undefined) return 'NULL';
  if (typeof val === 'boolean') return val ? 'TRUE' : 'FALSE';
  if (typeof val === 'number') return String(val);
  if (Array.isArray(val)) {
    const escaped = val.map((v) => `"${String(v).replace(/"/g, '\\"')}"`).join(', ');
    return `ARRAY[${escaped}]::text[]`;
  }
  return `'${String(val).replace(/'/g, "''")}'`;
}

// ---- Main ----
const workbook = xlsx.readFile(XLSX_PATH);
const sheet = workbook.Sheets['Import Ready'];
const rows = xlsx.utils.sheet_to_json(sheet);
console.log(`Parsed ${rows.length} rows from Import Ready sheet`);

const existingSeed = JSON.parse(fs.readFileSync(SEED_PATH, 'utf8'));
console.log(`Existing seed records: ${existingSeed.length}`);

const existingUrls = new Set(existingSeed.map((s) => (s.official_url || '').toLowerCase().trim()));
const existingTitles = new Set(existingSeed.map((s) => (s.title || s.name || '').toLowerCase().trim()));

const merged = [];
const skipped = [];

for (const row of rows) {
  const sourceId = row['Source Record ID'] || '';
  const title = row['Scholarship Title'] || '';
  const officialUrl = row['Official Application URL'] || '';
  const rawDeadline = row['Deadline'] || '';
  const rawEligibility = row['Eligibility Requirements'] || '';
  const verificationStatus = mapVerificationStatus(row['Verification Status']);

  // Deduplication check
  if (existingUrls.has(officialUrl.toLowerCase().trim())) {
    skipped.push({ sourceId, title, reason: 'Duplicate URL' });
    continue;
  }
  if (existingTitles.has(title.toLowerCase().trim())) {
    skipped.push({ sourceId, title, reason: 'Duplicate title' });
    continue;
  }

  const record = {
    id: 'int_' + sourceId.toLowerCase(),
    source_id: sourceId,
    slug: slugify(title, sourceId),
    title,
    provider: row['Provider / Organization'] || '',
    official_url: officialUrl,
    geographic_scope: 'international',
    scope: 'international',
    target_countries: ['Ghana'],
    funding_type: mapFundingType(row['Funding Type']),
    institution: row['Institution'] || null,
    institution_category: mapInstitutionCategory(row['Institution Category']),
    institution_specific: false,
    public_school_specific: false,
    host_country: row['Host Country'] || null,
    application_deadline: tryParseDate(rawDeadline),
    deadline_text: rawDeadline,
    study_levels: mapStudyLevels(row['Study Levels']),
    fields_of_study: mapFieldsOfStudy(row['Fields of Study']),
    gender_eligibility: mapGender(row['Gender Eligibility']),
    description: row['Description'] || '',
    short_description: (row['Description'] || '').substring(0, 160),
    eligibility_requirements: rawEligibility,
    eligibility_criteria: rawEligibility,
    benefits: row['Benefits / Coverage'] ? [row['Benefits / Coverage']] : [],
    required_documents: (row['Required Documents'] || '')
      .split(';')
      .map((s) => s.trim())
      .filter(Boolean),
    verification_status: verificationStatus,
    evidence_strength: row['Evidence Strength'] || null,
    research_notes: row['Research Notes'] || null,
    is_published: true,
    is_featured: false,
    is_verified: verificationStatus === 'verified',
    created_at: '2026-11-18T22:00:00.000Z',
    updated_at: '2026-11-18T22:00:00.000Z',
  };

  merged.push(record);
  existingUrls.add(officialUrl.toLowerCase().trim());
  existingTitles.add(title.toLowerCase().trim());
}

// Write merged seed
const finalSeed = [...existingSeed, ...merged];
fs.writeFileSync(SEED_PATH, JSON.stringify(finalSeed, null, 2), 'utf8');
console.log(`\n✅ Merged seed written: ${finalSeed.length} total records`);
console.log(`   Added: ${merged.length} international records`);
console.log(`   Skipped: ${skipped.length} duplicates`);
if (skipped.length > 0) {
  skipped.forEach((s) => console.log(`   ↳ [SKIP] ${s.sourceId} "${s.title}" — ${s.reason}`));
}

// Generate SQL migration
const SQL_COLS = [
  'id', 'source_id', 'slug', 'title', 'provider', 'official_url',
  'geographic_scope', 'scope', 'target_countries', 'funding_type',
  'institution', 'institution_category', 'institution_specific', 'public_school_specific',
  'host_country', 'application_deadline', 'deadline_text',
  'study_levels', 'fields_of_study', 'gender_eligibility',
  'description', 'short_description', 'eligibility_requirements', 'eligibility_criteria',
  'benefits', 'required_documents',
  'verification_status', 'evidence_strength', 'research_notes',
  'is_published', 'is_featured', 'is_verified',
  'created_at', 'updated_at',
];

let sql = `-- International Scholarship Import -- ${merged.length} records\n`;
sql += `-- Generated: ${new Date().toISOString()}\n\n`;

for (const rec of merged) {
  const cols = SQL_COLS.filter((c) => rec[c] !== undefined);
  const vals = cols.map((c) => {
    const v = rec[c];
    if (v === null || v === undefined) return 'NULL';
    if (typeof v === 'boolean') return v ? 'TRUE' : 'FALSE';
    if (Array.isArray(v)) {
      if (v.length === 0) return "ARRAY[]::text[]";
      const items = v.map((i) => `"${String(i).replace(/"/g, '\\"')}"`).join(', ');
      return `ARRAY[${items}]::text[]`;
    }
    if (c === 'created_at' || c === 'updated_at' || c === 'application_deadline') {
      if (!v) return 'NULL';
      return `'${String(v).replace(/'/g, "''")}'::timestamptz`;
    }
    return `'${String(v).replace(/'/g, "''")}'`;
  });

  sql += `INSERT INTO scholarships (${cols.join(', ')})\nVALUES (${vals.join(', ')})\nON CONFLICT (id) DO NOTHING;\n\n`;
}

// Ensure supabase/migrations dir exists
const sqlDir = path.dirname(SQL_PATH);
if (!fs.existsSync(sqlDir)) fs.mkdirSync(sqlDir, { recursive: true });
fs.writeFileSync(SQL_PATH, sql, 'utf8');
console.log(`✅ SQL migration written to: supabase/migrations/005_international_scholarships.sql`);
console.log(`   ${merged.length} INSERT statements generated`);
