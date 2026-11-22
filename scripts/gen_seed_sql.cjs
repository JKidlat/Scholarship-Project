const fs = require('fs');
const path = require('path');

const data = JSON.parse(fs.readFileSync(
  path.join(__dirname, '../src/data/scholarships_seed.json'), 'utf8'
));

function esc(val) {
  if (val === null || val === undefined) return 'NULL';
  return "'" + String(val).replace(/'/g, "''") + "'";
}

function escArr(arr) {
  if (!arr || arr.length === 0) return "ARRAY[]::text[]";
  const items = arr.map(v => "'" + String(v).replace(/'/g, "''") + "'").join(', ');
  return `ARRAY[${items}]::text[]`;
}

let sql = `-- Seed data: 112 scholarships
-- Generated automatically from src/data/scholarships_seed.json
-- Run after 001_initial_schema.sql and 002_rls_policies.sql

`;

for (const s of data) {
  const deadline = s.application_deadline ? esc(s.application_deadline) : 'NULL';
  const institution = s.institution ? esc(s.institution) : 'NULL';
  const isVerified = s.verification_status === 'verified' ? 'true' : 'false';
  const institutionSpecific = s.institution_specific ? 'true' : 'false';
  const isPublicInstitution = s.public_school_specific ? 'true' : 'false';
  const isPublished = s.is_published ? 'true' : 'false';

  sql += `INSERT INTO scholarships (id, title, provider, institution, description, official_url, application_status, funding_type, geographic_scope, gender_eligibility, is_verified, verification_status, institution_specific, is_public_institution, is_published, slug, deadline, fields_of_study, study_levels, created_at)\n`;
  sql += `VALUES (gen_random_uuid(), ${esc(s.title)}, ${esc(s.provider)}, ${institution}, ${esc(s.description)}, ${esc(s.official_url)}, ${esc(s.application_status)}, ${esc(s.funding_type)}, ${esc(s.geographic_scope)}, ${esc(s.gender_eligibility)}, ${isVerified}, 'verified', ${institutionSpecific}, ${isPublicInstitution}, ${isPublished}, ${esc(s.slug)}, ${deadline}, ${escArr(s.fields_of_study)}, ${escArr(s.study_levels)}, NOW())\n`;
  sql += `ON CONFLICT (slug) DO NOTHING;\n\n`;
}

fs.writeFileSync(
  path.join(__dirname, '../supabase/migrations/003_seed_data.sql'),
  sql,
  'utf8'
);
console.log('Generated supabase/migrations/003_seed_data.sql with', data.length, 'records');
