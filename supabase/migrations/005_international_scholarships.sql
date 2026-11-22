-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — INTERNATIONAL SCHOLARSHIPS SEED
-- Migration: 005_international_scholarships.sql
-- Total Records: 50 Scholarships
-- Schema: 100% Normalized & Aligned with 001_initial_schema.sql
-- ============================================================

-- Ensure prerequisites exist for international seeding
INSERT INTO countries (name, code, flag_emoji) VALUES
  ('Switzerland', 'CH', '🇨🇭'),
  ('Hungary', 'HU', '🇭🇺'),
  ('Italy', 'IT', '🇮🇹'),
  ('Cyprus', 'CY', '🇨🇾'),
  ('Serbia', 'RS', '🇷🇸'),
  ('Mauritius', 'MU', '🇲🇺'),
  ('Brazil', 'BR', '🇧🇷')
ON CONFLICT (code) DO NOTHING;

CREATE UNIQUE INDEX IF NOT EXISTS idx_scholarship_providers_name ON scholarship_providers (name);
CREATE UNIQUE INDEX IF NOT EXISTS idx_institutions_name ON institutions (name);
ALTER TABLE scholarships ADD COLUMN IF NOT EXISTS deadline_text TEXT;

-- ------------------------------------------------------------
-- 1. SEED SCHOLARSHIP PROVIDERS (42 Unique Providers)
-- ------------------------------------------------------------
INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'UK Foreign, Commonwealth & Development Office',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Commonwealth Scholarship Commission / UK universities',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Commonwealth Scholarship Commission',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Oxford',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Rhodes Trust',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Oxford / Clarendon Fund',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Weidenfeld-Hoffmann Trust / University of Oxford',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Felix Scholarship Trust',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Cambridge Trust',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Mastercard Foundation / University of Cambridge',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Glasgow',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Bristol',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Kent / British Council',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Exeter',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of York',
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'U.S. Department of State / U.S. Embassy Ghana',
  (SELECT id FROM countries WHERE code = 'US' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'World Bank / Government of Japan',
  (SELECT id FROM countries WHERE code = 'JP' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Mastercard Foundation / McGill University',
  (SELECT id FROM countries WHERE code = 'CA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Mastercard Foundation / University of Toronto',
  (SELECT id FROM countries WHERE code = 'CA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Toronto',
  (SELECT id FROM countries WHERE code = 'CA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of British Columbia',
  (SELECT id FROM countries WHERE code = 'CA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Swiss Federal Commission for Scholarships for Foreign Students',
  (SELECT id FROM countries WHERE code = 'CH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Government of Hungary / Tempus Public Foundation',
  (SELECT id FROM countries WHERE code = 'HU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Italian Ministry of Foreign Affairs and International Cooperation',
  (SELECT id FROM countries WHERE code = 'IT' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'German Academic Exchange Service (DAAD)',
  (SELECT id FROM countries WHERE code = 'DE' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'European Commission / participating consortia',
  (SELECT id FROM countries WHERE code = 'OT' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Uppsala University',
  (SELECT id FROM countries WHERE code = 'SE' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Uppsala University / Anders Wall Foundation',
  (SELECT id FROM countries WHERE code = 'SE' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Government of Cyprus / University of Nicosia',
  (SELECT id FROM countries WHERE code = 'CY' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Government of Serbia',
  (SELECT id FROM countries WHERE code = 'RS' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'China Scholarship Council / Ghana Scholarships Authority',
  (SELECT id FROM countries WHERE code = 'CN' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'UNESCO / Government of China',
  (SELECT id FROM countries WHERE code = 'CN' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Government of Japan / MEXT',
  (SELECT id FROM countries WHERE code = 'JP' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Australian Government Department of Foreign Affairs and Trade',
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Monash University',
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Melbourne',
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Adelaide University',
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Sydney',
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Mandela Rhodes Foundation',
  (SELECT id FROM countries WHERE code = 'ZA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Government of Mauritius / Ghana Scholarships Authority',
  (SELECT id FROM countries WHERE code = 'MU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Government of Brazil / Ministry of Foreign Affairs',
  (SELECT id FROM countries WHERE code = 'BR' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'CAPES / Government of Brazil',
  (SELECT id FROM countries WHERE code = 'BR' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

-- ------------------------------------------------------------
-- 2. SEED INSTITUTIONS (36 Unique Institutions)
-- ------------------------------------------------------------
INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating UK universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating UK universities and approved courses',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Nominating UK universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Oxford',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Oxford, University of Reading and SOAS',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Cambridge',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Glasgow',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Bristol',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Kent',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Exeter',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of York',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GB' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating U.S. universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'US' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating universities in Japan and other partner locations',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'JP' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'McGill University',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'CA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Toronto',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'CA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of British Columbia',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'CA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Swiss higher education and research institutions',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'CH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating Hungarian universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'HU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating Italian universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'IT' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating German universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'DE' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Joint master consortia across Europe',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'OT' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Uppsala University',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'SE' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Nicosia / designated Cyprus institution',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'CY' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Accredited public universities in Serbia',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'RS' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating Chinese universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'CN' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Japanese universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'JP' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Japanese colleges of technology',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'JP' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Japanese specialised training colleges',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'JP' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating Australian universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Monash University',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Melbourne',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Adelaide University',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Sydney',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'AU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating South African universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'ZA' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Public higher education institutions in Mauritius',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'MU' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Participating Brazilian universities',
  'foreign_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'BR' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

-- ------------------------------------------------------------
-- 3. SEED SCHOLARSHIPS (50 Records)
-- ------------------------------------------------------------
-- [1/50] Chevening Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'chevening-scholarships-int001',
  'Chevening Scholarships',
  'Chevening Scholarships supports eligible international applicants to study in United Kingdom. Official Ghana country page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Ghana country page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'UK Foreign, Commonwealth & Development Office' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating UK universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghana country page confirms Ghana applicants; work experience and return-home commitment apply',
  ARRAY['Tuition, living stipend, travel and eligible allowances']::text[],
  ARRAY['Official application form', 'Ghanaian passport/ID', 'academic certificates and transcripts', 'CV', 'references', 'admission/course evidence where required', 'personal statement/study plan', 'other documents in the country-specific call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; 2027/28 cycle closed',
  'https://www.chevening.org/scholarship/ghana/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'chevening-scholarships-int001'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'chevening-scholarships-int001'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'chevening-scholarships-int001'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [2/50] Commonwealth Shared Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'commonwealth-shared-scholarships-int002',
  'Commonwealth Shared Scholarships',
  'Commonwealth Shared Scholarships supports eligible international applicants to study in United Kingdom. Official CSC eligible-country list and current call. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official CSC eligible-country list and current call. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Commonwealth Scholarship Commission / UK universities' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating UK universities and approved courses' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghana is explicitly listed among eligible Commonwealth countries; apply to participating courses/universities',
  ARRAY['Tuition, approved fares, living stipend and allowances per CSC terms']::text[],
  ARRAY['Official application form', 'Ghanaian passport/ID', 'academic certificates and transcripts', 'CV', 'references', 'admission/course evidence where required', 'personal statement/study plan', 'other documents in the country-specific call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  '2027/28 closes 8 Dec 2026',
  'https://cscuk.fcdo.gov.uk/scholarships/commonwealth-shared-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'commonwealth-shared-scholarships-int002'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('social-sciences') WHERE s.slug = 'commonwealth-shared-scholarships-int002'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'commonwealth-shared-scholarships-int002'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [3/50] Commonwealth Master’s Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'commonwealth-master-s-scholarships-int003',
  'Commonwealth Master’s Scholarships',
  'Commonwealth Master’s Scholarships supports eligible international applicants to study in United Kingdom. Official CSC programme page; country/call conditions apply. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official CSC programme page; country/call conditions apply. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Commonwealth Scholarship Commission' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Nominating UK universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian citizens resident in Ghana may be eligible subject to annual CSC criteria and nomination route',
  ARRAY['Tuition, airfare, living allowance and other approved allowances']::text[],
  ARRAY['Official application form', 'Ghanaian passport/ID', 'academic certificates and transcripts', 'CV', 'references', 'admission/course evidence where required', 'personal statement/study plan', 'other documents in the country-specific call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; check 2027/28 call',
  'https://cscuk.fcdo.gov.uk/scholarships/commonwealth-masters-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'commonwealth-master-s-scholarships-int003'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('social-sciences') WHERE s.slug = 'commonwealth-master-s-scholarships-int003'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'commonwealth-master-s-scholarships-int003'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [4/50] Reach Oxford Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'reach-oxford-scholarship-int004',
  'Reach Oxford Scholarship',
  'Reach Oxford Scholarship supports eligible international applicants to study in United Kingdom. Official Oxford eligibility page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Oxford eligibility page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Oxford' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Oxford' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Applicants must be from low-income countries where studying locally is unavailable or politically/economically difficult; Ghana eligibility must be assessed against current criteria',
  ARRAY['Course fees, living costs grant and one return airfare per year']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; 2027 entry deadline 27 Jan 2027',
  'https://www.ox.ac.uk/admissions/undergraduate/fees-and-funding/oxford-bursaries-and-scholarships/reach-oxford',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'reach-oxford-scholarship-int004'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'reach-oxford-scholarship-int004'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'reach-oxford-scholarship-int004'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [5/50] Rhodes Scholarship for West Africa
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'rhodes-scholarship-for-west-africa-int005',
  'Rhodes Scholarship for West Africa',
  'Rhodes Scholarship for West Africa supports eligible international applicants to study in United Kingdom. Official Rhodes constituency page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Rhodes constituency page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'upcoming'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Rhodes Trust' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Oxford' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'West Africa constituency includes Ghana; age, academic and leadership criteria apply',
  ARRAY['Oxford fees, stipend, settling-in allowance and travel']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; next cycle dates to confirm',
  'https://www.rhodeshouse.ox.ac.uk/scholarships/applications/west-africa/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'rhodes-scholarship-for-west-africa-int005'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'rhodes-scholarship-for-west-africa-int005'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'rhodes-scholarship-for-west-africa-int005'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [6/50] Clarendon Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'clarendon-scholarship-int006',
  'Clarendon Scholarship',
  'Clarendon Scholarship supports eligible international applicants to study in United Kingdom. Official Oxford funding page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Oxford funding page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Oxford / Clarendon Fund' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Oxford' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Open to applicants of all nationalities, including Ghanaian applicants; apply by course funding deadline',
  ARRAY['Full course fees and living-cost grant']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Course-specific Dec/Jan deadlines',
  'https://www.ox.ac.uk/admissions/graduate/fees-and-funding/funding/clarendon/applicants',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'clarendon-scholarship-int006'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'clarendon-scholarship-int006'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'clarendon-scholarship-int006'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [7/50] Weidenfeld-Hoffmann Scholarships and Leadership Programme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'weidenfeld-hoffmann-scholarships-and-leadership-programme-int007',
  'Weidenfeld-Hoffmann Scholarships and Leadership Programme',
  'Weidenfeld-Hoffmann Scholarships and Leadership Programme supports eligible international applicants to study in United Kingdom. Official Oxford scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Oxford scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Weidenfeld-Hoffmann Trust / University of Oxford' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Oxford' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghana is among eligible countries; only listed courses and leadership programme applicants qualify',
  ARRAY['100% course fees and living-cost grant; leadership programme']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Course-specific annual deadlines',
  'https://www.ox.ac.uk/admissions/graduate/fees-and-funding/fees-funding-and-scholarship-search/weidenfeld-hoffmann-scholarships-and-leadership-programme',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'weidenfeld-hoffmann-scholarships-and-leadership-programme-int007'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'weidenfeld-hoffmann-scholarships-and-leadership-programme-int007'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'weidenfeld-hoffmann-scholarships-and-leadership-programme-int007'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [8/50] Felix Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'felix-scholarship-int008',
  'Felix Scholarship',
  'Felix Scholarship supports eligible international applicants to study in United Kingdom. Official Felix Trust; country/course conditions. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Felix Trust; country/course conditions. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Felix Scholarship Trust' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Oxford, University of Reading and SOAS' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Open to citizens of eligible developing countries; Ghana eligibility and participating institution/course must be checked for the cycle',
  ARRAY['Tuition, living stipend and return airfare subject to trust rules']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; check trust and university deadlines',
  'https://www.felixscholarship.org/about/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'felix-scholarship-int008'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'felix-scholarship-int008'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'felix-scholarship-int008'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [9/50] Cambridge Trust postgraduate scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'cambridge-trust-postgraduate-scholarships-int009',
  'Cambridge Trust postgraduate scholarships',
  'Cambridge Trust postgraduate scholarships supports eligible international applicants to study in United Kingdom. Official Cambridge Trust scholarships directory. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Cambridge Trust scholarships directory. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Cambridge Trust' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cambridge' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International applicants, including Ghanaians, may apply; award type and eligibility vary by scheme',
  ARRAY['Full or partial fees and maintenance depending on award']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Course-specific annual deadlines',
  'https://www.cambridgetrust.org/scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'cambridge-trust-postgraduate-scholarships-int009'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'cambridge-trust-postgraduate-scholarships-int009'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'cambridge-trust-postgraduate-scholarships-int009'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [10/50] Mastercard Foundation Scholars Program at Cambridge
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mastercard-foundation-scholars-program-at-cambridge-int010',
  'Mastercard Foundation Scholars Program at Cambridge',
  'Mastercard Foundation Scholars Program at Cambridge supports eligible international applicants to study in United Kingdom. Official Cambridge programme page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Cambridge programme page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Mastercard Foundation / University of Cambridge' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cambridge' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'African applicants including Ghanaians; programme, work/leadership and financial-need criteria apply',
  ARRAY['Tuition, living costs, travel and support per programme terms']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; programme-specific',
  'https://www.mastercardfoundation.fund.cam.ac.uk/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'mastercard-foundation-scholars-program-at-cambridge-int010'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it', 'environmental-studies') WHERE s.slug = 'mastercard-foundation-scholars-program-at-cambridge-int010'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'mastercard-foundation-scholars-program-at-cambridge-int010'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [11/50] University of Glasgow African Excellence Award
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'university-of-glasgow-african-excellence-award-int011',
  'University of Glasgow African Excellence Award',
  'University of Glasgow African Excellence Award supports eligible international applicants to study in United Kingdom. Official Glasgow award page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Glasgow award page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Glasgow' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Glasgow' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'African-domiciled applicants including Ghana; eligible course and offer required',
  ARRAY['Tuition fee discount; does not cover all living/visa costs']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; check 2027 entry call',
  'https://www.gla.ac.uk/scholarships/universityofglasgowafricanexcellenceaward/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'university-of-glasgow-african-excellence-award-int011'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'university-of-glasgow-african-excellence-award-int011'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'university-of-glasgow-african-excellence-award-int011'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [12/50] University of Bristol Think Big Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'university-of-bristol-think-big-scholarships-int012',
  'University of Bristol Think Big Scholarships',
  'University of Bristol Think Big Scholarships supports eligible international applicants to study in United Kingdom. Official Bristol scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Bristol scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Bristol' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Bristol' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International fee-paying applicants including Ghanaian students; course exclusions apply',
  ARRAY['Tuition fee awards; values vary by level and year']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; check 2027 entry deadline',
  'https://www.bristol.ac.uk/students/support/finances/scholarships/think-big-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('masters'::study_level)) AS v(level) WHERE s.slug = 'university-of-bristol-think-big-scholarships-int012'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'university-of-bristol-think-big-scholarships-int012'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'university-of-bristol-think-big-scholarships-int012'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [13/50] GREAT Scholarship for Ghanaian Students at University of Kent
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'great-scholarship-for-ghanaian-students-at-university-of-kent-int013',
  'GREAT Scholarship for Ghanaian Students at University of Kent',
  'GREAT Scholarship for Ghanaian Students at University of Kent supports eligible international applicants to study in United Kingdom. Official Kent award page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Kent award page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Kent / British Council' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Kent' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian applicants are explicitly targeted; offer and course conditions apply',
  ARRAY['£10,000 tuition contribution (cycle-specific)']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  '2027 cycle deadline 23 Apr 2027',
  'https://www.kent.ac.uk/scholarships/search/FNADGGPNTT01',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'great-scholarship-for-ghanaian-students-at-university-of-kent-int013'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'great-scholarship-for-ghanaian-students-at-university-of-kent-int013'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'great-scholarship-for-ghanaian-students-at-university-of-kent-int013'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [14/50] University of Exeter Postgraduate Taught Scholarship for Ghana
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'university-of-exeter-postgraduate-taught-scholarship-for-ghana-int014',
  'University of Exeter Postgraduate Taught Scholarship for Ghana',
  'University of Exeter Postgraduate Taught Scholarship for Ghana supports eligible international applicants to study in United Kingdom. Official Exeter award page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official Exeter award page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Exeter' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Exeter' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian citizen/passport holder classified as international fee payer with eligible 2027/28 offer',
  ARRAY['£10,000 first-year tuition reduction']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  '2027-08-31'::date,
  'fixed'::deadline_type,
  '31 Aug 2027',
  'https://www.exeter.ac.uk/study/funding/award/?id=5963',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'university-of-exeter-postgraduate-taught-scholarship-for-ghana-int014'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'university-of-exeter-postgraduate-taught-scholarship-for-ghana-int014'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'university-of-exeter-postgraduate-taught-scholarship-for-ghana-int014'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [15/50] York International Masters Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'york-international-masters-scholarship-int015',
  'York International Masters Scholarship',
  'York International Masters Scholarship supports eligible international applicants to study in United Kingdom. Official York scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official York scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of York' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of York' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International fee-paying applicants including Ghanaian students; exclusions apply',
  ARRAY['£8,000 tuition fee reduction (published 2027/28 terms)']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Course/award-specific',
  'https://www.york.ac.uk/study/postgraduate-taught/funding/international/york-international-masters-scholarship/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'york-international-masters-scholarship-int015'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'york-international-masters-scholarship-int015'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'york-international-masters-scholarship-int015'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [16/50] York International Undergraduate Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'york-international-undergraduate-scholarship-int016',
  'York International Undergraduate Scholarship',
  'York International Undergraduate Scholarship supports eligible international applicants to study in United Kingdom. Official York scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official York scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of York' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of York' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International fee-paying applicants including Ghanaians; exclusions apply',
  ARRAY['£5,000 per year subject to published terms']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Course/award-specific',
  'https://www.york.ac.uk/study/undergraduate/fees-funding/international/scholarships/york-international-ug-scholarship/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'york-international-undergraduate-scholarship-int016'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'york-international-undergraduate-scholarship-int016'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'york-international-undergraduate-scholarship-int016'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [17/50] York Global Impact Masters Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'york-global-impact-masters-scholarship-int017',
  'York Global Impact Masters Scholarship',
  'York Global Impact Masters Scholarship supports eligible international applicants to study in United Kingdom. Official York scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: United Kingdom. Official York scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of York' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of York' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International applicants including Ghanaians; check renewal and current intake status',
  ARRAY['Tuition contribution as specified in current call']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; renewal/current cycle to verify',
  'https://www.york.ac.uk/study/postgraduate-taught/funding/international/global-impact-masters-scholarship/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'york-global-impact-masters-scholarship-int017'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'york-global-impact-masters-scholarship-int017'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GB' WHERE s.slug = 'york-global-impact-masters-scholarship-int017'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [18/50] Fulbright Foreign Student Program (Ghana)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'fulbright-foreign-student-program-ghana-int018',
  'Fulbright Foreign Student Program (Ghana)',
  'Fulbright Foreign Student Program (Ghana) supports eligible international applicants to study in United States. Official U.S. Embassy Ghana page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: North America. Official U.S. Embassy Ghana page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'U.S. Department of State / U.S. Embassy Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating U.S. universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian citizens apply through the Ghana-specific Fulbright competition; annual field and work-experience criteria apply',
  ARRAY['Tuition, living stipend, travel and health coverage per award terms']::text[],
  ARRAY['Official application form', 'Ghanaian passport/ID', 'academic certificates and transcripts', 'CV', 'references', 'admission/course evidence where required', 'personal statement/study plan', 'other documents in the country-specific call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; Ghana call-specific',
  'https://gh.usembassy.gov/education-culture/fulbright-program/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'fulbright-foreign-student-program-ghana-int018'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'fulbright-foreign-student-program-ghana-int018'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'US' WHERE s.slug = 'fulbright-foreign-student-program-ghana-int018'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [19/50] Joint Japan/World Bank Graduate Scholarship Program
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'joint-japan-world-bank-graduate-scholarship-program-int019',
  'Joint Japan/World Bank Graduate Scholarship Program',
  'Joint Japan/World Bank Graduate Scholarship Program supports eligible international applicants to study in Japan / participating countries. Official World Bank programme page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Multi-country programmes. Official World Bank programme page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'World Bank / Government of Japan' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating universities in Japan and other partner locations' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghana is an eligible developing-country nationality; applicants need relevant professional experience and admission to a participating programme',
  ARRAY['Tuition, monthly living stipend, travel, health insurance and travel allowance']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  '2027 call; 27 Feb 2027 (verify round)',
  'https://www.worldbank.org/en/programs/scholarships/jj-wbgsp',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'joint-japan-world-bank-graduate-scholarship-program-int019'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('social-sciences', 'arts-humanities') WHERE s.slug = 'joint-japan-world-bank-graduate-scholarship-program-int019'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'JP' WHERE s.slug = 'joint-japan-world-bank-graduate-scholarship-program-int019'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [20/50] Mastercard Foundation Scholars Program at McGill
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mastercard-foundation-scholars-program-at-mcgill-int020',
  'Mastercard Foundation Scholars Program at McGill',
  'Mastercard Foundation Scholars Program at McGill supports eligible international applicants to study in Canada. Official McGill eligibility page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: North America. Official McGill eligibility page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Mastercard Foundation / McGill University' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'McGill University' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'African citizens including Ghanaians; only specified programmes and applicant profile qualify',
  ARRAY['Tuition, living support, travel and academic support subject to programme terms']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; check current cohort',
  'https://www.mcgill.ca/mastercardfdn-scholars/apply/eligibility',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'mastercard-foundation-scholars-program-at-mcgill-int020'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'mastercard-foundation-scholars-program-at-mcgill-int020'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CA' WHERE s.slug = 'mastercard-foundation-scholars-program-at-mcgill-int020'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [21/50] Mastercard Foundation Scholars Program at University of Toronto
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mastercard-foundation-scholars-program-at-university-of-toronto-int021',
  'Mastercard Foundation Scholars Program at University of Toronto',
  'Mastercard Foundation Scholars Program at University of Toronto supports eligible international applicants to study in Canada. Official Mastercard Foundation partner page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: North America. Official Mastercard Foundation partner page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Mastercard Foundation / University of Toronto' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Toronto' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'African applicants including Ghanaians; verify eligible programme and cohort availability',
  ARRAY['Tuition and comprehensive scholar support per partner terms']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; programme-specific',
  'https://mastercardfdn.org/en/what-we-do/our-programs/mastercard-foundation-scholars-program/where-to-apply/university-of-toronto-u-of-t/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'mastercard-foundation-scholars-program-at-university-of-toronto-int021'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other', 'medicine-health-sciences') WHERE s.slug = 'mastercard-foundation-scholars-program-at-university-of-toronto-int021'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CA' WHERE s.slug = 'mastercard-foundation-scholars-program-at-university-of-toronto-int021'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [22/50] Lester B. Pearson International Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'lester-b-pearson-international-scholarship-int022',
  'Lester B. Pearson International Scholarship',
  'Lester B. Pearson International Scholarship supports eligible international applicants to study in Canada. Official University of Toronto page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: North America. Official University of Toronto page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Toronto' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Toronto' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International students including Ghanaians; secondary school nomination required',
  ARRAY['Tuition, books, incidental fees and full residence support for four years']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; school nomination deadlines precede admission',
  'https://future.utoronto.ca/pearson/about/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'lester-b-pearson-international-scholarship-int022'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'lester-b-pearson-international-scholarship-int022'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CA' WHERE s.slug = 'lester-b-pearson-international-scholarship-int022'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [23/50] UBC International Scholars Program
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ubc-international-scholars-program-int023',
  'UBC International Scholars Program',
  'UBC International Scholars Program supports eligible international applicants to study in Canada. Official UBC programme page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: North America. Official UBC programme page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of British Columbia' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of British Columbia' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International applicants including Ghanaians; school nomination, financial need and leadership required',
  ARRAY['Award based on demonstrated financial need, up to cost of study']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; nomination deadline applies',
  'https://you.ubc.ca/financial-planning/scholarships-awards-international-students/international-scholars/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ubc-international-scholars-program-int023'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ubc-international-scholars-program-int023'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CA' WHERE s.slug = 'ubc-international-scholars-program-int023'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [24/50] UBC International Major Entrance Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ubc-international-major-entrance-scholarship-int024',
  'UBC International Major Entrance Scholarship',
  'UBC International Major Entrance Scholarship supports eligible international applicants to study in Canada. Official UBC international awards page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: North America. Official UBC international awards page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'tuition_only'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of British Columbia' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of British Columbia' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Outstanding international applicants including Ghanaians; admission-based consideration',
  ARRAY['Renewable award; amount varies by year']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Automatic/annual admission cycle',
  'https://you.ubc.ca/financial-planning/scholarships-awards-international-students/international-entrance-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ubc-international-major-entrance-scholarship-int024'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ubc-international-major-entrance-scholarship-int024'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CA' WHERE s.slug = 'ubc-international-major-entrance-scholarship-int024'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [25/50] UBC Outstanding International Student Award
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ubc-outstanding-international-student-award-int025',
  'UBC Outstanding International Student Award',
  'UBC Outstanding International Student Award supports eligible international applicants to study in Canada. Official UBC international awards page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: North America. Official UBC international awards page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of British Columbia' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of British Columbia' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International applicants including Ghanaian students; assessed at admission',
  ARRAY['One-time entrance award; amount varies']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Automatic/annual admission cycle',
  'https://you.ubc.ca/financial-planning/scholarships-awards-international-students/international-entrance-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ubc-outstanding-international-student-award-int025'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ubc-outstanding-international-student-award-int025'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CA' WHERE s.slug = 'ubc-outstanding-international-student-award-int025'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [26/50] Swiss Government Excellence Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'swiss-government-excellence-scholarships-int026',
  'Swiss Government Excellence Scholarships',
  'Swiss Government Excellence Scholarships supports eligible international applicants to study in Switzerland. Official Swiss government page; country-specific call essential. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official Swiss government page; country-specific call essential. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fellowship'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Swiss Federal Commission for Scholarships for Foreign Students' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Swiss higher education and research institutions' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Country-specific nomination; Ghanaian applicants must confirm that the relevant award type is offered to Ghana in the current call',
  ARRAY['Stipend and other benefits depend on award category']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; embassy nomination calendar',
  'https://www.sbfi.admin.ch/en/swiss-government-excellence-scholarships',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('postdoctoral'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'swiss-government-excellence-scholarships-int026'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'swiss-government-excellence-scholarships-int026'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CH' WHERE s.slug = 'swiss-government-excellence-scholarships-int026'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [27/50] Stipendium Hungaricum Scholarship Programme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'stipendium-hungaricum-scholarship-programme-int027',
  'Stipendium Hungaricum Scholarship Programme',
  'Stipendium Hungaricum Scholarship Programme supports eligible international applicants to study in Hungary. Official programme portal. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official programme portal. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Hungary / Tempus Public Foundation' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating Hungarian universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Applicants must apply through a sending partner with a valid Ghana allocation; confirm Ghana bilateral quota for the cycle',
  ARRAY['Tuition-free study, stipend, accommodation contribution and medical insurance']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; partner nomination deadline',
  'https://stipendiumhungaricum.hu/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'stipendium-hungaricum-scholarship-programme-int027'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'stipendium-hungaricum-scholarship-programme-int027'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'HU' WHERE s.slug = 'stipendium-hungaricum-scholarship-programme-int027'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [28/50] Italian Government MAECI Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'italian-government-maeci-scholarships-int028',
  'Italian Government MAECI Scholarships',
  'Italian Government MAECI Scholarships supports eligible international applicants to study in Italy. Official Study in Italy / MAECI portal. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official Study in Italy / MAECI portal. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Italian Ministry of Foreign Affairs and International Cooperation' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating Italian universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Foreign applicants including Ghanaians may apply where nationality is included in annual call; age and course rules apply',
  ARRAY['Monthly grant and limited tuition/insurance support under current call']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; call-specific',
  'https://studyinitaly.esteri.it/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level), ('postdoctoral'::study_level)) AS v(level) WHERE s.slug = 'italian-government-maeci-scholarships-int028'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other', 'arts-humanities') WHERE s.slug = 'italian-government-maeci-scholarships-int028'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'IT' WHERE s.slug = 'italian-government-maeci-scholarships-int028'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [29/50] DAAD Development-Related Postgraduate Courses (EPOS)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'daad-development-related-postgraduate-courses-epos-int029',
  'DAAD Development-Related Postgraduate Courses (EPOS)',
  'DAAD Development-Related Postgraduate Courses (EPOS) supports eligible international applicants to study in Germany. Official DAAD programme and course list. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official DAAD programme and course list. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'German Academic Exchange Service (DAAD)' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating German universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Applicants from developing countries including Ghana; usually at least two years relevant work experience and eligible course',
  ARRAY['Stipend, insurance, travel allowance and study support per DAAD terms']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Course-specific; 2027/28 dates vary',
  'https://www.daad.de/en/studying-in-germany/scholarships/daad-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'daad-development-related-postgraduate-courses-epos-int029'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('social-sciences') WHERE s.slug = 'daad-development-related-postgraduate-courses-epos-int029'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'DE' WHERE s.slug = 'daad-development-related-postgraduate-courses-epos-int029'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [30/50] Erasmus Mundus Joint Masters Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'erasmus-mundus-joint-masters-scholarships-int030',
  'Erasmus Mundus Joint Masters Scholarships',
  'Erasmus Mundus Joint Masters Scholarships supports eligible international applicants to study in Multiple European countries. Official Erasmus+ programme page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official Erasmus+ programme page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'European Commission / participating consortia' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Joint master consortia across Europe' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Open worldwide; Ghanaian applicants eligible subject to consortium admission criteria',
  ARRAY['Participation costs, travel, visa and living allowance contribution']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Most programmes Oct-Jan for next academic year',
  'https://erasmus-plus.ec.europa.eu/opportunities/opportunities-for-individuals/students/erasmus-mundus-joint-masters',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'erasmus-mundus-joint-masters-scholarships-int030'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('arts-humanities') WHERE s.slug = 'erasmus-mundus-joint-masters-scholarships-int030'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'OT' WHERE s.slug = 'erasmus-mundus-joint-masters-scholarships-int030'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [31/50] Uppsala University Global Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'uppsala-university-global-scholarship-int031',
  'Uppsala University Global Scholarship',
  'Uppsala University Global Scholarship supports eligible international applicants to study in Sweden. Official Uppsala scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official Uppsala scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Uppsala University' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Uppsala University' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Fee-paying international applicants including Ghanaians; first-priority programme ranking and admission requirements apply',
  ARRAY['Full tuition fee waiver; living costs not covered']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; admissions-linked',
  'https://www.uu.se/en/study/masters-studies/scholarships/uppsala-university-scholarships',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'uppsala-university-global-scholarship-int031'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'uppsala-university-global-scholarship-int031'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'SE' WHERE s.slug = 'uppsala-university-global-scholarship-int031'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [32/50] Anders Wall’s Scholarship for Studies at Uppsala University
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'anders-wall-s-scholarship-for-studies-at-uppsala-university-int032',
  'Anders Wall’s Scholarship for Studies at Uppsala University',
  'Anders Wall’s Scholarship for Studies at Uppsala University supports eligible international applicants to study in Sweden. Official Uppsala scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official Uppsala scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Uppsala University / Anders Wall Foundation' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Uppsala University' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Applicants from African countries including Ghana, subject to programme and admission rules',
  ARRAY['Full tuition fee waiver; living costs not covered']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; admissions-linked',
  'https://www.uu.se/en/study/masters-studies/scholarships/uppsala-university-scholarships',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'anders-wall-s-scholarship-for-studies-at-uppsala-university-int032'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'anders-wall-s-scholarship-for-studies-at-uppsala-university-int032'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'SE' WHERE s.slug = 'anders-wall-s-scholarship-for-studies-at-uppsala-university-int032'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [33/50] CyprusAid Scholarship Scheme at University of Nicosia
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'cyprusaid-scholarship-scheme-at-university-of-nicosia-int033',
  'CyprusAid Scholarship Scheme at University of Nicosia',
  'CyprusAid Scholarship Scheme at University of Nicosia supports eligible international applicants to study in Cyprus. Official Ghana Scholarships Authority foreign notice. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official Ghana Scholarships Authority foreign notice. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'tuition_only'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Cyprus / University of Nicosia' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Nicosia / designated Cyprus institution' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian applicants invited through Ghana Scholarships Authority notice; check current nomination and programme terms',
  ARRAY['Tuition support as stated in official cycle notice']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Notice-specific; previous call closed',
  'https://scholarships.gov.gh/opportunities/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'cyprusaid-scholarship-scheme-at-university-of-nicosia-int033'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('law') WHERE s.slug = 'cyprusaid-scholarship-scheme-at-university-of-nicosia-int033'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CY' WHERE s.slug = 'cyprusaid-scholarship-scheme-at-university-of-nicosia-int033'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [34/50] World in Serbia Scholarship Programme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'world-in-serbia-scholarship-programme-int034',
  'World in Serbia Scholarship Programme',
  'World in Serbia Scholarship Programme supports eligible international applicants to study in Serbia. Official Ghana Scholarships Authority notice. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Europe. Official Ghana Scholarships Authority notice. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Serbia' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Accredited public universities in Serbia' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian citizens explicitly invited through Ghana Scholarships Authority; nomination route applies',
  ARRAY['Scholarship package according to Serbia bilateral offer; verify tuition, stipend and travel in current call']::text[],
  ARRAY['Official application form', 'Ghanaian passport/ID', 'academic certificates and transcripts', 'CV', 'references', 'admission/course evidence where required', 'personal statement/study plan', 'other documents in the country-specific call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  '2026/27 call closed 26 Jun 2026',
  'https://scholarships.gov.gh/opportunities/scholarship-opportunity-in-the-republic-of-Serbia',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'world-in-serbia-scholarship-programme-int034'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it') WHERE s.slug = 'world-in-serbia-scholarship-programme-int034'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'RS' WHERE s.slug = 'world-in-serbia-scholarship-programme-int034'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [35/50] Chinese Government Scholarship (CSC Type A / Bilateral)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'chinese-government-scholarship-csc-type-a-bilateral-int035',
  'Chinese Government Scholarship (CSC Type A / Bilateral)',
  'Chinese Government Scholarship (CSC Type A / Bilateral) supports eligible international applicants to study in China. Official CSC portal and Ghana authority channel. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Asia. Official CSC portal and Ghana authority channel. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'China Scholarship Council / Ghana Scholarships Authority' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating Chinese universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian applicants use the bilateral route and Ghana nomination instructions; annual agency number and quota apply',
  ARRAY['Tuition, accommodation, stipend and medical insurance according to award category']::text[],
  ARRAY['Official application form', 'Ghanaian passport/ID', 'academic certificates and transcripts', 'CV', 'references', 'admission/course evidence where required', 'personal statement/study plan', 'other documents in the country-specific call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; Ghana nomination calendar',
  'https://www.campuschina.org/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'chinese-government-scholarship-csc-type-a-bilateral-int035'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it') WHERE s.slug = 'chinese-government-scholarship-csc-type-a-bilateral-int035'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CN' WHERE s.slug = 'chinese-government-scholarship-csc-type-a-bilateral-int035'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [36/50] UNESCO/China Great Wall Co-Sponsored Fellowships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'unesco-china-great-wall-co-sponsored-fellowships-int036',
  'UNESCO/China Great Wall Co-Sponsored Fellowships',
  'UNESCO/China Great Wall Co-Sponsored Fellowships supports eligible international applicants to study in China. Official UNESCO fellowship portal. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Asia. Official UNESCO fellowship portal. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'grant'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'UNESCO / Government of China' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating Chinese universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghana eligibility depends on UNESCO country allocation and national commission nomination for each cycle',
  ARRAY['Tuition, accommodation, stipend and medical insurance according to call']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; country allocation dependent',
  'https://www.unesco.org/en/fellowships',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level), ('postdoctoral'::study_level)) AS v(level) WHERE s.slug = 'unesco-china-great-wall-co-sponsored-fellowships-int036'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it') WHERE s.slug = 'unesco-china-great-wall-co-sponsored-fellowships-int036'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'CN' WHERE s.slug = 'unesco-china-great-wall-co-sponsored-fellowships-int036'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [37/50] MEXT Research Students Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mext-research-students-scholarship-int037',
  'MEXT Research Students Scholarship',
  'MEXT Research Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Asia. Official Study in Japan MEXT page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Japan / MEXT' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Japanese universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian applicants may apply through Japanese Embassy in Ghana when annual call opens; academic and age requirements apply',
  ARRAY['Tuition, monthly stipend and airfare']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; embassy schedule',
  'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level), ('postdoctoral'::study_level)) AS v(level) WHERE s.slug = 'mext-research-students-scholarship-int037'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'mext-research-students-scholarship-int037'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'JP' WHERE s.slug = 'mext-research-students-scholarship-int037'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [38/50] MEXT Undergraduate Students Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mext-undergraduate-students-scholarship-int038',
  'MEXT Undergraduate Students Scholarship',
  'MEXT Undergraduate Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Asia. Official Study in Japan MEXT page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Japan / MEXT' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Japanese universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian applicants may apply through Japanese Embassy in Ghana; age, school results and examinations apply',
  ARRAY['Tuition, monthly stipend, preparatory education and airfare']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; embassy schedule',
  'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'mext-undergraduate-students-scholarship-int038'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('science', 'computer-science-it', 'social-sciences', 'arts-humanities') WHERE s.slug = 'mext-undergraduate-students-scholarship-int038'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'JP' WHERE s.slug = 'mext-undergraduate-students-scholarship-int038'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [39/50] MEXT Japanese Studies Students Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mext-japanese-studies-students-scholarship-int039',
  'MEXT Japanese Studies Students Scholarship',
  'MEXT Japanese Studies Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Asia. Official Study in Japan MEXT page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Japan / MEXT' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Japanese universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian students enrolled in relevant undergraduate Japanese studies may apply through embassy recommendation',
  ARRAY['Tuition, monthly stipend and airfare']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; embassy schedule',
  'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'mext-japanese-studies-students-scholarship-int039'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('arts-humanities') WHERE s.slug = 'mext-japanese-studies-students-scholarship-int039'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'JP' WHERE s.slug = 'mext-japanese-studies-students-scholarship-int039'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [40/50] MEXT College of Technology Students Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mext-college-of-technology-students-scholarship-int040',
  'MEXT College of Technology Students Scholarship',
  'MEXT College of Technology Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Asia. Official Study in Japan MEXT page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Japan / MEXT' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Japanese colleges of technology' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian applicants may apply through embassy recommendation; age and science/mathematics prerequisites apply',
  ARRAY['Tuition, stipend, preparatory Japanese and airfare']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; embassy schedule',
  'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('diploma'::study_level)) AS v(level) WHERE s.slug = 'mext-college-of-technology-students-scholarship-int040'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering') WHERE s.slug = 'mext-college-of-technology-students-scholarship-int040'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'JP' WHERE s.slug = 'mext-college-of-technology-students-scholarship-int040'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [41/50] MEXT Specialized Training College Students Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mext-specialized-training-college-students-scholarship-int041',
  'MEXT Specialized Training College Students Scholarship',
  'MEXT Specialized Training College Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Asia. Official Study in Japan MEXT page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Japan / MEXT' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Japanese specialised training colleges' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian applicants may apply through embassy recommendation; age and examination criteria apply',
  ARRAY['Tuition, stipend, preparatory Japanese and airfare']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; embassy schedule',
  'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('diploma'::study_level)) AS v(level) WHERE s.slug = 'mext-specialized-training-college-students-scholarship-int041'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'computer-science-it', 'education', 'business-management', 'arts-humanities') WHERE s.slug = 'mext-specialized-training-college-students-scholarship-int041'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'JP' WHERE s.slug = 'mext-specialized-training-college-students-scholarship-int041'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [42/50] Australia Awards Scholarships (Africa)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'australia-awards-scholarships-africa-int042',
  'Australia Awards Scholarships (Africa)',
  'Australia Awards Scholarships (Africa) supports eligible international applicants to study in Australia. Official DFAT participating countries and intake dates. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Australia & New Zealand. Official DFAT participating countries and intake dates. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Australian Government Department of Foreign Affairs and Trade' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating Australian universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghana explicitly listed as participating country; Ghana country profile, work experience and return-home conditions apply',
  ARRAY['Tuition, return airfare, establishment allowance, living contribution and health cover']::text[],
  ARRAY['Official application form', 'Ghanaian passport/ID', 'academic certificates and transcripts', 'CV', 'references', 'admission/course evidence where required', 'personal statement/study plan', 'other documents in the country-specific call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  '2027 intake closed 30 Apr 2026',
  'https://www.dfat.gov.au/people-to-people/australia-awards/participating-countries',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'australia-awards-scholarships-africa-int042'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it', 'social-sciences') WHERE s.slug = 'australia-awards-scholarships-africa-int042'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'AU' WHERE s.slug = 'australia-awards-scholarships-africa-int042'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [43/50] Monash International Merit Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'monash-international-merit-scholarship-int043',
  'Monash International Merit Scholarship',
  'Monash International Merit Scholarship supports eligible international applicants to study in Australia. Official Monash scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Australia & New Zealand. Official Monash scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'tuition_only'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Monash University' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Monash University' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International fee-paying students including Ghanaian applicants; academic merit and course exclusions apply',
  ARRAY['Tuition fee contribution; amount and duration under current terms']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; admission-linked',
  'https://www.monash.edu/study/fees-scholarships/scholarships/find-a-scholarship/international-merit-5770',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('masters'::study_level)) AS v(level) WHERE s.slug = 'monash-international-merit-scholarship-int043'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'monash-international-merit-scholarship-int043'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'AU' WHERE s.slug = 'monash-international-merit-scholarship-int043'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [44/50] University of Melbourne Graduate Research Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'university-of-melbourne-graduate-research-scholarships-int044',
  'University of Melbourne Graduate Research Scholarships',
  'University of Melbourne Graduate Research Scholarships supports eligible international applicants to study in Australia. Official Melbourne scholarship page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Australia & New Zealand. Official Melbourne scholarship page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fellowship'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Melbourne' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Melbourne' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Domestic and international research applicants including Ghanaians; selection based on academic merit',
  ARRAY['Full fee offset, living stipend, relocation grant and overseas student health cover for eligible international awardees']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; admission/research round',
  'https://scholarships.unimelb.edu.au/awards/graduate-research-scholarships',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'university-of-melbourne-graduate-research-scholarships-int044'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'university-of-melbourne-graduate-research-scholarships-int044'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'AU' WHERE s.slug = 'university-of-melbourne-graduate-research-scholarships-int044'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [45/50] Adelaide University Global Academic Excellence Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'adelaide-university-global-academic-excellence-scholarship-int045',
  'Adelaide University Global Academic Excellence Scholarship',
  'Adelaide University Global Academic Excellence Scholarship supports eligible international applicants to study in Australia. Official Adelaide University site; exact award page required. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Australia & New Zealand. Official Adelaide University site; exact award page required. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'tuition_only'::funding_type,
  'upcoming'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Adelaide University' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Adelaide University' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International applicants including Ghanaian students; verify 2027 award name, transition arrangements and eligible programmes',
  ARRAY['Tuition reduction under current published terms']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; 2027 award details to reconfirm',
  'https://adelaide.edu.au/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('masters'::study_level)) AS v(level) WHERE s.slug = 'adelaide-university-global-academic-excellence-scholarship-int045'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'adelaide-university-global-academic-excellence-scholarship-int045'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'AU' WHERE s.slug = 'adelaide-university-global-academic-excellence-scholarship-int045'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [46/50] University of Sydney International Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'university-of-sydney-international-scholarship-int046',
  'University of Sydney International Scholarship',
  'University of Sydney International Scholarship supports eligible international applicants to study in Australia. Official University of Sydney scholarship directory. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Australia & New Zealand. Official University of Sydney scholarship directory. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'tuition_only'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Sydney' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Sydney' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'International applicants including Ghanaians; exact award, supervisor and research round determine eligibility',
  ARRAY['Stipend and/or tuition support depending on named award']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Round-specific',
  'https://www.sydney.edu.au/scholarships/international.html',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'university-of-sydney-international-scholarship-int046'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'university-of-sydney-international-scholarship-int046'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'AU' WHERE s.slug = 'university-of-sydney-international-scholarship-int046'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [47/50] Mandela Rhodes Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mandela-rhodes-scholarship-int047',
  'Mandela Rhodes Scholarship',
  'Mandela Rhodes Scholarship supports eligible international applicants to study in South Africa. Official Mandela Rhodes Foundation. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Africa & Other Destinations. Official Mandela Rhodes Foundation. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Mandela Rhodes Foundation' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating South African universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Citizens of African countries including Ghana; age, academic and leadership requirements apply',
  ARRAY['Tuition, accommodation, meals, stipend, books, research and medical aid']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; check 2027 call',
  'https://www.mandelarhodes.org/scholarship/',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level)) AS v(level) WHERE s.slug = 'mandela-rhodes-scholarship-int047'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it') WHERE s.slug = 'mandela-rhodes-scholarship-int047'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'ZA' WHERE s.slug = 'mandela-rhodes-scholarship-int047'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [48/50] Mauritius-Africa Scholarship Scheme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mauritius-africa-scholarship-scheme-int048',
  'Mauritius-Africa Scholarship Scheme',
  'Mauritius-Africa Scholarship Scheme supports eligible international applicants to study in Mauritius. Official Ghana Scholarships Authority notice. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Africa & Other Destinations. Official Ghana Scholarships Authority notice. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Mauritius / Ghana Scholarships Authority' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Public higher education institutions in Mauritius' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian citizens resident in Ghana explicitly eligible; age and academic requirements differ by level',
  ARRAY['Coverage and travel/allowances according to annual scheme terms']::text[],
  ARRAY['Official application form', 'Ghanaian passport/ID', 'academic certificates and transcripts', 'CV', 'references', 'admission/course evidence where required', 'personal statement/study plan', 'other documents in the country-specific call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  '2026/27 call; check next cycle',
  'https://scholarships.gov.gh/opportunities/the-mauritius-africa-scholarship-scheme-20262027-academic-year',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('diploma'::study_level), ('undergraduate'::study_level), ('masters'::study_level), ('other'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'mauritius-africa-scholarship-scheme-int048'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it', 'education') WHERE s.slug = 'mauritius-africa-scholarship-scheme-int048'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'MU' WHERE s.slug = 'mauritius-africa-scholarship-scheme-int048'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [49/50] Brazil PEC-G Undergraduate Student Agreement Programme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'brazil-pec-g-undergraduate-student-agreement-programme-int049',
  'Brazil PEC-G Undergraduate Student Agreement Programme',
  'Brazil PEC-G Undergraduate Student Agreement Programme supports eligible international applicants to study in Brazil. Official Brazilian government PEC-G page. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Africa & Other Destinations. Official Brazilian government PEC-G page. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Brazil / Ministry of Foreign Affairs' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating Brazilian universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian applicants may participate only if Ghana is included in the current partner-country call and nomination route; Portuguese proficiency and financial means required',
  ARRAY['Tuition-free placement; living costs are generally applicant responsibility unless separate support applies']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; country nomination calendar',
  'https://www.gov.br/mre/pt-br/assuntos/cultura-e-educacao/temas-educacionais/programa-de-estudantes-convenio-de-graduacao-pec-g',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'brazil-pec-g-undergraduate-student-agreement-programme-int049'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it', 'arts-humanities') WHERE s.slug = 'brazil-pec-g-undergraduate-student-agreement-programme-int049'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'BR' WHERE s.slug = 'brazil-pec-g-undergraduate-student-agreement-programme-int049'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [50/50] Brazil PEC-PG Postgraduate Student Agreement Programme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'brazil-pec-pg-postgraduate-student-agreement-programme-int050',
  'Brazil PEC-PG Postgraduate Student Agreement Programme',
  'Brazil PEC-PG Postgraduate Student Agreement Programme supports eligible international applicants to study in Brazil. Official CAPES international scholarship portal. Review the linked official call for the current award conditions and participating courses.',
  'Region group: Africa & Other Destinations. Official CAPES international scholarship portal. Eligibility and deadline must be checked against the current intake before publication.',
  'international'::geographic_scope,
  'other'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'CAPES / Government of Brazil' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Participating Brazilian universities' LIMIT 1),
  FALSE,
  'foreign_university'::institution_category,
  FALSE,
  'Ghanaian eligibility depends on participating-country arrangements and current call; Portuguese/language, supervisor and research proposal requirements apply',
  ARRAY['Scholarship stipend and other benefits as specified in annual CAPES call']::text[],
  ARRAY['Application form', 'academic transcripts/certificates', 'passport or national ID', 'CV', 'references', 'admission evidence', 'personal statement/research proposal', 'language evidence where required. Confirm exact checklist in current call.']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Annual; call-specific',
  'https://www.gov.br/capes/pt-br/assuntos/bolsas-e-auxilios-internacionais',
  TRUE,
  FALSE,
  NOW()
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  full_description = EXCLUDED.full_description,
  geographic_scope = EXCLUDED.geographic_scope,
  funding_type = EXCLUDED.funding_type,
  application_status = EXCLUDED.application_status,
  gender_eligibility = EXCLUDED.gender_eligibility,
  verification_status = EXCLUDED.verification_status,
  provider_id = EXCLUDED.provider_id,
  institution_id = EXCLUDED.institution_id,
  institution_specific = EXCLUDED.institution_specific,
  institution_category_restriction = EXCLUDED.institution_category_restriction,
  public_school_specific = EXCLUDED.public_school_specific,
  eligibility_requirements = EXCLUDED.eligibility_requirements,
  benefits = EXCLUDED.benefits,
  required_documents = EXCLUDED.required_documents,
  application_deadline = EXCLUDED.application_deadline,
  deadline_type = EXCLUDED.deadline_type,
  deadline_text = EXCLUDED.deadline_text,
  application_url = EXCLUDED.application_url,
  is_published = EXCLUDED.is_published,
  is_featured = EXCLUDED.is_featured,
  updated_at = NOW();

INSERT INTO scholarship_study_levels (scholarship_id, level)
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'brazil-pec-pg-postgraduate-student-agreement-programme-int050'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('computer-science-it') WHERE s.slug = 'brazil-pec-pg-postgraduate-student-agreement-programme-int050'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'BR' WHERE s.slug = 'brazil-pec-pg-postgraduate-student-agreement-programme-int050'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;
