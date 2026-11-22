const fs = require('fs');
const path = require('path');

const seedPath = path.join(__dirname, '..', 'src', 'data', 'scholarships_seed.json');
const seed = JSON.parse(fs.readFileSync(seedPath, 'utf8'));

let sql = '-- Migration 003: Populate 112 Ghana Scholarships Seed Data\n';
sql += '-- Auto-generated from curated source records\n\n';

for (const s of seed) {
  const escapeStr = (val) => val ? "'" + String(val).replace(/'/g, "''") + "'" : 'NULL';
  const escapeArr = (arr) => {
    if (!arr || !Array.isArray(arr) || arr.length === 0) return 'ARRAY[]::text[]';
    const items = arr.map(a => "'" + String(a).replace(/'/g, "''") + "'").join(', ');
    return 'ARRAY[' + items + ']::text[]';
  };

  const id = escapeStr(s.id);
  const title = escapeStr(s.title);
  const provider = escapeStr(s.provider);
  const institution = escapeStr(s.institution);
  const description = escapeStr(s.description);
  const officialUrl = escapeStr(s.official_url);
  const appStatus = escapeStr(s.application_status || 'open');
  const fundingType = escapeStr(s.funding_type || 'other');
  const geoScope = escapeStr(s.geographic_scope || 'local');
  const gender = escapeStr(s.gender_eligibility || 'all');
  const isVerified = s.is_verified ? 'TRUE' : 'FALSE';
  const verStatus = escapeStr(s.verification_status || 'verified');
  const instSpecific = s.institution_specific ? 'TRUE' : 'FALSE';
  const isPublic = s.is_public_institution ? 'TRUE' : 'FALSE';
  const isPublished = s.is_published !== false ? 'TRUE' : 'FALSE';
  const slug = escapeStr(s.slug);
  const deadline = escapeStr(s.application_deadline);
  const fields = escapeArr(s.fields_of_study);
  const levels = escapeArr(s.study_levels);

  sql += `INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE(${id}::uuid, gen_random_uuid()), ${title}, ${provider}, ${institution}, ${description}, ${officialUrl},
  ${appStatus}, ${fundingType}, ${geoScope}, ${gender},
  ${isVerified}, ${verStatus}, ${instSpecific}, ${isPublic},
  ${isPublished}, ${slug}, ${deadline}::date, ${fields}, ${levels}, NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;\n\n`;
}

const outPath = path.join(__dirname, '..', 'supabase', 'migrations', '003_seed_data.sql');
fs.writeFileSync(outPath, sql);
console.log('Successfully wrote', outPath, 'Bytes:', sql.length);
