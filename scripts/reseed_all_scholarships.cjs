/**
 * scripts/reseed_all_scholarships.cjs
 * Accurately merges all 112 local scholarships + all 50 international scholarships (INT001-INT050)
 * Total: exactly 162 scholarships.
 * Also generates supabase/migrations/005_international_scholarships.sql with 50 INSERT statements.
 */
const xlsx = require('xlsx');
const fs = require('fs');
const path = require('path');

const XLSX_PATH = 'C:/Users/PY TECH/.gemini/antigravity/brain/6cbc374d-31fe-49b9-b643-8f55ec9a8ad2/.user_uploaded/media_1795040861746_3d86ae79.xlsx';
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
  if (r.includes('grant') || r.includes('fellowship')) return 'grant';
  if (r.includes('bursary')) return 'bursary';
  if (r.includes('research')) return 'fellowship';
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
  if (!raw) return ['undergraduate'];
  const parts = raw.split(/[\/,]/).map((s) => s.trim().toLowerCase());
  const levels = parts.map((p) => {
    if (p.includes('master') || p.includes('postgraduate') || p === 'msc' || p === 'ma' || p === 'mba') return 'masters';
    if (p.includes('phd') || p.includes('doctoral') || p.includes('dphil') || p.includes('doctorate')) return 'phd';
    if (p.includes('bachelor') || p.includes('undergraduate') || p === 'bsc' || p === 'ba' || p === 'beng') return 'undergraduate';
    if (p.includes('diploma') || p.includes('technical') || p.includes('vocational') || p.includes('hnd')) return 'diploma';
    if (p.includes('research')) return 'postdoctoral';
    if (p.includes('shs') || p.includes('secondary') || p.includes('high school')) return 'shs';
    if (p.includes('honours')) return 'masters';
    if (p.includes('exchange') || p.includes('non-degree')) return 'undergraduate';
    return 'other';
  });
  return [...new Set(levels)];
}

function mapGender(raw) {
  if (!raw) return 'all';
  const r = raw.toLowerCase();
  if (r.includes('women only') || r.includes('female only')) return 'women';
  if (r.includes('women encouraged') || r.includes('women priority')) return 'women_priority';
  return 'all';
}

function mapApplicationStatus(deadlineRaw, verificationStatus) {
  const d = (deadlineRaw || '').toLowerCase();
  if (d.includes('closed') || d.includes('cycle closed')) return 'closed';
  if (d.includes('rolling')) return 'rolling';
  if (d.includes('upcoming') || d.includes('pending') || d.includes('to confirm') || d.includes('to reconfirm')) return 'upcoming';
  if (d.includes('annual') && !d.includes('closed')) return 'open';
  if (d.includes('2027') || d.includes('2026')) return 'open';
  return 'open';
}

function tryParseDate(raw) {
  if (!raw) return null;
  if (/annual|cycle|variable|rolling|tba|tbc|closed|pending|ongoing|various|not|check|verify|to reconfirm|notice/i.test(raw)) return null;
  // Match DD Month YYYY or Month DD YYYY
  try {
    const d = new Date(raw);
    if (!isNaN(d.getTime()) && d.getFullYear() >= 2024 && d.getFullYear() <= 2030) {
      return d.toISOString().split('T')[0];
    }
  } catch (e) {}
  return null;
}

// 1. Read existing local scholarships (GH001-GH112)
const existingSeed = JSON.parse(fs.readFileSync(SEED_PATH, 'utf8'));
const localScholarships = existingSeed.filter((s) => {
  const scope = s.geographic_scope || s.scope || 'local';
  const isIntlId = String(s.source_id || '').startsWith('INT') || String(s.id || '').startsWith('int_') || String(s.id || '').startsWith('sch_int');
  return scope === 'local' && !isIntlId;
});
console.log(`Retained ${localScholarships.length} local Ghanaian scholarships.`);

// 2. Read the 50 international records from XLSX
const wb = xlsx.readFile(XLSX_PATH);
const sheet = wb.Sheets['Import Ready'];
const rows = xlsx.utils.sheet_to_json(sheet);
console.log(`Parsed ${rows.length} international rows from spreadsheet.`);

const internationalScholarships = [];

