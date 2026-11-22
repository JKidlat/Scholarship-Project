-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — POPULATE 112 GHANA SCHOLARSHIPS SEED DATA
-- Migration: 003_seed_data.sql
-- Total Records: 112 Scholarships
-- Schema: 100% Normalized & Aligned with 001_initial_schema.sql
-- ============================================================

-- Ensure prerequisite unique indexes and columns exist for idempotent seeding
CREATE UNIQUE INDEX IF NOT EXISTS idx_scholarship_providers_name ON scholarship_providers (name);
CREATE UNIQUE INDEX IF NOT EXISTS idx_institutions_name ON institutions (name);
ALTER TABLE scholarships ADD COLUMN IF NOT EXISTS deadline_text TEXT;

-- ------------------------------------------------------------
-- 1. SEED SCHOLARSHIP PROVIDERS (95 Unique Providers)
-- ------------------------------------------------------------
INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ghana Scholarships Authority',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ghana Education Trust Fund',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'GNPC Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'MTN Ghana Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Students Loan Trust Fund',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Nana Osae Nyampong VI / UG Students Financial Aid Office',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Ghana / donors',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Ghana Students'' Representative Council',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Ghana Business School / donors',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Ghana Students Financial Aid Office',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Educational Pathways International',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Fondazione Edu',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Wood Group',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Timothy Ansah Memorial Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Vodafone Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Tertiary Education Scholarship Trust for Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Total Petroleum Ghana Limited / TotalEnergies',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Lebanese Embassy / Lebanese Community in Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Government of Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Baker Hughes',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Unibank Ghana Limited',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'S. T. Nankani Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Kingdom Books and Stationery',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Toyota Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'KNUST internally generated funds',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'KNUST Students'' Representative Council',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'KNUST Directorate of Student Affairs',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'KNUST college welfare associations (GESA, SOCIOSO, SCISA, SIMPUA, IAAS, CHS)',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'KNUST Graduate Students Association',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'KNUST',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ashesi University and donors',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Mastercard Foundation and Ashesi University',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Kofi A. Tawiah fund / Ashesi University',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ashesi University / donors',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ashesi University',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Professor Margaret Gyapong / donors',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Health and Allied Sciences',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Education, Winneba',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Cape Coast',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Building Tomorrow / UCC',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'UCC College of Distance Education',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'GNPC / UCC',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ghana Scholarships Authority / UCC',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ghana Chamber of Mines',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Gold Fields Ghana Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Newmont Ahafo Development Foundation and Liebherr Mining Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Zijin Development Foundation (formerly Newmont Ghana)',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Newmont Ahafo Development Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Jubilee and TEN Joint Venture Partners: Tullow, Kosmos, PetroSA, GNPC and EXPLORCO',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Tullow Oil Ghana / Jubilee partners',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Pecan Energies and partners including Lukoil Overseas Ghana Tano, GNPC and Fueltrade',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Pecan Energies and UPSA',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Campaign for Female Education (CAMFED)',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'West African Gas Pipeline Company',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ghana National Gas Company',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Volta River Authority',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Karpowership',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Pecan Energies',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Passico Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Yinson Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Akua Kuenyehia Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Marian Kwofie Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'The Rebecca Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'J&E Quansah Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Alice Dede Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Otumfuo Osei Tutu II Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'KGL Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Brighter Investment',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Anonymous Hope Fund',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'John A. Kufuor Foundation',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Florence Nkrumah Onny Memorial Fund',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Barclays Bank Ghana / UPSA',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Working to Advance STEM Education for African Women (WAAW)',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Islamic Development Bank',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Zawadi Africa Educational Fund',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'African Gifted Foundation / African Science Academy',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'YALI RLC West Africa / GIMPA',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'UHAS / individual donors',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'GETFund / UHAS',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'GNPC Foundation / UHAS',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'MTN Ghana Foundation / UHAS',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'CAMFED / UHAS',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Gold Fields Ghana Foundation / UHAS',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'VRA / UHAS',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ghana National Gas Company / UHAS',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Zijin Development Foundation / UHAS',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Ghana Business School / UG Students Financial Aid Office',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Ghana Students Financial Aid Office and UG SRC',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Educational Pathways International / KNUST',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Fondazione Edu / KNUST',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Educational Pathways International / University for Development Studies',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Lancaster University Ghana / Transnational Academic Group',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Transnational Academic Group (TAG) Ghana / Lancaster University Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'KGL Foundation / Lancaster University Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO scholarship_providers (id, name, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Tertiary Education Scholarship Trust, Ghana',
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

-- ------------------------------------------------------------
-- 2. SEED INSTITUTIONS (12 Unique Institutions)
-- ------------------------------------------------------------
INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Ghana',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Kwame Nkrumah University of Science and Technology',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ashesi University',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Health and Allied Sciences',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Education, Winneba',
  'other'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Cape Coast',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Mines and Technology',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University of Professional Studies, Accra',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Takoradi Technical University',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Ghana Communication Technology University',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'University for Development Studies',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

INSERT INTO institutions (id, name, category, country_id)
VALUES (
  extensions.uuid_generate_v4(),
  'Lancaster University Ghana',
  'public_university'::institution_category,
  (SELECT id FROM countries WHERE code = 'GH' LIMIT 1)
) ON CONFLICT (name) DO NOTHING;

-- ------------------------------------------------------------
-- 3. SEED SCHOLARSHIPS (112 Records)
-- ------------------------------------------------------------
-- [1/112] Ghana Scholarships Authority – Local Tertiary Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ghana-scholarships-authority-local-tertiary-scholarship-gh001',
  'Ghana Scholarships Authority – Local Tertiary Scholarship',
  'Separate from GETFund. Verify current eligibility, application window and whether the new portal is the operative route.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Scholarships Authority' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian students; check current category criteria',
  ARRAY['Tuition and approved academic costs']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://scholarships.gov.gh/programmes',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ghana-scholarships-authority-local-tertiary-scholarship-gh001'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ghana-scholarships-authority-local-tertiary-scholarship-gh001'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ghana-scholarships-authority-local-tertiary-scholarship-gh001'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [2/112] Ghana Scholarships Authority – National Merit Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ghana-scholarships-authority-national-merit-scholarship-gh002',
  'Ghana Scholarships Authority – National Merit Scholarship',
  'Portal describes national merit pathway; obtain specific call before publishing as open.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Scholarships Authority' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'High-performing Ghanaian applicants; exact current criteria need call',
  ARRAY['Merit-based support; package varies']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://scholarships.gov.gh/programmes',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ghana-scholarships-authority-national-merit-scholarship-gh002'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ghana-scholarships-authority-national-merit-scholarship-gh002'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ghana-scholarships-authority-national-merit-scholarship-gh002'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [3/112] GETFund Local Undergraduate Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'getfund-local-undergraduate-scholarship-gh003',
  'GETFund Local Undergraduate Scholarship',
  '2026/27 call opened 5 Oct and closes 27 Nov 2026. Read portal for document checklist.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Education Trust Fund' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian Diploma, HND and degree applicants',
  ARRAY['Local scholarship support; exact package depends on award']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026',
  'https://scholarships.getfund.gov.gh/',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('diploma'::study_level), ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'getfund-local-undergraduate-scholarship-gh003'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'getfund-local-undergraduate-scholarship-gh003'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'getfund-local-undergraduate-scholarship-gh003'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [4/112] GETFund Local Postgraduate Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'getfund-local-postgraduate-scholarship-gh004',
  'GETFund Local Postgraduate Scholarship',
  'Separate postgraduate category within same GETFund call; record separately for filtering.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Education Trust Fund' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian Master''s and PhD applicants',
  ARRAY['Local postgraduate scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026',
  'https://scholarships.getfund.gov.gh/',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('postgraduate'::study_level), ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'getfund-local-postgraduate-scholarship-gh004'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'getfund-local-postgraduate-scholarship-gh004'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'getfund-local-postgraduate-scholarship-gh004'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [5/112] GNPC Foundation Local Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'gnpc-foundation-local-scholarship-gh005',
  'GNPC Foundation Local Scholarship',
  'Official page confirms local scholarship and selection criteria. Verify current call, institutions, GPA and discipline criteria.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'GNPC Foundation' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian undergraduates and postgraduates; detailed conditions vary by level',
  ARRAY['Tuition/educational support; local and foreign schemes exist']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.gnpcghana.com/gnpc-foundation',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('diploma'::study_level), ('undergraduate'::study_level), ('postgraduate'::study_level), ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'gnpc-foundation-local-scholarship-gh005'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'gnpc-foundation-local-scholarship-gh005'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'gnpc-foundation-local-scholarship-gh005'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [6/112] MTN Ghana Foundation Bright Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mtn-ghana-foundation-bright-scholarship-gh006',
  'MTN Ghana Foundation Bright Scholarship',
  '2026 application window was 1 Feb–31 May 2026. Confirm 2027 opening/deadline before marking open.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'research'::funding_type,
  'closed'::application_status,
  'women_priority'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'MTN Ghana Foundation' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Brilliant but needy Ghanaian first-year and continuing students; priority STEM, women, PWDs and underserved regions',
  ARRAY['Tuition', 'accommodation', 'research devices and reading-material stipend']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Not stated / verify current cycle',
  'https://scholarship.mtn.com.gh/',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('vocational'::study_level), ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'mtn-ghana-foundation-bright-scholarship-gh006'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'mtn-ghana-foundation-bright-scholarship-gh006'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'mtn-ghana-foundation-bright-scholarship-gh006'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [7/112] Students Loan Trust Fund (SLTF) Tertiary Loan
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'students-loan-trust-fund-sltf-tertiary-loan-gh007',
  'Students Loan Trust Fund (SLTF) Tertiary Loan',
  'Include in a separate loans/financial aid category, not scholarship count.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'loan'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Students Loan Trust Fund' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Eligible Ghanaian tertiary students',
  ARRAY['Means-tested subsidised student loan; repayable', 'not a scholarship']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.sltf.gov.gh/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'students-loan-trust-fund-sltf-tertiary-loan-gh007'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'students-loan-trust-fund-sltf-tertiary-loan-gh007'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'students-loan-trust-fund-sltf-tertiary-loan-gh007'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [8/112] Presidential West African Scholarship Initiative (PWASI) 2026
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'presidential-west-african-scholarship-initiative-pwasi-2026-gh008',
  'Presidential West African Scholarship Initiative (PWASI) 2026',
  '2026 notice lists participating universities and application windows. Historical/closed cycle; monitor next intake.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Scholarships Authority' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Eligible Ghanaian applicants admitted to participating institutions',
  ARRAY['Scholarship support; institution-specific arrangements']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Not stated / verify current cycle',
  'https://scholarships.gov.gh/opportunities/presidential-west-african-scholarship-initiative-pwasi-2026',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'presidential-west-african-scholarship-initiative-pwasi-2026-gh008'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'presidential-west-african-scholarship-initiative-pwasi-2026-gh008'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'presidential-west-african-scholarship-initiative-pwasi-2026-gh008'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [9/112] Nana Osae Nyampong VI's Legacy Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'nana-osae-nyampong-vi-s-legacy-scholarship-gh009',
  'Nana Osae Nyampong VI''s Legacy Scholarship',
  'Narrow eligibility: verify programme, campus and hall residency in full call.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Nana Osae Nyampong VI / UG Students Financial Aid Office' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Eligible Ghanaian UG students in specified UGBS programme; Level 100 WASSCE aggregate 10 or better; need',
  ARRAY['Tuition', 'accommodation and stipend']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026',
  'https://www.ug.edu.gh/financialaid/scholarships',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'nana-osae-nyampong-vi-s-legacy-scholarship-gh009'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('business-management') WHERE s.slug = 'nana-osae-nyampong-vi-s-legacy-scholarship-gh009'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'nana-osae-nyampong-vi-s-legacy-scholarship-gh009'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [10/112] UG Sponsorship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ug-sponsorship-gh010',
  'UG Sponsorship',
  'New and renewal applications; verify deadline and current cohort restrictions.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'tuition_only'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Ghana / donors' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian continuing undergraduate students; need and academic progress; current page gives aggregate 20 or better and CGPA 2.5+',
  ARRAY['Tuition fees']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.ug.edu.gh/financialaid/scholarship/ug-sponsorship',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ug-sponsorship-gh010'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ug-sponsorship-gh010'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ug-sponsorship-gh010'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [11/112] SRC Yi Bi Boa Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'src-yi-bi-boa-scholarship-gh011',
  'SRC Yi Bi Boa Scholarship',
  'Check current cycle dates and whether fee-paying, City Campus and distance students remain eligible.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Ghana Students'' Representative Council' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'SRC dues-paying UG students; financial need; continuing CGPA 1.5 or better',
  ARRAY['Financial support; exact award amount varies']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.ug.edu.gh/financialaid/node/27',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'src-yi-bi-boa-scholarship-gh011'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'src-yi-bi-boa-scholarship-gh011'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'src-yi-bi-boa-scholarship-gh011'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [12/112] UGBS Scholars' Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ugbs-scholars-scholarship-gh012',
  'UGBS Scholars'' Scholarship',
  'UGBS-specific scheme; obtain detailed eligibility and award value from SFAO.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Ghana Business School / donors' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'other'::institution_category,
  FALSE,
  'Exceptional undergraduate students from disadvantaged backgrounds',
  ARRAY['Financial support; confirm exact package']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  '2026-07-29'::date,
  'fixed'::deadline_type,
  '29 Jul 2026',
  'https://www.ug.edu.gh/financialaid/node/63',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ugbs-scholars-scholarship-gh012'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('business-management') WHERE s.slug = 'ugbs-scholars-scholarship-gh012'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ugbs-scholars-scholarship-gh012'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [13/112] One Student One Laptop Initiative
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'one-student-one-laptop-initiative-gh013',
  'One Student One Laptop Initiative',
  'Catalogue under student support/device grants, not tuition scholarship.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Ghana Students Financial Aid Office' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian UG levels 100–400 and research postgraduate MPhil/PhD after first year; need; no existing laptop',
  ARRAY['Laptop/device support', 'not cash tuition scholarship']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026',
  'https://www.ug.edu.gh/financialaid/initiative/20262027-call-application-one-student-one-laptop-initiative',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level), ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'one-student-one-laptop-initiative-gh013'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'one-student-one-laptop-initiative-gh013'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'one-student-one-laptop-initiative-gh013'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [14/112] Educational Pathways International Scholarship – UG
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'educational-pathways-international-scholarship-ug-gh014',
  'Educational Pathways International Scholarship – UG',
  'Current UG page lists the award as closed. Confirm next cycle and detailed UG criteria.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Educational Pathways International' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Brilliant but needy UG students; university-specific eligibility',
  ARRAY['Full tuition', 'books', 'room and board (UG listing)']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.ug.edu.gh/financialaid/scholarships',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'educational-pathways-international-scholarship-ug-gh014'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'educational-pathways-international-scholarship-ug-gh014'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'educational-pathways-international-scholarship-ug-gh014'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [15/112] Fondazione Edu Scholarship – UG
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'fondazione-edu-scholarship-ug-gh015',
  'Fondazione Edu Scholarship – UG',
  'Current UG page lists the award as closed. Confirm next cycle and exact criteria.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Fondazione Edu' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy UG students; institution-specific eligibility',
  ARRAY['Tuition', 'books', 'accommodation and stipend (UG listing)']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.ug.edu.gh/financialaid/scholarships',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'fondazione-edu-scholarship-ug-gh015'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'fondazione-edu-scholarship-ug-gh015'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'fondazione-edu-scholarship-ug-gh015'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [16/112] Educational Pathways International Scholarship – KNUST
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'educational-pathways-international-scholarship-knust-gh016',
  'Educational Pathways International Scholarship – KNUST',
  'Current call details supersede older general criteria.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Educational Pathways International' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian brilliant but needy full-time students; first/second year 2026 call; first-year aggregate 10 or better, continuing CWA 67+',
  ARRAY['Four-year scholarship; full tuition and other donor support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026',
  'https://www.knust.edu.gh/announcements/general/call-applications-educational-pathways-international-epi-scholarship-20262027-academic-year',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'educational-pathways-international-scholarship-knust-gh016'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'educational-pathways-international-scholarship-knust-gh016'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'educational-pathways-international-scholarship-knust-gh016'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [17/112] Fondazione Edu Scholarship – KNUST
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'fondazione-edu-scholarship-knust-gh017',
  'Fondazione Edu Scholarship – KNUST',
  'Current call requires demonstrated financial need; fee-paying students may apply with evidence.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Fondazione Edu' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian first- and second-year full-time students; first-year aggregate 12 or better, continuing CWA 65+',
  ARRAY['Tuition', 'books', 'accommodation and stipend (published call)']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026',
  'https://www.knust.edu.gh/announcements/general/call-applications-fondazione-edu-scholarship-20262027-academic-year',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'fondazione-edu-scholarship-knust-gh017'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'fondazione-edu-scholarship-knust-gh017'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'fondazione-edu-scholarship-knust-gh017'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [18/112] Wood Group Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'wood-group-scholarship-gh018',
  'Wood Group Scholarship',
  'Confirm Wood Group''s current Ghana entity, funding status and application route.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Wood Group' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  TRUE,
  'Two needy first-year engineering students from less-endowed communities admitted through KNUST less-endowed admission route',
  ARRAY['Scholarship support for Mechanical/Civil Engineering']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'wood-group-scholarship-gh018'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'wood-group-scholarship-gh018'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'wood-group-scholarship-gh018'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [19/112] Wood Group Excellence Cash and Prize Awards
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'wood-group-excellence-cash-and-prize-awards-gh019',
  'Wood Group Excellence Cash and Prize Awards',
  'Separate merit award from Wood Group need-based scholarship; verify whether still active.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Wood Group' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Nominated students in years 1–4 who excel in class',
  ARRAY['Cash and other prizes']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'wood-group-excellence-cash-and-prize-awards-gh019'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'wood-group-excellence-cash-and-prize-awards-gh019'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'wood-group-excellence-cash-and-prize-awards-gh019'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [20/112] Timothy Ansah Memorial Foundation Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'timothy-ansah-memorial-foundation-scholarship-gh020',
  'Timothy Ansah Memorial Foundation Scholarship',
  'Confirm current application call and exact award coverage.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Timothy Ansah Memorial Foundation' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy but brilliant Ghanaian students born and schooled in Western Region',
  ARRAY['University education scholarship']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'timothy-ansah-memorial-foundation-scholarship-gh020'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'timothy-ansah-memorial-foundation-scholarship-gh020'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'timothy-ansah-memorial-foundation-scholarship-gh020'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [21/112] Vodafone Ghana Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'vodafone-ghana-scholarship-gh021',
  'Vodafone Ghana Scholarship',
  'Vodafone Ghana has since rebranded to Telecel Ghana; verify whether this legacy scheme continues.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Vodafone Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Female students studying Telecommunications and Electrical Engineering',
  ARRAY['Scholarship; assessment may lead to internship/employment opportunities']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'vodafone-ghana-scholarship-gh021'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'vodafone-ghana-scholarship-gh021'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'vodafone-ghana-scholarship-gh021'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [22/112] TEST for Ghana Scholarship – KNUST
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'test-for-ghana-scholarship-knust-gh022',
  'TEST for Ghana Scholarship – KNUST',
  'KNUST directory and UPSA financial aid page confirm the programme. Check application dates and discipline list.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Tertiary Education Scholarship Trust for Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy and academically gifted students; selected disciplines; new and continuing students',
  ARRAY['Four-year full or partial scholarship']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://testforghana.org/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'test-for-ghana-scholarship-knust-gh022'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'test-for-ghana-scholarship-knust-gh022'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'test-for-ghana-scholarship-knust-gh022'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [23/112] TotalEnergies / Total Petroleum Ghana Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'totalenergies-total-petroleum-ghana-scholarship-gh023',
  'TotalEnergies / Total Petroleum Ghana Scholarship',
  'Confirm current sponsor name, active funding and application process.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Total Petroleum Ghana Limited / TotalEnergies' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Brilliant but needy full-time KNUST engineering students, years 1–4',
  ARRAY['Scholarship and training']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'totalenergies-total-petroleum-ghana-scholarship-gh023'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'totalenergies-total-petroleum-ghana-scholarship-gh023'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'totalenergies-total-petroleum-ghana-scholarship-gh023'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [24/112] Lebanese Community Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'lebanese-community-scholarship-gh024',
  'Lebanese Community Scholarship',
  'Contact KNUST Faculty of Law/DoSA for current availability.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Lebanese Embassy / Lebanese Community in Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Undergraduate law students; merit-based, not need-based',
  ARRAY['Tuition and other educational expenses']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'lebanese-community-scholarship-gh024'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('law') WHERE s.slug = 'lebanese-community-scholarship-gh024'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'lebanese-community-scholarship-gh024'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [25/112] MASTEES Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mastees-scholarship-gh025',
  'MASTEES Scholarship',
  'KNUST explicitly says government suspended payments from 2013/14 and was considering revival. Do not publish as open.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Government of Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Undergraduate and postgraduate students in mathematics, science and technology',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'mastees-scholarship-gh025'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'mastees-scholarship-gh025'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'mastees-scholarship-gh025'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [26/112] Baker Hughes Foundation / Women Resource Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'baker-hughes-foundation-women-resource-scholarship-gh026',
  'Baker Hughes Foundation / Women Resource Scholarship',
  'Verify current Ghana presence, award scope and active intake.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Baker Hughes' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy and brilliant female students; aptitude-test selection',
  ARRAY['Scholarship sponsorship']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'baker-hughes-foundation-women-resource-scholarship-gh026'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'baker-hughes-foundation-women-resource-scholarship-gh026'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'baker-hughes-foundation-women-resource-scholarship-gh026'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [27/112] Unibank Ghana Limited Bursary
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'unibank-ghana-limited-bursary-gh027',
  'Unibank Ghana Limited Bursary',
  'Unibank''s operating status and current bursary continuation must be checked before publishing.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Unibank Ghana Limited' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy but brilliant Ghanaian regular full-time students, first to final year',
  ARRAY['Academic Facility User Fees support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'unibank-ghana-limited-bursary-gh027'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'unibank-ghana-limited-bursary-gh027'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'unibank-ghana-limited-bursary-gh027'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [28/112] S. T. Nankani Bursary
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  's-t-nankani-bursary-gh028',
  'S. T. Nankani Bursary',
  'Confirm next call and whether the scheme is administered under the same foundation.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'S. T. Nankani Foundation' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy and brilliant students in Engineering, Health Sciences, Agriculture/Natural Resources and Science; regional/gender balance',
  ARRAY['One-year bursary / fee support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 's-t-nankani-bursary-gh028'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it', 'medicine-health-sciences', 'agriculture', 'arts-humanities') WHERE s.slug = 's-t-nankani-bursary-gh028'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 's-t-nankani-bursary-gh028'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [29/112] Kingdom Books and Stationery Bursary
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'kingdom-books-and-stationery-bursary-gh029',
  'Kingdom Books and Stationery Bursary',
  'Verify active annual cycle and current number of beneficiaries.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Kingdom Books and Stationery' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy but brilliant KNUST students',
  ARRAY['Books/stationery (40%) and AFUF cash support (60%); directory reports 50 students annually']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'kingdom-books-and-stationery-bursary-gh029'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'kingdom-books-and-stationery-bursary-gh029'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'kingdom-books-and-stationery-bursary-gh029'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [30/112] Toyota Ghana Bursary
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'toyota-ghana-bursary-gh030',
  'Toyota Ghana Bursary',
  'Confirm current sponsor and application route.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Toyota Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy but brilliant Mechanical Engineering students',
  ARRAY['Educational expense bursary']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'toyota-ghana-bursary-gh030'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'toyota-ghana-bursary-gh030'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'toyota-ghana-bursary-gh030'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [31/112] KNUST Bursary
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'knust-bursary-gh031',
  'KNUST Bursary',
  'Current call excludes final-year, fee-paying/parallel and some other scholarship holders.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KNUST internally generated funds' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Regular Ghanaian full-time students; brilliant and needy; current call specifies CWA 67+ for continuing students',
  ARRAY['One-year tuition/AFUF support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/index.php/announcements/general/call-applications-knust-bursary-20262027-academic-year',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'knust-bursary-gh031'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'knust-bursary-gh031'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'knust-bursary-gh031'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [32/112] Ketewa Biara Nsua (KBN) SRC Bursary
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ketewa-biara-nsua-kbn-src-bursary-gh032',
  'Ketewa Biara Nsua (KBN) SRC Bursary',
  'A separate current call is listed on KNUST scholarships and grants page.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KNUST Students'' Representative Council' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy KNUST students; official DoSA page says open to full-time regular students',
  ARRAY['Tuition/AFUF and educational expense support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://dosa.knust.edu.gh/page/scholarships',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ketewa-biara-nsua-kbn-src-bursary-gh032'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ketewa-biara-nsua-kbn-src-bursary-gh032'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ketewa-biara-nsua-kbn-src-bursary-gh032'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [33/112] DoSA Support to Needy Students
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'dosa-support-to-needy-students-gh033',
  'DoSA Support to Needy Students',
  'Financial support scheme, not necessarily a competitive named scholarship.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KNUST Directorate of Student Affairs' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Extremely needy students selected after application/interview',
  ARRAY['AFUF', 'accommodation fees or monthly stipend']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://dosa.knust.edu.gh/page/scholarships',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'dosa-support-to-needy-students-gh033'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'dosa-support-to-needy-students-gh033'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'dosa-support-to-needy-students-gh033'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [34/112] Noko Fio SRC Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'noko-fio-src-support-gh034',
  'Noko Fio SRC Support',
  'Include in emergency student support, not scholarship category.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KNUST Students'' Representative Council' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Students with petty and urgent needs',
  ARRAY['Small urgent financial support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'noko-fio-src-support-gh034'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'noko-fio-src-support-gh034'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'noko-fio-src-support-gh034'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [35/112] KNUST College Students' Welfare Association Funds
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'knust-college-students-welfare-association-funds-gh035',
  'KNUST College Students'' Welfare Association Funds',
  'These are multiple independently administered funds; obtain each college''s current criteria before making individual listings.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KNUST college welfare associations (GESA, SOCIOSO, SCISA, SIMPUA, IAAS, CHS)' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Students belonging to respective colleges/associations who face educational expenses',
  ARRAY['Association-level financial support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'knust-college-students-welfare-association-funds-gh035'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'knust-college-students-welfare-association-funds-gh035'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'knust-college-students-welfare-association-funds-gh035'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [36/112] GRASAG Boa Wo Nua
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'grasag-boa-wo-nua-gh036',
  'GRASAG Boa Wo Nua',
  'Confirm application contact, award amount and cycle.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KNUST Graduate Students Association' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Graduate students needing small financial assistance',
  ARRAY['Small financial support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'grasag-boa-wo-nua-gh036'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'grasag-boa-wo-nua-gh036'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'grasag-boa-wo-nua-gh036'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [37/112] KNUST Graduate Assistantship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'knust-graduate-assistantship-gh037',
  'KNUST Graduate Assistantship',
  'Assistantship rather than conventional scholarship; list separately as funded study/work opportunity.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KNUST' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Postgraduate students selected on academic merit to assist undergraduate teaching',
  ARRAY['Monthly allowance in exchange for teaching support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'knust-graduate-assistantship-gh037'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'knust-graduate-assistantship-gh037'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'knust-graduate-assistantship-gh037'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [38/112] KNUST Undergraduate Work Study
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'knust-undergraduate-work-study-gh038',
  'KNUST Undergraduate Work Study',
  'Work-study rather than scholarship; classify under student financial support.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KNUST' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Needy students able to work around class timetable',
  ARRAY['Paid campus work']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.knust.edu.gh/node/49',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'knust-undergraduate-work-study-gh038'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'knust-undergraduate-work-study-gh038'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'knust-undergraduate-work-study-gh038'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [39/112] Ashesi Financial Aid (AFA) / Ashesi Scholarship Fund
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ashesi-financial-aid-afa-ashesi-scholarship-fund-gh039',
  'Ashesi Financial Aid (AFA) / Ashesi Scholarship Fund',
  'This is a general institutional aid pool, not a single named donor award.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ashesi University and donors' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Ashesi University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Admitted students with demonstrated financial need',
  ARRAY['Partial to comprehensive support; may include tuition', 'housing', 'meals', 'materials and living expenses']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ashesi.edu.gh/scholarships/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ashesi-financial-aid-afa-ashesi-scholarship-fund-gh039'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ashesi-financial-aid-afa-ashesi-scholarship-fund-gh039'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ashesi-financial-aid-afa-ashesi-scholarship-fund-gh039'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [40/112] Mastercard Foundation Scholars Program at Ashesi
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mastercard-foundation-scholars-program-at-ashesi-gh040',
  'Mastercard Foundation Scholars Program at Ashesi',
  'Applicants do not directly select the award; Ashesi determines award category from financial aid application.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Mastercard Foundation and Ashesi University' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Ashesi University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Young Africans with academic talent, leadership potential and financial need',
  ARRAY['Comprehensive fees', 'books', 'supplies', 'transport', 'accommodation', 'stipend and transition support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ashesi.edu.gh/the-mastercard-foundation-scholars-programme/',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level), ('masters'::study_level)) AS v(level) WHERE s.slug = 'mastercard-foundation-scholars-program-at-ashesi-gh040'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'mastercard-foundation-scholars-program-at-ashesi-gh040'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'mastercard-foundation-scholars-program-at-ashesi-gh040'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [41/112] Kofi A. Tawiah Scholarship Program
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'kofi-a-tawiah-scholarship-program-gh041',
  'Kofi A. Tawiah Scholarship Program',
  'Confirm exact eligibility and whether award is restricted to Ghanaian applicants.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Kofi A. Tawiah fund / Ashesi University' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Ashesi University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian students; award selection through Ashesi financial aid',
  ARRAY['Scholarship support; amount varies']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ashesi.edu.gh/scholarships/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'kofi-a-tawiah-scholarship-program-gh041'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'kofi-a-tawiah-scholarship-program-gh041'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'kofi-a-tawiah-scholarship-program-gh041'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [42/112] African Female Muslim Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'african-female-muslim-scholarship-gh042',
  'African Female Muslim Scholarship',
  'Confirm nationality, faith, gender, financial-need and application conditions with Ashesi.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'women'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ashesi University / donors' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Ashesi University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Female Muslim students from Africa; verify detailed criteria',
  ARRAY['Comprehensive scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ashesi.edu.gh/food-housing-legal-services-and-more-for-student-success/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'african-female-muslim-scholarship-gh042'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'african-female-muslim-scholarship-gh042'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'african-female-muslim-scholarship-gh042'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [43/112] Scholars for Impact Program (SIP)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'scholars-for-impact-program-sip-gh043',
  'Scholars for Impact Program (SIP)',
  'Confirm current intake and eligibility directly with Ashesi.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ashesi University / donors' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Ashesi University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Students selected for impact-oriented comprehensive scholarship; verify criteria',
  ARRAY['Comprehensive scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ashesi.edu.gh/food-housing-legal-services-and-more-for-student-success/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'scholars-for-impact-program-sip-gh043'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'scholars-for-impact-program-sip-gh043'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'scholars-for-impact-program-sip-gh043'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [44/112] Ashesi Emergency Scholarship / Emergency Financial Aid
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ashesi-emergency-scholarship-emergency-financial-aid-gh044',
  'Ashesi Emergency Scholarship / Emergency Financial Aid',
  'Emergency support is described by Ashesi; confirm process with Financial Aid Office.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ashesi University' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Ashesi University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Enrolled students facing unexpected financial hardship',
  ARRAY['Emergency support for tuition', 'housing', 'meals or related costs']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ashesi.edu.gh/support-schemes-for-students-from-low-income-families-3/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ashesi-emergency-scholarship-emergency-financial-aid-gh044'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ashesi-emergency-scholarship-emergency-financial-aid-gh044'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ashesi-emergency-scholarship-emergency-financial-aid-gh044'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [45/112] Dora Gertrude Quaye Memorial Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'dora-gertrude-quaye-memorial-scholarship-gh045',
  'Dora Gertrude Quaye Memorial Scholarship',
  'UHAS/GNA confirm active memorial scholarship. Confirm current application route and eligibility.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Professor Margaret Gyapong / donors' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Brilliant and needy female students at UHAS',
  ARRAY['Financial support; 2026 award total GHS36', '520 shared by six students']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.uhas.edu.gh/uhas/student-affairs/resource',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'dora-gertrude-quaye-memorial-scholarship-gh045'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'dora-gertrude-quaye-memorial-scholarship-gh045'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'dora-gertrude-quaye-memorial-scholarship-gh045'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [46/112] UHAS Student Financial Support Scheme (SFSS)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'uhas-student-financial-support-scheme-sfss-gh046',
  'UHAS Student Financial Support Scheme (SFSS)',
  'Policy includes proposed thresholds and annual October application start; confirm current board and call.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian full-time undergraduate/postgraduate students with financial need and academic progress',
  ARRAY['Full/partial scholarship', 'tuition support and accommodation concession under policy']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/sites/default/files/2026-03/UHAS-student-financial-support-scheme_171023.pdf',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'uhas-student-financial-support-scheme-sfss-gh046'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'uhas-student-financial-support-scheme-sfss-gh046'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'uhas-student-financial-support-scheme-sfss-gh046'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [47/112] UEW Vice-Chancellor's Scholarship Fund (VCSF)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'uew-vice-chancellor-s-scholarship-fund-vcsf-gh047',
  'UEW Vice-Chancellor''s Scholarship Fund (VCSF)',
  'Renewal requires GPA 2.50. The application is submitted through Faculty Dean/CODeL.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Education, Winneba' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Education, Winneba' LIMIT 1),
  TRUE,
  'other'::institution_category,
  FALSE,
  'Ghanaian undergraduate students on non-full-fee programmes with strong academics and financial need',
  ARRAY['Fees', 'feeding', 'accommodation', 'books and living allowances (full or partial)']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.uew.edu.gh/students/vice-chancellors-scholarship-fund',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'uew-vice-chancellor-s-scholarship-fund-vcsf-gh047'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'uew-vice-chancellor-s-scholarship-fund-vcsf-gh047'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'uew-vice-chancellor-s-scholarship-fund-vcsf-gh047'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [48/112] UCC General Bursary
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ucc-general-bursary-gh048',
  'UCC General Bursary',
  'UCC dashboard reports 2,610 awards and 1,933 beneficiaries across its financial-support history.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Cape Coast' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cape Coast' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UCC students meeting university financial-aid criteria',
  ARRAY['Bursary/fee support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://stufso.ucc.edu.gh/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ucc-general-bursary-gh048'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ucc-general-bursary-gh048'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ucc-general-bursary-gh048'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [49/112] Building Tomorrow Scholarship Scheme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'building-tomorrow-scholarship-scheme-gh049',
  'Building Tomorrow Scholarship Scheme',
  'UCC lists Building Tomorrow among donor schemes; request detailed eligibility and award package.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Building Tomorrow / UCC' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cape Coast' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UCC students; scheme-specific criteria to be confirmed',
  ARRAY['Donor-funded financial support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://stufso.ucc.edu.gh/partner',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'building-tomorrow-scholarship-scheme-gh049'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'building-tomorrow-scholarship-scheme-gh049'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'building-tomorrow-scholarship-scheme-gh049'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [50/112] UCC CoDE Student Support Scheme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ucc-code-student-support-scheme-gh050',
  'UCC CoDE Student Support Scheme',
  'UCC lists CoDE among donor schemes; confirm whether current awards are scholarships or bursaries.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'UCC College of Distance Education' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cape Coast' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Eligible UCC distance education students; criteria to be confirmed',
  ARRAY['Donor-funded financial support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://stufso.ucc.edu.gh/partner',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ucc-code-student-support-scheme-gh050'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ucc-code-student-support-scheme-gh050'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ucc-code-student-support-scheme-gh050'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [51/112] GNPC Scholarship Support at UCC
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'gnpc-scholarship-support-at-ucc-gh051',
  'GNPC Scholarship Support at UCC',
  'Listed as a donor scheme by UCC; avoid duplicating the national GNPC Foundation record in counts unless UCC award is a separate cohort.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'GNPC / UCC' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cape Coast' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UCC students meeting GNPC/UCC donor criteria; confirm discipline and nationality rules',
  ARRAY['Donor-funded scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://stufso.ucc.edu.gh/partner',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'gnpc-scholarship-support-at-ucc-gh051'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'gnpc-scholarship-support-at-ucc-gh051'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'gnpc-scholarship-support-at-ucc-gh051'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [52/112] Ghana Scholarships Secretariat Scholarship at UCC
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ghana-scholarships-secretariat-scholarship-at-ucc-gh052',
  'Ghana Scholarships Secretariat Scholarship at UCC',
  'Listed as Secretariat Scholarship on UCC donor page; may be delivery channel for national programme rather than separate award.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Scholarships Authority / UCC' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cape Coast' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Eligible Ghanaian students; authority criteria apply',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://stufso.ucc.edu.gh/partner',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ghana-scholarships-secretariat-scholarship-at-ucc-gh052'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ghana-scholarships-secretariat-scholarship-at-ucc-gh052'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ghana-scholarships-secretariat-scholarship-at-ucc-gh052'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [53/112] Ghana Chamber of Mines Tertiary Education Fund (GCM-TEF) Undergraduate Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ghana-chamber-of-mines-tertiary-education-fund-gcm-tef-undergraduate-scholarship-gh053',
  'Ghana Chamber of Mines Tertiary Education Fund (GCM-TEF) Undergraduate Scholarship',
  'Portal also lists postgraduate research grants and faculty research funds; distinguish student scholarship from grants.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Chamber of Mines' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Mines and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Undergraduate applicants; 70% brilliant-and-needy category and other categories',
  ARRAY['Tertiary scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://gcmtef.umat.edu.gh/',
  TRUE,
  TRUE,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ghana-chamber-of-mines-tertiary-education-fund-gcm-tef-undergraduate-scholarship-gh053'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ghana-chamber-of-mines-tertiary-education-fund-gcm-tef-undergraduate-scholarship-gh053'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ghana-chamber-of-mines-tertiary-education-fund-gcm-tef-undergraduate-scholarship-gh053'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [54/112] Ghana Chamber of Mines Postgraduate Research Grant
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ghana-chamber-of-mines-postgraduate-research-grant-gh054',
  'Ghana Chamber of Mines Postgraduate Research Grant',
  'Research grant rather than tuition scholarship; include in research funding category.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'grant'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Chamber of Mines' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Mines and Technology' LIMIT 1),
  TRUE,
  'other'::institution_category,
  FALSE,
  'Postgraduate researchers; exact eligibility in current call',
  ARRAY['Research grant']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://gcmtef.umat.edu.gh/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ghana-chamber-of-mines-postgraduate-research-grant-gh054'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ghana-chamber-of-mines-postgraduate-research-grant-gh054'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ghana-chamber-of-mines-postgraduate-research-grant-gh054'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [55/112] Gold Fields Ghana Foundation Scholarship and Bursary
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'gold-fields-ghana-foundation-scholarship-and-bursary-gh055',
  'Gold Fields Ghana Foundation Scholarship and Bursary',
  'Foundation confirms scheme since 2005 and tertiary focus; obtain current host-community list and application form.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Gold Fields Ghana Foundation' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  TRUE,
  'Students from mine host communities admitted to accredited public tertiary institutions',
  ARRAY['Scholarships and bursaries']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.goldfields-ghana.com/programmes-and-projects.php',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'gold-fields-ghana-foundation-scholarship-and-bursary-gh055'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'gold-fields-ghana-foundation-scholarship-and-bursary-gh055'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'gold-fields-ghana-foundation-scholarship-and-bursary-gh055'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [56/112] NADeF/Liebherr Excellence Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'nadef-liebherr-excellence-scholarship-gh056',
  'NADeF/Liebherr Excellence Scholarship',
  'Narrow community eligibility; verify 2027 cycle.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Newmont Ahafo Development Foundation and Liebherr Mining Ghana' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Validated residents of Newmont Ahafo mine communities, age 18–30, science-related UG/HND, first/second class',
  ARRAY['GHS10', '000 per recipient over programme duration; three awards']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Not stated / verify current cycle',
  'https://nadef.org/wp-content/uploads/2026/02/NADeF_Liebherr_Scholarship_Announcement_2026.pdf',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('diploma'::study_level), ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'nadef-liebherr-excellence-scholarship-gh056'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'nadef-liebherr-excellence-scholarship-gh056'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'nadef-liebherr-excellence-scholarship-gh056'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [57/112] Zijin Development Foundation / Newmont Ghana Community Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'zijin-development-foundation-newmont-ghana-community-scholarship-gh057',
  'Zijin Development Foundation / Newmont Ghana Community Scholarship',
  'UHAS lists Zijin Development Foundation; identify exact scheme name, geography and current application route.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Zijin Development Foundation (formerly Newmont Ghana)' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Students from eligible host communities; exact current criteria to confirm',
  ARRAY['Community scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'zijin-development-foundation-newmont-ghana-community-scholarship-gh057'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'zijin-development-foundation-newmont-ghana-community-scholarship-gh057'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'zijin-development-foundation-newmont-ghana-community-scholarship-gh057'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [58/112] Newmont Ahafo Community Scholarship (NADeF)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'newmont-ahafo-community-scholarship-nadef-gh058',
  'Newmont Ahafo Community Scholarship (NADeF)',
  'Avoid conflating with the separate NADeF/Liebherr Excellence Scholarship; request current general scholarship notice.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Newmont Ahafo Development Foundation' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Residents/indigenes from eligible communities; exact scheme-specific rules vary',
  ARRAY['Community education scholarships and bursaries']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://nadef.org/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'newmont-ahafo-community-scholarship-nadef-gh058'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'newmont-ahafo-community-scholarship-nadef-gh058'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'newmont-ahafo-community-scholarship-nadef-gh058'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [59/112] Tertiary Scholars' Aid (TSA) Project
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'tertiary-scholars-aid-tsa-project-gh059',
  'Tertiary Scholars'' Aid (TSA) Project',
  'Verify current geographic list and next application cycle.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Jubilee and TEN Joint Venture Partners: Tullow, Kosmos, PetroSA, GNPC and EXPLORCO' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'SHS graduates from 115+ coastal fishing communities in Western Region; selected districts',
  ARRAY['Comprehensive support including fees', 'laptop', 'accommodation and semester stipend']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'unannounced'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.tertiaryscholarsaid.org/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('shs'::study_level), ('vocational'::study_level), ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'tertiary-scholars-aid-tsa-project-gh059'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'tertiary-scholars-aid-tsa-project-gh059'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'tertiary-scholars-aid-tsa-project-gh059'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [60/112] Tullow Ghana Scholars' Aid Programme (SHS)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'tullow-ghana-scholars-aid-programme-shs-gh060',
  'Tullow Ghana Scholars'' Aid Programme (SHS)',
  'Different from the tertiary TSA project. Check current intake and whether the site remains the official application route.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Tullow Oil Ghana / Jubilee partners' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Ghanaian final-year JHS students from seven coastal districts in Western Region',
  ARRAY['Full study costs', 'learning materials and psychosocial support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.jubileescholarsaidgh.com/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('shs'::study_level), ('vocational'::study_level)) AS v(level) WHERE s.slug = 'tullow-ghana-scholars-aid-programme-shs-gh060'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'tullow-ghana-scholars-aid-programme-shs-gh060'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'tullow-ghana-scholars-aid-programme-shs-gh060'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [61/112] Pecan Inspire Scholarship Programme (PISP)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'pecan-inspire-scholarship-programme-pisp-gh061',
  'Pecan Inspire Scholarship Programme (PISP)',
  'Company reports 71/161 beneficiaries in different published updates; verify current application dates and reconcile cumulative counts.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Pecan Energies and partners including Lukoil Overseas Ghana Tano, GNPC and Fueltrade' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Brilliant students from low-income households, especially Western Region coastal communities; all genders',
  ARRAY['Full tuition', 'lodging', 'laptop', 'semester stipend', 'mentoring and career development']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.pecanenergiesscholarships.com/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'pecan-inspire-scholarship-programme-pisp-gh061'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'pecan-inspire-scholarship-programme-pisp-gh061'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'pecan-inspire-scholarship-programme-pisp-gh061'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [62/112] Pecan Energies–UPSA Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'pecan-energies-upsa-scholarship-gh062',
  'Pecan Energies–UPSA Scholarship',
  'Potentially a campus delivery stream of PISP; confirm whether separate award or same PISP before counting as a distinct scholarship.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Pecan Energies and UPSA' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Professional Studies, Accra' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Brilliant but underprivileged UPSA students; exact cohort criteria to confirm',
  ARRAY['Full tuition', 'hostel fees', 'semester stipend', 'laptop', 'career guidance and mentoring']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://upsa.edu.gh/upsa-pecan-energies-partner-to-award-scholarships-to-outstanding-students/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'pecan-energies-upsa-scholarship-gh062'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'pecan-energies-upsa-scholarship-gh062'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'pecan-energies-upsa-scholarship-gh062'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [63/112] CAMFED Ghana Bursary / Learner Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'camfed-ghana-bursary-learner-support-gh063',
  'CAMFED Ghana Bursary / Learner Support',
  'CAMFED is a broad education programme; verify exact Ghana tertiary award before publishing as a scholarship listing.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'women'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Campaign for Female Education (CAMFED)' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Girls and young women from disadvantaged communities; programme-specific eligibility',
  ARRAY['Education support and transition assistance; package varies']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://camfed.org/ghana/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('shs'::study_level), ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'camfed-ghana-bursary-learner-support-gh063'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'camfed-ghana-bursary-learner-support-gh063'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'camfed-ghana-bursary-learner-support-gh063'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [64/112] West African Gas Pipeline Company (WAPCo) Scholarship Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'west-african-gas-pipeline-company-wapco-scholarship-support-gh064',
  'West African Gas Pipeline Company (WAPCo) Scholarship Support',
  'UHAS lists WAPCo among institutions supporting students; obtain actual scheme notice and eligibility.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'West African Gas Pipeline Company' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Students in eligible communities or partner institutions; exact criteria not found',
  ARRAY['Scholarship support reported by UHAS']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'west-african-gas-pipeline-company-wapco-scholarship-support-gh064'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'west-african-gas-pipeline-company-wapco-scholarship-support-gh064'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'west-african-gas-pipeline-company-wapco-scholarship-support-gh064'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [65/112] Ghana National Gas Company Scholarship Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ghana-national-gas-company-scholarship-support-gh065',
  'Ghana National Gas Company Scholarship Support',
  'Need direct company announcement or university application notice before marking verified.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana National Gas Company' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Students in eligible communities/institutions; exact criteria not found',
  ARRAY['Scholarship support reported by UHAS']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ghana-national-gas-company-scholarship-support-gh065'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ghana-national-gas-company-scholarship-support-gh065'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ghana-national-gas-company-scholarship-support-gh065'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [66/112] Volta River Authority Scholarship Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'volta-river-authority-scholarship-support-gh066',
  'Volta River Authority Scholarship Support',
  'Request direct VRA/University call; do not publish an Apply Now link yet.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Volta River Authority' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Eligible students; detailed rules not retrieved',
  ARRAY['Scholarship support reported by UHAS']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'volta-river-authority-scholarship-support-gh066'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'volta-river-authority-scholarship-support-gh066'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'volta-river-authority-scholarship-support-gh066'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [67/112] Karpowership Ghana Scholarship Opportunity
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'karpowership-ghana-scholarship-opportunity-gh067',
  'Karpowership Ghana Scholarship Opportunity',
  'TTU lists as programme-specific opportunity. Need original provider call.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Karpowership' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Takoradi Technical University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Programme-specific eligibility and regional conditions to be confirmed',
  ARRAY['Scholarship opportunity; package not published in directory']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ttu.edu.gh/scholarships/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'karpowership-ghana-scholarship-opportunity-gh067'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'karpowership-ghana-scholarship-opportunity-gh067'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'karpowership-ghana-scholarship-opportunity-gh067'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [68/112] Pecan Energies TTU Scholarship Opportunity
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'pecan-energies-ttu-scholarship-opportunity-gh068',
  'Pecan Energies TTU Scholarship Opportunity',
  'May overlap with PISP; confirm separate TTU cohort.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Pecan Energies' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Takoradi Technical University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Regional/local-content eligibility to be confirmed',
  ARRAY['Scholarship support; package not published in directory']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ttu.edu.gh/scholarships/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'pecan-energies-ttu-scholarship-opportunity-gh068'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'pecan-energies-ttu-scholarship-opportunity-gh068'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'pecan-energies-ttu-scholarship-opportunity-gh068'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [69/112] Passico Ghana Scholarship Opportunity
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'passico-ghana-scholarship-opportunity-gh069',
  'Passico Ghana Scholarship Opportunity',
  'Need provider announcement and current application link.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Passico Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Takoradi Technical University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Programme-specific eligibility to be confirmed',
  ARRAY['Scholarship support; package not published in directory']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ttu.edu.gh/scholarships/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'passico-ghana-scholarship-opportunity-gh069'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'passico-ghana-scholarship-opportunity-gh069'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'passico-ghana-scholarship-opportunity-gh069'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [70/112] Yinson Foundation Scholarship Opportunity
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'yinson-foundation-scholarship-opportunity-gh070',
  'Yinson Foundation Scholarship Opportunity',
  'Need provider announcement and current application link.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Yinson Foundation' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Takoradi Technical University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Programme-specific eligibility to be confirmed',
  ARRAY['Scholarship support; package not published in directory']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ttu.edu.gh/scholarships/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'yinson-foundation-scholarship-opportunity-gh070'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'yinson-foundation-scholarship-opportunity-gh070'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'yinson-foundation-scholarship-opportunity-gh070'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [71/112] Akua Kuenyehia Foundation Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'akua-kuenyehia-foundation-scholarship-gh071',
  'Akua Kuenyehia Foundation Scholarship',
  'User document provides detailed eligibility; verify directly with foundation and confirm whether intake is currently open.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'women'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Akua Kuenyehia Foundation' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian girls/women; academic merit, financial need and extracurricular engagement',
  ARRAY['Scholarship and mentorship']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://akuakuenyehiafoundation.org/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('shs'::study_level), ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'akua-kuenyehia-foundation-scholarship-gh071'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'akua-kuenyehia-foundation-scholarship-gh071'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'akua-kuenyehia-foundation-scholarship-gh071'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [72/112] Marian Kwofie Foundation Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'marian-kwofie-foundation-scholarship-gh072',
  'Marian Kwofie Foundation Scholarship',
  'User document''s criteria resemble Akua Kuenyehia text; independently confirm that copied criteria are accurate.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Marian Kwofie Foundation' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Ghanaian female students; need and academic merit',
  ARRAY['Financial assistance and mentorship']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.mariankwofiefoundation.com/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('shs'::study_level), ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'marian-kwofie-foundation-scholarship-gh072'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'marian-kwofie-foundation-scholarship-gh072'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'marian-kwofie-foundation-scholarship-gh072'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [73/112] The Rebecca Foundation Education Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'the-rebecca-foundation-education-support-gh073',
  'The Rebecca Foundation Education Support',
  'Do not advertise as a general tertiary scholarship until a specific award/call is confirmed.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'women'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'The Rebecca Foundation' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Girls; detailed education programme criteria to confirm',
  ARRAY['Education access support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://therebeccafoundationghana.org/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'the-rebecca-foundation-education-support-gh073'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'the-rebecca-foundation-education-support-gh073'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'the-rebecca-foundation-education-support-gh073'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [74/112] Joseph and Elizabeth Quansah (J&E Quansah) Foundation Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'joseph-and-elizabeth-quansah-j-e-quansah-foundation-scholarship-gh074',
  'Joseph and Elizabeth Quansah (J&E Quansah) Foundation Scholarship',
  'Verify very low income thresholds and current call directly with foundation before publication.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'J&E Quansah Foundation' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Ghanaian SHS graduates admitted to tertiary institutions and enrolled university students; academic merit and financial need',
  ARRAY['Tuition', 'residential support and laptops']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.jequansahfoundation.org/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('shs'::study_level), ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'joseph-and-elizabeth-quansah-j-e-quansah-foundation-scholarship-gh074'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'joseph-and-elizabeth-quansah-j-e-quansah-foundation-scholarship-gh074'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'joseph-and-elizabeth-quansah-j-e-quansah-foundation-scholarship-gh074'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [75/112] Alice Dede Foundation Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'alice-dede-foundation-scholarship-gh075',
  'Alice Dede Foundation Scholarship',
  'Do not publish Apply Now. The source document contains an unrelated ''Canon printer ink'' placeholder.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'women'::gender_eligibility,
  'under_review'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Alice Dede Foundation' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Underprivileged girls; academic merit and leadership potential',
  ARRAY['Scholarship and mentorship']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  NULL,
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'alice-dede-foundation-scholarship-gh075'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'alice-dede-foundation-scholarship-gh075'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'alice-dede-foundation-scholarship-gh075'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [76/112] Otumfuo Osei Tutu II Foundation Education Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'otumfuo-osei-tutu-ii-foundation-education-scholarship-gh076',
  'Otumfuo Osei Tutu II Foundation Education Scholarship',
  'User document lists documents but does not establish current opening dates or current scope.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Otumfuo Osei Tutu II Foundation' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Needy students; exact geographic and academic criteria need confirmation',
  ARRAY['Education scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://otumfuofoundation.org.gh/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('shs'::study_level), ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'otumfuo-osei-tutu-ii-foundation-education-scholarship-gh076'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'otumfuo-osei-tutu-ii-foundation-education-scholarship-gh076'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'otumfuo-osei-tutu-ii-foundation-education-scholarship-gh076'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [77/112] KGL Foundation Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'kgl-foundation-scholarship-gh077',
  'KGL Foundation Scholarship',
  'Verify exact academic thresholds, whether postgraduate eligibility applies, award amount and application window.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KGL Foundation' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Brilliant but needy new undergraduates and continuing students; user source cites aggregate <=30 and continuing GPA 3.0',
  ARRAY['Financial scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://kglfoundation.org/grant-details',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'kgl-foundation-scholarship-gh077'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'kgl-foundation-scholarship-gh077'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'kgl-foundation-scholarship-gh077'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [78/112] Brighter Investment Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'brighter-investment-scholarship-gh078',
  'Brighter Investment Scholarship',
  'Confirm the scheme exists and is currently offered; do not publish until direct evidence is obtained.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'under_review'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Brighter Investment' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Ghanaian students; source document lists ID, proof of education and employment',
  ARRAY['Financial assistance (amount not stated)']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.brighterinvestment.com/home',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'brighter-investment-scholarship-gh078'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'brighter-investment-scholarship-gh078'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'brighter-investment-scholarship-gh078'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [79/112] Anonymous Hope Fund Scholarship for Aspiring African Students
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'anonymous-hope-fund-scholarship-for-aspiring-african-students-gh079',
  'Anonymous Hope Fund Scholarship for Aspiring African Students',
  'Verify legal identity, award history, funding terms and whether applications are genuinely free before listing.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'under_review'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Anonymous Hope Fund' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'African citizens aged 17–30 with financial need; study at recognised university/college/vocational school',
  ARRAY['Financial assistance; amount to confirm']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://ahfgrants.com/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('vocational'::study_level), ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'anonymous-hope-fund-scholarship-for-aspiring-african-students-gh079'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'anonymous-hope-fund-scholarship-for-aspiring-african-students-gh079'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'anonymous-hope-fund-scholarship-for-aspiring-african-students-gh079'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [80/112] Otumfuo Education Fund / Otumfuo Education Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'otumfuo-education-fund-otumfuo-education-support-gh080',
  'Otumfuo Education Fund / Otumfuo Education Support',
  'Do not count separately unless foundation confirms a distinct named fund.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Otumfuo Osei Tutu II Foundation' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Students in need; specific current programme rules to confirm',
  ARRAY['Educational support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://otumfuofoundation.org.gh/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'otumfuo-education-fund-otumfuo-education-support-gh080'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'otumfuo-education-fund-otumfuo-education-support-gh080'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'otumfuo-education-fund-otumfuo-education-support-gh080'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [81/112] Kufuor Scholars Program
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'kufuor-scholars-program-gh081',
  'Kufuor Scholars Program',
  'Classify as leadership scholarship/fellowship only if funding/award terms are confirmed.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'John A. Kufuor Foundation' LIMIT 1),
  NULL,
  FALSE,
  'public_university'::institution_category,
  FALSE,
  'Young Ghanaian university students with leadership, academic and national-development potential',
  ARRAY['Leadership development', 'mentorship and programme support; not necessarily tuition funding']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://kufuorfoundation.org/kufuor-scholars-program-ksp/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'kufuor-scholars-program-gh081'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'kufuor-scholars-program-gh081'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'kufuor-scholars-program-gh081'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [82/112] Florence Nkrumah Onny Memorial Fund
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'florence-nkrumah-onny-memorial-fund-gh082',
  'Florence Nkrumah Onny Memorial Fund',
  'Ask GCTU Financial Aid Office to confirm current existence, award terms and application route.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Florence Nkrumah Onny Memorial Fund' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Ghana Communication Technology University' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Continuing GTUC students with financial need in diploma, undergraduate and postgraduate studies',
  ARRAY['Partial/full support for tuition', 'accommodation and academic expenses']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://site.gctu.edu.gh/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('diploma'::study_level), ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'florence-nkrumah-onny-memorial-fund-gh082'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'florence-nkrumah-onny-memorial-fund-gh082'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'florence-nkrumah-onny-memorial-fund-gh082'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [83/112] Barclays Tertiary Scholarship (historical)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'barclays-tertiary-scholarship-historical-gh083',
  'Barclays Tertiary Scholarship (historical)',
  'Do not publish as active. Verify with UPSA; Barclays Ghana operations were rebranded to Absa.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Barclays Bank Ghana / UPSA' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Professional Studies, Accra' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian continuing UPSA students, levels 200–400, GPA 3.0+, financial need',
  ARRAY['One academic year scholarship; amount not stated']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://upsa.edu.gh/academics/financial-aid-services/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'barclays-tertiary-scholarship-historical-gh083'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'barclays-tertiary-scholarship-historical-gh083'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'barclays-tertiary-scholarship-historical-gh083'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [84/112] African Female STEM Scholarship – WAAW Foundation
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'african-female-stem-scholarship-waaw-foundation-gh084',
  'African Female STEM Scholarship – WAAW Foundation',
  'Not Ghana-only but Ghanaian students studying in Ghana are eligible if current criteria met.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'women'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Working to Advance STEM Education for African Women (WAAW)' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Female African undergraduates in STEM, usually years 1–2/third year in five-year programme; need and leadership',
  ARRAY['Annual scholarship support; amount varies']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://waawfoundation.org/scholarship/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'african-female-stem-scholarship-waaw-foundation-gh084'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'african-female-stem-scholarship-waaw-foundation-gh084'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'african-female-stem-scholarship-waaw-foundation-gh084'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [85/112] IsDB Scholarship Programme
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'isdb-scholarship-programme-gh085',
  'IsDB Scholarship Programme',
  'Not a Ghana-funded award; include in Ghana-eligible international opportunities category, not domestic-only.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Islamic Development Bank' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Citizens of IsDB member countries including Ghana; programme-specific religious/field criteria',
  ARRAY['Tuition', 'stipend and related support depending on programme']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.isdb.org/scholarships',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('vocational'::study_level), ('undergraduate'::study_level), ('postgraduate'::study_level), ('masters'::study_level), ('phd'::study_level)) AS v(level) WHERE s.slug = 'isdb-scholarship-programme-gh085'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'isdb-scholarship-programme-gh085'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'isdb-scholarship-programme-gh085'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [86/112] Zawadi Africa Educational Fund
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'zawadi-africa-educational-fund-gh086',
  'Zawadi Africa Educational Fund',
  'Confirm current Ghana participation and application cycle before publishing as Ghana opportunity.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'needs_verification'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Zawadi Africa Educational Fund' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Young African women; user document names Ghana, Kenya and Uganda; current country eligibility to confirm',
  ARRAY['Higher education scholarship and leadership development']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.zawadiafrica.org/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'zawadi-africa-educational-fund-gh086'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'zawadi-africa-educational-fund-gh086'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'zawadi-africa-educational-fund-gh086'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [87/112] African Science Academy Full Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'african-science-academy-full-scholarship-gh087',
  'African Science Academy Full Scholarship',
  'This is a school-placement scholarship, not a general tertiary scholarship. Classify separately.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'African Gifted Foundation / African Science Academy' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Academically gifted young women from across Africa with strong maths/science aptitude',
  ARRAY['Full scholarship for STEM-focused education']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.africangifted.org/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('shs'::study_level)) AS v(level) WHERE s.slug = 'african-science-academy-full-scholarship-gh087'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'african-science-academy-full-scholarship-gh087'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'african-science-academy-full-scholarship-gh087'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [88/112] YALI Regional Leadership Center West Africa – Ghana
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'yali-regional-leadership-center-west-africa-ghana-gh088',
  'YALI Regional Leadership Center West Africa – Ghana',
  'Classify as funded training/fellowship, not tertiary tuition scholarship.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'YALI RLC West Africa / GIMPA' LIMIT 1),
  NULL,
  FALSE,
  'other'::institution_category,
  FALSE,
  'Young West African leaders aged 18–35 from eligible countries',
  ARRAY['Sponsored leadership training; cohort terms vary']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://yaliwestafrica.net/rlc/index.php/apply-now/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'yali-regional-leadership-center-west-africa-ghana-gh088'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'yali-regional-leadership-center-west-africa-ghana-gh088'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'yali-regional-leadership-center-west-africa-ghana-gh088'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [89/112] Financial Support Scholarship – UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'financial-support-scholarship-uhas-gh089',
  'Financial Support Scholarship – UHAS',
  'Generic line item; request named donor and current rules before publishing as a separate award.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'UHAS / individual donors' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UHAS students with demonstrated financial need; exact criteria to confirm',
  ARRAY['Financial support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'financial-support-scholarship-uhas-gh089'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'financial-support-scholarship-uhas-gh089'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'financial-support-scholarship-uhas-gh089'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [90/112] Ghana Education Trust Fund Scholarship Support at UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ghana-education-trust-fund-scholarship-support-at-uhas-gh090',
  'Ghana Education Trust Fund Scholarship Support at UHAS',
  'Do not count as separate national award; retain as UHAS application channel note.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'GETFund / UHAS' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UHAS students who meet GETFund criteria',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ghana-education-trust-fund-scholarship-support-at-uhas-gh090'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ghana-education-trust-fund-scholarship-support-at-uhas-gh090'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ghana-education-trust-fund-scholarship-support-at-uhas-gh090'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [91/112] GNPC Scholarship Support at UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'gnpc-scholarship-support-at-uhas-gh091',
  'GNPC Scholarship Support at UHAS',
  'Do not count separately from GNPC Foundation Local Scholarship.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'GNPC Foundation / UHAS' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UHAS students who meet GNPC criteria',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'gnpc-scholarship-support-at-uhas-gh091'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'gnpc-scholarship-support-at-uhas-gh091'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'gnpc-scholarship-support-at-uhas-gh091'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [92/112] MTN Scholarship Support at UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'mtn-scholarship-support-at-uhas-gh092',
  'MTN Scholarship Support at UHAS',
  'Do not count separately from MTN Bright Scholarship.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'MTN Ghana Foundation / UHAS' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UHAS students who meet MTN Foundation criteria',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'mtn-scholarship-support-at-uhas-gh092'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'mtn-scholarship-support-at-uhas-gh092'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'mtn-scholarship-support-at-uhas-gh092'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [93/112] CAMFED Scholarship Support at UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'camfed-scholarship-support-at-uhas-gh093',
  'CAMFED Scholarship Support at UHAS',
  'Potential duplicate of CAMFED Ghana programme. Merge after confirmation.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'CAMFED / UHAS' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Eligible female students; exact cohort criteria to confirm',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'camfed-scholarship-support-at-uhas-gh093'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'camfed-scholarship-support-at-uhas-gh093'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'camfed-scholarship-support-at-uhas-gh093'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [94/112] Gold Fields Scholarship Support at UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'gold-fields-scholarship-support-at-uhas-gh094',
  'Gold Fields Scholarship Support at UHAS',
  'Do not count separately from Gold Fields Ghana Foundation Scholarship.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Gold Fields Ghana Foundation / UHAS' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Students from eligible Gold Fields host communities; exact campus criteria to confirm',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'gold-fields-scholarship-support-at-uhas-gh094'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'gold-fields-scholarship-support-at-uhas-gh094'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'gold-fields-scholarship-support-at-uhas-gh094'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [95/112] Volta River Authority Scholarship Support at UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'volta-river-authority-scholarship-support-at-uhas-gh095',
  'Volta River Authority Scholarship Support at UHAS',
  'Potential duplicate of VRA scholarship support record above; consolidate.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'VRA / UHAS' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Eligible students; criteria not retrieved',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'volta-river-authority-scholarship-support-at-uhas-gh095'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'volta-river-authority-scholarship-support-at-uhas-gh095'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'volta-river-authority-scholarship-support-at-uhas-gh095'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [96/112] Ghana National Gas Company Scholarship Support at UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ghana-national-gas-company-scholarship-support-at-uhas-gh096',
  'Ghana National Gas Company Scholarship Support at UHAS',
  'Potentially a distinct company award; need direct notice.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana National Gas Company / UHAS' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Eligible students; criteria not retrieved',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ghana-national-gas-company-scholarship-support-at-uhas-gh096'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ghana-national-gas-company-scholarship-support-at-uhas-gh096'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ghana-national-gas-company-scholarship-support-at-uhas-gh096'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [97/112] Zijin Development Foundation Scholarship Support at UHAS
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'zijin-development-foundation-scholarship-support-at-uhas-gh097',
  'Zijin Development Foundation Scholarship Support at UHAS',
  'Confirm exact programme and whether same as Newmont/NADeF community scholarship.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Zijin Development Foundation / UHAS' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Eligible students from relevant communities; criteria not retrieved',
  ARRAY['Scholarship support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'zijin-development-foundation-scholarship-support-at-uhas-gh097'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'zijin-development-foundation-scholarship-support-at-uhas-gh097'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'zijin-development-foundation-scholarship-support-at-uhas-gh097'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [98/112] UCC Secretariat Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ucc-secretariat-scholarship-gh098',
  'UCC Secretariat Scholarship',
  'UCC reports 404 historical awards; treat as campus-administered Secretariat route, not separate national scheme.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Ghana Scholarships Authority / UCC' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cape Coast' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UCC students who meet Secretariat criteria',
  ARRAY['Historical donor-funded awards']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://stufso.ucc.edu.gh/partner',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ucc-secretariat-scholarship-gh098'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ucc-secretariat-scholarship-gh098'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ucc-secretariat-scholarship-gh098'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [99/112] UCC Building Tomorrow (BTOM) Student Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ucc-building-tomorrow-btom-student-support-gh099',
  'UCC Building Tomorrow (BTOM) Student Support',
  'Potential duplicate of Building Tomorrow record; merge duplicate records in production.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Building Tomorrow / UCC' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cape Coast' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UCC students; detailed selection criteria not published on partner page',
  ARRAY['Donor-funded student support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://stufso.ucc.edu.gh/partner',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ucc-building-tomorrow-btom-student-support-gh099'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ucc-building-tomorrow-btom-student-support-gh099'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ucc-building-tomorrow-btom-student-support-gh099'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [100/112] UCC CoDE Donor Support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ucc-code-donor-support-gh100',
  'UCC CoDE Donor Support',
  'Potential duplicate of UCC CoDE Student Support Scheme; merge.',
  'Imported from user''s original register. Record type=Scholarship. Review duplicate/lead flags before public display.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'UCC College of Distance Education' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Cape Coast' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Distance education students; scheme rules not published',
  ARRAY['Donor-funded support']::text[],
  ARRAY['Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://stufso.ucc.edu.gh/partner',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'ucc-code-donor-support-gh100'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ucc-code-donor-support-gh100'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ucc-code-donor-support-gh100'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [101/112] Nana Osae Nyampong VI’s Legacy Scholarship (UG)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'nana-osae-nyampong-vi-s-legacy-scholarship-ug-new',
  'Nana Osae Nyampong VI’s Legacy Scholarship (UG)',
  '2026/2027 call supports disadvantaged UGBS undergraduates resident in Commonwealth Hall; published eligibility includes financial need and academic threshold.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Ghana Students Financial Aid Office' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Regular/fee-paying UGBS student on Main Campus; Commonwealth Hall resident; demonstrate financial need; Level 100 WASSCE grade 10 or better (check full notice).',
  ARRAY['Tuition', 'accommodation and stipend']::text[],
  ARRAY['Admission letter', 'proof of registration', 'academic records', 'recommendation letters', 'siblings’ birth certificates', 'parent/guardian income evidence']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026, 3:00pm',
  'https://www.ug.edu.gh/financialaid/node/80',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'nana-osae-nyampong-vi-s-legacy-scholarship-ug-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('business-management') WHERE s.slug = 'nana-osae-nyampong-vi-s-legacy-scholarship-ug-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'nana-osae-nyampong-vi-s-legacy-scholarship-ug-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [102/112] UGBS Scholars’ Scholarship (2026/27)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ugbs-scholars-scholarship-2026-27-new',
  'UGBS Scholars’ Scholarship (2026/27)',
  'UG SFAO lists a 2026/2027 UGBS Scholars’ Scholarship call dated 30 July 2026. The individual call page should be checked for detailed terms.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'unannounced'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Ghana Business School / UG Students Financial Aid Office' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UGBS students; detailed year, grade and need criteria must be confirmed from the call.',
  ARRAY['Financial support; amount/package not stated in directory snippet']::text[],
  ARRAY['Not stated; check current call']::text[],
  NULL,
  'unannounced'::deadline_type,
  'and eligibility details require confirmation',
  'https://www.ug.edu.gh/financialaid/home',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ugbs-scholars-scholarship-2026-27-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('business-management') WHERE s.slug = 'ugbs-scholars-scholarship-2026-27-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ugbs-scholars-scholarship-2026-27-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [103/112] UG Sponsorship / SRC Yi Bi Boa Scholarship (2026/27)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'ug-sponsorship-src-yi-bi-boa-scholarship-2026-27-new',
  'UG Sponsorship / SRC Yi Bi Boa Scholarship (2026/27)',
  'UG SFAO lists the 2026/27 UG Sponsorship / SRC Yi Bi Boa application and renewal call dated 30 June 2026.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Ghana Students Financial Aid Office and UG SRC' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UG students; specific eligibility and renewal conditions must be checked in the call.',
  ARRAY['Sponsorship / financial aid; exact package not stated']::text[],
  ARRAY['Not stated; check current call']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://www.ug.edu.gh/financialaid/home',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'ug-sponsorship-src-yi-bi-boa-scholarship-2026-27-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'ug-sponsorship-src-yi-bi-boa-scholarship-2026-27-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'ug-sponsorship-src-yi-bi-boa-scholarship-2026-27-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [104/112] One Student One Laptop Initiative (2026/27)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'one-student-one-laptop-initiative-2026-27-new',
  'One Student One Laptop Initiative (2026/27)',
  'A university-listed device support initiative. Included for student funding discovery but is not a cash scholarship.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'unannounced'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'University of Ghana Students Financial Aid Office' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UG students meeting the initiative’s published eligibility; confirm current criteria.',
  ARRAY['Laptop/device support; not tuition funding']::text[],
  ARRAY['Not stated; check official call']::text[],
  NULL,
  'unannounced'::deadline_type,
  'and detailed eligibility require confirmation',
  'https://www.ug.edu.gh/financialaid/initiative/20262027-call-application-one-student-one-laptop-initiative',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'one-student-one-laptop-initiative-2026-27-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'one-student-one-laptop-initiative-2026-27-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'one-student-one-laptop-initiative-2026-27-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [105/112] Educational Pathways International (EPI) Scholarship at KNUST (2026/27)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'educational-pathways-international-epi-scholarship-at-knust-2026-27-new',
  'Educational Pathways International (EPI) Scholarship at KNUST (2026/27)',
  'Four-year scholarship for brilliant but needy Ghanaian first- and second-year KNUST students. Current call published 12 Nov 2026.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Educational Pathways International / KNUST' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian full-time first- or second-year KNUST student; first years WASSCE aggregate 10 or better; continuing students CWA 67+; financial need; restrictions apply to other scholarships.',
  ARRAY['Scholarship support; full package details in call']::text[],
  ARRAY['Admission letter', 'WASSCE results', 'SHS transcripts', 'university transcript for continuing students', 'two recommendation letters', 'awards/certificates', 'three essays']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026',
  'https://www.knust.edu.gh/announcements/general/call-applications-educational-pathways-international-epi-scholarship-20262027-academic-year',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'educational-pathways-international-epi-scholarship-at-knust-2026-27-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'educational-pathways-international-epi-scholarship-at-knust-2026-27-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'educational-pathways-international-epi-scholarship-at-knust-2026-27-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [106/112] Fondazione Edu Scholarship at KNUST (2026/27)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'fondazione-edu-scholarship-at-knust-2026-27-new',
  'Fondazione Edu Scholarship at KNUST (2026/27)',
  'Fondazione Edu supports brilliant but needy KNUST students. Current call published 12 Nov 2026.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'open'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Fondazione Edu / KNUST' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Kwame Nkrumah University of Science and Technology' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian regular full-time first- or second-year KNUST student; first years WASSCE aggregate 12 or better; continuing students CWA 65+; financial need; other-scholarship cap applies.',
  ARRAY['Tuition', 'books', 'accommodation and stipend (per UG directory; confirm exact award)']::text[],
  ARRAY['Admission letter', 'WASSCE results', 'SHS transcripts', 'university transcript for continuing students', 'two recommendation letters', 'birth certificates/ID and parent income evidence', 'two essays']::text[],
  '2026-11-27'::date,
  'fixed'::deadline_type,
  '27 Nov 2026',
  'https://www.knust.edu.gh/announcements/general/call-applications-fondazione-edu-scholarship-20262027-academic-year',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'fondazione-edu-scholarship-at-knust-2026-27-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'fondazione-edu-scholarship-at-knust-2026-27-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'fondazione-edu-scholarship-at-knust-2026-27-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [107/112] Educational Pathways International (EPI) Scholarship at UDS (2026/27)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'educational-pathways-international-epi-scholarship-at-uds-2026-27-new',
  'Educational Pathways International (EPI) Scholarship at UDS (2026/27)',
  'UDS 2026/27 call describes EPI support for academically strong Ghanaian students with financial need.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'closed'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Educational Pathways International / University for Development Studies' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University for Development Studies' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Ghanaian full-time Level 100/200 UDS student; CGPA 3.6+ for continuing students; WASSCE aggregate 11 or better; financial need; no concurrent scholarship; service/work conditions apply.',
  ARRAY['Scholarship support; check programme page for full package']::text[],
  ARRAY['Application form and undertakings', 'WASSCE/SHS records', 'admission and registration proof', 'university transcript (Level 200)', 'recommendations', 'financial-need evidence', 'three essays']::text[],
  '2026-10-19'::date,
  'fixed'::deadline_type,
  '19 Oct 2026',
  'https://www.uds.edu.gh/announcements/call-for-applications-educational-pathways-international-epi-scholarship',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'educational-pathways-international-epi-scholarship-at-uds-2026-27-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'educational-pathways-international-epi-scholarship-at-uds-2026-27-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'educational-pathways-international-epi-scholarship-at-uds-2026-27-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [108/112] Founder’s STEM Scholarship
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'founder-s-stem-scholarship-new',
  'Founder’s STEM Scholarship',
  'Fully funded undergraduate scholarship designed to support an exceptional female student pursuing a STEM degree at Lancaster University Ghana.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'fully_funded'::funding_type,
  'rolling'::application_status,
  'women'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Lancaster University Ghana / Transnational Academic Group' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Lancaster University Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Exceptional female applicant with strong interest in undergraduate STEM; verify current intake and detailed academic criteria.',
  ARRAY['Fully funded; precise inclusions to confirm with university']::text[],
  ARRAY['Not stated on directory page; request current call']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://lancaster.edu.gh/study/scholarships-and-bursaries/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'founder-s-stem-scholarship-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('engineering', 'science', 'computer-science-it') WHERE s.slug = 'founder-s-stem-scholarship-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'founder-s-stem-scholarship-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [109/112] TAG Ghana Scholarships
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'tag-ghana-scholarships-new',
  'TAG Ghana Scholarships',
  'Lancaster University Ghana lists TAG Ghana Scholarships among its scholarship and bursary opportunities.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'bursary'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Transnational Academic Group (TAG) Ghana / Lancaster University Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Lancaster University Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Applicants to Lancaster University Ghana; eligibility, award levels and intake-specific conditions must be confirmed.',
  ARRAY['Scholarship/bursary support; package not stated']::text[],
  ARRAY['Not stated; check official call']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://lancaster.edu.gh/study/scholarships-and-bursaries/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'tag-ghana-scholarships-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'tag-ghana-scholarships-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'tag-ghana-scholarships-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [110/112] KGL Foundation Scholarship at Lancaster University Ghana
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'kgl-foundation-scholarship-at-lancaster-university-ghana-new',
  'KGL Foundation Scholarship at Lancaster University Ghana',
  'KGL Foundation scholarships are listed by Lancaster University Ghana as supporting academic excellence, financial need and community growth.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'KGL Foundation / Lancaster University Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'Lancaster University Ghana' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'Students meeting KGL Foundation and Lancaster University Ghana criteria; obtain current call for exact requirements.',
  ARRAY['Financial support and developmental opportunities; amount/package not stated']::text[],
  ARRAY['Not stated; check official call']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://lancaster.edu.gh/study/scholarships-and-bursaries/',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level), ('postgraduate'::study_level)) AS v(level) WHERE s.slug = 'kgl-foundation-scholarship-at-lancaster-university-ghana-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'kgl-foundation-scholarship-at-lancaster-university-ghana-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'kgl-foundation-scholarship-at-lancaster-university-ghana-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [111/112] Tertiary Education Scholarship Trust, Ghana (TES Ghana) support
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'tertiary-education-scholarship-trust-ghana-tes-ghana-support-new',
  'Tertiary Education Scholarship Trust, Ghana (TES Ghana) support',
  'UHAS lists TES Ghana among institutions supporting its students. This is a provider lead, not a verified open call; confirm award name and direct application route.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Tertiary Education Scholarship Trust, Ghana' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UHAS students may be eligible; detailed criteria not published in the cited directory.',
  ARRAY['Tuition fee support']::text[],
  ARRAY['Not stated; obtain from UHAS/TES Ghana']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'tertiary-education-scholarship-trust-ghana-tes-ghana-support-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'tertiary-education-scholarship-trust-ghana-tes-ghana-support-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'tertiary-education-scholarship-trust-ghana-tes-ghana-support-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;

-- [112/112] Dora Gertrude Quaye Memorial Scholarship (UHAS)
INSERT INTO scholarships (
  id, slug, name, short_description, full_description,
  geographic_scope, funding_type, application_status, gender_eligibility,
  verification_status, provider_id, institution_id, institution_specific,
  institution_category_restriction, public_school_specific, eligibility_requirements,
  benefits, required_documents, application_deadline, deadline_type,
  deadline_text, application_url, is_published, is_featured, created_at
) VALUES (
  extensions.uuid_generate_v4(),
  'dora-gertrude-quaye-memorial-scholarship-uhas-new',
  'Dora Gertrude Quaye Memorial Scholarship (UHAS)',
  'UHAS lists the Dora Gertrude Quaye Memorial Scholarship in its financial-aid directory. Confirm the current award notice and exact criteria.',
  'New record added from official institutional/provider page during this research. Confirm live intake before publishing as currently open.',
  'local'::geographic_scope,
  'partially_funded'::funding_type,
  'rolling'::application_status,
  'all'::gender_eligibility,
  'verified'::verification_status,
  (SELECT id FROM scholarship_providers WHERE name = 'Professor Margaret Gyapong / donors' LIMIT 1),
  (SELECT id FROM institutions WHERE name = 'University of Health and Allied Sciences' LIMIT 1),
  TRUE,
  'public_university'::institution_category,
  FALSE,
  'UHAS students; eligibility details and application process require direct confirmation.',
  ARRAY['Tuition fee support']::text[],
  ARRAY['Not stated; check UHAS financial aid office']::text[],
  NULL,
  'rolling'::deadline_type,
  'Not stated / verify current cycle',
  'https://uhas.edu.gh/uhas/financial-aid',
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
SELECT s.id, v.level FROM scholarships s CROSS JOIN (VALUES ('undergraduate'::study_level)) AS v(level) WHERE s.slug = 'dora-gertrude-quaye-memorial-scholarship-uhas-new'
ON CONFLICT (scholarship_id, level) DO NOTHING;

INSERT INTO scholarship_fields (scholarship_id, field_id)
SELECT s.id, f.id FROM scholarships s JOIN fields_of_study f ON f.slug IN ('other') WHERE s.slug = 'dora-gertrude-quaye-memorial-scholarship-uhas-new'
ON CONFLICT (scholarship_id, field_id) DO NOTHING;

INSERT INTO scholarship_destinations (scholarship_id, country_id)
SELECT s.id, c.id FROM scholarships s JOIN countries c ON c.code = 'GH' WHERE s.slug = 'dora-gertrude-quaye-memorial-scholarship-uhas-new'
ON CONFLICT (scholarship_id, country_id) DO NOTHING;