for (const row of rows) {
  const sourceId = String(row['Source Record ID'] || '').trim();
  const title = String(row['Scholarship Title'] || '').trim();
  const provider = String(row['Provider / Organization'] || '').trim();
  const officialUrl = String(row['Official Application URL'] || '').trim();
  const hostCountry = String(row['Host Country'] || 'Various').trim();
  const deadlineRaw = String(row['Deadline'] || '').trim();
  const verificationRaw = String(row['Verification Status'] || '').trim();
  const isVerified = verificationRaw.toLowerCase().includes('confirmed');

  const record = {
    id: `sch_${sourceId.toLowerCase()}`,
    source_id: sourceId,
    slug: slugify(title, sourceId),
    title,
    name: title,
    provider,
    official_url: officialUrl,
    geographic_scope: 'international',
    scope: 'international',
    target_countries: ['Ghana'],
    funding_type: mapFundingType(row['Funding Type']),
    institution: row['Institution'] ? String(row['Institution']).trim() : null,
    institution_category: mapInstitutionCategory(row['Institution Category']),
    institution_specific: false,
    public_school_specific: false,
    host_country: hostCountry,
    study_levels: mapStudyLevels(row['Study Levels']),
    fields_of_study: row['Fields of Study']
      ? row['Fields of Study'].split(',').map((s) => s.trim()).slice(0, 5)
      : ['All Fields'],
    gender_eligibility: mapGender(row['Gender Eligibility']),
    application_status: mapApplicationStatus(deadlineRaw, verificationRaw),
    status: mapApplicationStatus(deadlineRaw, verificationRaw),
    application_deadline: tryParseDate(deadlineRaw),
    deadline: tryParseDate(deadlineRaw),
    deadline_text: deadlineRaw,
    description: String(row['Description'] || '').trim(),
    short_description: String(row['Description'] || '').trim().substring(0, 160),
    eligibility_requirements: String(row['Eligibility Requirements'] || '').trim(),
    eligibility_criteria: String(row['Eligibility Requirements'] || '').trim(),
    benefits: row['Benefits / Coverage'] ? [String(row['Benefits / Coverage']).trim()] : [],
    required_documents: row['Required Documents']
      ? String(row['Required Documents']).split(';').map((s) => s.trim()).filter(Boolean)
      : [],
    verification_status: isVerified ? 'verified' : 'needs_verification',
    evidence_strength: String(row['Evidence Strength'] || 'High').trim(),
    research_notes: String(row['Research Notes'] || '').trim(),
    is_published: true,
    is_featured: false,
    is_verified: isVerified,
    created_at: '2026-11-18T22:00:00.000Z',
    updated_at: '2026-11-18T22:00:00.000Z',
  };

  internationalScholarships.push(record);
}

console.log(`Mapped ${internationalScholarships.length} international scholarships.`);

// 3. Combine into final seed: 112 local + 50 international = 162 total
const allScholarships = [...localScholarships, ...internationalScholarships];
console.log(`Total combined scholarships: ${allScholarships.length}`);

fs.writeFileSync(SEED_PATH, JSON.stringify(allScholarships, null, 2), 'utf8');
console.log(`✅ Saved ${allScholarships.length} scholarships to ${SEED_PATH}`);

// 4. Generate SQL migration 005_international_scholarships.sql
let sql = `-- ============================================================\n`;
sql += `-- GHANA SCHOLARSHIP PORTAL — INTERNATIONAL SCHOLARSHIPS SEED\n`;
sql += `-- Migration: 005_international_scholarships.sql\n`;
sql += `-- Total Records: ${internationalScholarships.length} International Scholarships (INT001 - INT050)\n`;
sql += `-- Generated: ${new Date().toISOString()}\n`;
sql += `-- ============================================================\n\n`;

for (const s of internationalScholarships) {
  const escStr = (val) => (val ? `'${String(val).replace(/'/g, "''")}'` : 'NULL');
  const escArr = (arr) => {
    if (!arr || arr.length === 0) return 'ARRAY[]::text[]';
    const items = arr.map((item) => `"${String(item).replace(/"/g, '\\"')}"`).join(', ');
    return `ARRAY[${items}]::text[]`;
  };

  sql += `INSERT INTO scholarships (\n`;
  sql += `  id, title, provider, institution, description, official_url,\n`;
  sql += `  application_status, funding_type, geographic_scope, gender_eligibility,\n`;
  sql += `  is_verified, verification_status, institution_specific, is_public_institution,\n`;
  sql += `  is_published, slug, application_deadline, fields_of_study, study_levels,\n`;
  sql += `  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at\n`;
  sql += `) VALUES (\n`;
  sql += `  COALESCE(NULLIF('${s.id}', ''), gen_random_uuid()::text)::uuid, ${escStr(s.title)}, ${escStr(s.provider)}, ${escStr(s.institution)}, ${escStr(s.description)}, ${escStr(s.official_url)},\n`;
  sql += `  '${s.application_status}', '${s.funding_type}', 'international', '${s.gender_eligibility}',\n`;
  sql += `  ${s.is_verified ? 'TRUE' : 'FALSE'}, '${s.verification_status}', FALSE, FALSE,\n`;
  sql += `  TRUE, ${escStr(s.slug)}, ${s.application_deadline ? `'${s.application_deadline}'::date` : 'NULL::date'}, ${escArr(s.fields_of_study)}, ${escArr(s.study_levels)},\n`;
  sql += `  ${escStr(s.host_country)}, ${escStr(s.deadline_text)}, ${escStr(s.eligibility_requirements)}, ${escArr(s.benefits)}, ${escArr(s.required_documents)}, NOW()\n`;
  sql += `) ON CONFLICT (slug) DO UPDATE SET\n`;
  sql += `  title = EXCLUDED.title,\n`;
  sql += `  provider = EXCLUDED.provider,\n`;
  sql += `  institution = EXCLUDED.institution,\n`;
  sql += `  description = EXCLUDED.description,\n`;
  sql += `  official_url = EXCLUDED.official_url,\n`;
  sql += `  application_status = EXCLUDED.application_status,\n`;
  sql += `  funding_type = EXCLUDED.funding_type,\n`;
  sql += `  geographic_scope = EXCLUDED.geographic_scope,\n`;
  sql += `  host_country = EXCLUDED.host_country,\n`;
  sql += `  deadline_text = EXCLUDED.deadline_text,\n`;
  sql += `  study_levels = EXCLUDED.study_levels,\n`;
  sql += `  fields_of_study = EXCLUDED.fields_of_study,\n`;
  sql += `  is_published = EXCLUDED.is_published;\n\n`;
}

fs.writeFileSync(SQL_PATH, sql, 'utf8');
console.log(`✅ Saved ${internationalScholarships.length} SQL insert statements to ${SQL_PATH}`);
