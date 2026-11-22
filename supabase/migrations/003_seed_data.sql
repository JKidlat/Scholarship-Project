-- Migration 003: Populate 112 Ghana Scholarships Seed Data
-- Auto-generated from curated source records

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh001'::uuid, gen_random_uuid()), 'Ghana Scholarships Authority – Local Tertiary Scholarship', 'Ghana Scholarships Authority', NULL, 'Separate from GETFund. Verify current eligibility, application window and whether the new portal is the operative route.', 'https://scholarships.gov.gh/programmes',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'ghana-scholarships-authority-local-tertiary-scholarship-gh001', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh002'::uuid, gen_random_uuid()), 'Ghana Scholarships Authority – National Merit Scholarship', 'Ghana Scholarships Authority', NULL, 'Portal describes national merit pathway; obtain specific call before publishing as open.', 'https://scholarships.gov.gh/programmes',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'ghana-scholarships-authority-national-merit-scholarship-gh002', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh003'::uuid, gen_random_uuid()), 'GETFund Local Undergraduate Scholarship', 'Ghana Education Trust Fund', NULL, '2026/27 call opened 5 Oct and closes 27 Nov 2026. Read portal for document checklist.', 'https://scholarships.getfund.gov.gh/',
  'open', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'getfund-local-undergraduate-scholarship-gh003', '2026-11-27'::date, ARRAY['All Fields']::text[], ARRAY['diploma', 'undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh004'::uuid, gen_random_uuid()), 'GETFund Local Postgraduate Scholarship', 'Ghana Education Trust Fund', NULL, 'Separate postgraduate category within same GETFund call; record separately for filtering.', 'https://scholarships.getfund.gov.gh/',
  'open', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'getfund-local-postgraduate-scholarship-gh004', '2026-11-27'::date, ARRAY['All Fields']::text[], ARRAY['postgraduate', 'masters', 'phd']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh005'::uuid, gen_random_uuid()), 'GNPC Foundation Local Scholarship', 'GNPC Foundation', NULL, 'Official page confirms local scholarship and selection criteria. Verify current call, institutions, GPA and discipline criteria.', 'https://www.gnpcghana.com/gnpc-foundation',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'gnpc-foundation-local-scholarship-gh005', NULL::date, ARRAY['All Fields']::text[], ARRAY['diploma', 'undergraduate', 'postgraduate', 'masters', 'phd']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh006'::uuid, gen_random_uuid()), 'MTN Ghana Foundation Bright Scholarship', 'MTN Ghana Foundation', NULL, '2026 application window was 1 Feb–31 May 2026. Confirm 2027 opening/deadline before marking open.', 'https://scholarship.mtn.com.gh/',
  'closed', 'research', 'local', 'women_priority',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'mtn-ghana-foundation-bright-scholarship-gh006', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['vocational', 'undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh007'::uuid, gen_random_uuid()), 'Students Loan Trust Fund (SLTF) Tertiary Loan', 'Students Loan Trust Fund', NULL, 'Include in a separate loans/financial aid category, not scholarship count.', 'https://www.sltf.gov.gh/',
  'rolling', 'loan', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'students-loan-trust-fund-sltf-tertiary-loan-gh007', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh008'::uuid, gen_random_uuid()), 'Presidential West African Scholarship Initiative (PWASI) 2026', 'Ghana Scholarships Authority', NULL, '2026 notice lists participating universities and application windows. Historical/closed cycle; monitor next intake.', 'https://scholarships.gov.gh/opportunities/presidential-west-african-scholarship-initiative-pwasi-2026',
  'closed', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'presidential-west-african-scholarship-initiative-pwasi-2026-gh008', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh009'::uuid, gen_random_uuid()), 'Nana Osae Nyampong VI''s Legacy Scholarship', 'Nana Osae Nyampong VI / UG Students Financial Aid Office', 'University of Ghana', 'Narrow eligibility: verify programme, campus and hall residency in full call.', 'https://www.ug.edu.gh/financialaid/scholarships',
  'open', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'nana-osae-nyampong-vi-s-legacy-scholarship-gh009', '2026-11-27'::date, ARRAY['Business and Management']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh010'::uuid, gen_random_uuid()), 'UG Sponsorship', 'University of Ghana / donors', 'University of Ghana', 'New and renewal applications; verify deadline and current cohort restrictions.', 'https://www.ug.edu.gh/financialaid/scholarship/ug-sponsorship',
  'rolling', 'tuition_only', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ug-sponsorship-gh010', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh011'::uuid, gen_random_uuid()), 'SRC Yi Bi Boa Scholarship', 'University of Ghana Students'' Representative Council', 'University of Ghana', 'Check current cycle dates and whether fee-paying, City Campus and distance students remain eligible.', 'https://www.ug.edu.gh/financialaid/node/27',
  'closed', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'src-yi-bi-boa-scholarship-gh011', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh012'::uuid, gen_random_uuid()), 'UGBS Scholars'' Scholarship', 'University of Ghana Business School / donors', 'University of Ghana', 'UGBS-specific scheme; obtain detailed eligibility and award value from SFAO.', 'https://www.ug.edu.gh/financialaid/node/63',
  'closed', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ugbs-scholars-scholarship-gh012', '2026-07-29'::date, ARRAY['Business and Management']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh013'::uuid, gen_random_uuid()), 'One Student One Laptop Initiative', 'University of Ghana Students Financial Aid Office', 'University of Ghana', 'Catalogue under student support/device grants, not tuition scholarship.', 'https://www.ug.edu.gh/financialaid/initiative/20262027-call-application-one-student-one-laptop-initiative',
  'open', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'one-student-one-laptop-initiative-gh013', '2026-11-27'::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate', 'masters', 'phd']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh014'::uuid, gen_random_uuid()), 'Educational Pathways International Scholarship – UG', 'Educational Pathways International', 'University of Ghana', 'Current UG page lists the award as closed. Confirm next cycle and detailed UG criteria.', 'https://www.ug.edu.gh/financialaid/scholarships',
  'closed', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'educational-pathways-international-scholarship-ug-gh014', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh015'::uuid, gen_random_uuid()), 'Fondazione Edu Scholarship – UG', 'Fondazione Edu', 'University of Ghana', 'Current UG page lists the award as closed. Confirm next cycle and exact criteria.', 'https://www.ug.edu.gh/financialaid/scholarships',
  'closed', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'fondazione-edu-scholarship-ug-gh015', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh016'::uuid, gen_random_uuid()), 'Educational Pathways International Scholarship – KNUST', 'Educational Pathways International', 'Kwame Nkrumah University of Science and Technology', 'Current call details supersede older general criteria.', 'https://www.knust.edu.gh/announcements/general/call-applications-educational-pathways-international-epi-scholarship-20262027-academic-year',
  'open', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'educational-pathways-international-scholarship-knust-gh016', '2026-11-27'::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh017'::uuid, gen_random_uuid()), 'Fondazione Edu Scholarship – KNUST', 'Fondazione Edu', 'Kwame Nkrumah University of Science and Technology', 'Current call requires demonstrated financial need; fee-paying students may apply with evidence.', 'https://www.knust.edu.gh/announcements/general/call-applications-fondazione-edu-scholarship-20262027-academic-year',
  'open', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'fondazione-edu-scholarship-knust-gh017', '2026-11-27'::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh018'::uuid, gen_random_uuid()), 'Wood Group Scholarship', 'Wood Group', 'Kwame Nkrumah University of Science and Technology', 'Confirm Wood Group''s current Ghana entity, funding status and application route.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'wood-group-scholarship-gh018', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh019'::uuid, gen_random_uuid()), 'Wood Group Excellence Cash and Prize Awards', 'Wood Group', 'Kwame Nkrumah University of Science and Technology', 'Separate merit award from Wood Group need-based scholarship; verify whether still active.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'wood-group-excellence-cash-and-prize-awards-gh019', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh020'::uuid, gen_random_uuid()), 'Timothy Ansah Memorial Foundation Scholarship', 'Timothy Ansah Memorial Foundation', 'Kwame Nkrumah University of Science and Technology', 'Confirm current application call and exact award coverage.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'timothy-ansah-memorial-foundation-scholarship-gh020', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh021'::uuid, gen_random_uuid()), 'Vodafone Ghana Scholarship', 'Vodafone Ghana', 'Kwame Nkrumah University of Science and Technology', 'Vodafone Ghana has since rebranded to Telecel Ghana; verify whether this legacy scheme continues.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'vodafone-ghana-scholarship-gh021', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh022'::uuid, gen_random_uuid()), 'TEST for Ghana Scholarship – KNUST', 'Tertiary Education Scholarship Trust for Ghana', 'Kwame Nkrumah University of Science and Technology', 'KNUST directory and UPSA financial aid page confirm the programme. Check application dates and discipline list.', 'https://testforghana.org/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'test-for-ghana-scholarship-knust-gh022', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh023'::uuid, gen_random_uuid()), 'TotalEnergies / Total Petroleum Ghana Scholarship', 'Total Petroleum Ghana Limited / TotalEnergies', 'Kwame Nkrumah University of Science and Technology', 'Confirm current sponsor name, active funding and application process.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'totalenergies-total-petroleum-ghana-scholarship-gh023', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh024'::uuid, gen_random_uuid()), 'Lebanese Community Scholarship', 'Lebanese Embassy / Lebanese Community in Ghana', 'Kwame Nkrumah University of Science and Technology', 'Contact KNUST Faculty of Law/DoSA for current availability.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'lebanese-community-scholarship-gh024', NULL::date, ARRAY['Law']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh025'::uuid, gen_random_uuid()), 'MASTEES Scholarship', 'Government of Ghana', 'Kwame Nkrumah University of Science and Technology', 'KNUST explicitly says government suspended payments from 2013/14 and was considering revival. Do not publish as open.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'mastees-scholarship-gh025', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh026'::uuid, gen_random_uuid()), 'Baker Hughes Foundation / Women Resource Scholarship', 'Baker Hughes', 'Kwame Nkrumah University of Science and Technology', 'Verify current Ghana presence, award scope and active intake.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'baker-hughes-foundation-women-resource-scholarship-gh026', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh027'::uuid, gen_random_uuid()), 'Unibank Ghana Limited Bursary', 'Unibank Ghana Limited', 'Kwame Nkrumah University of Science and Technology', 'Unibank''s operating status and current bursary continuation must be checked before publishing.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'unibank-ghana-limited-bursary-gh027', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh028'::uuid, gen_random_uuid()), 'S. T. Nankani Bursary', 'S. T. Nankani Foundation', 'Kwame Nkrumah University of Science and Technology', 'Confirm next call and whether the scheme is administered under the same foundation.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 's-t-nankani-bursary-gh028', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT', 'Medicine and Health Sciences', 'Agriculture']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh029'::uuid, gen_random_uuid()), 'Kingdom Books and Stationery Bursary', 'Kingdom Books and Stationery', 'Kwame Nkrumah University of Science and Technology', 'Verify active annual cycle and current number of beneficiaries.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'kingdom-books-and-stationery-bursary-gh029', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh030'::uuid, gen_random_uuid()), 'Toyota Ghana Bursary', 'Toyota Ghana', 'Kwame Nkrumah University of Science and Technology', 'Confirm current sponsor and application route.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'toyota-ghana-bursary-gh030', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh031'::uuid, gen_random_uuid()), 'KNUST Bursary', 'KNUST internally generated funds', 'Kwame Nkrumah University of Science and Technology', 'Current call excludes final-year, fee-paying/parallel and some other scholarship holders.', 'https://www.knust.edu.gh/index.php/announcements/general/call-applications-knust-bursary-20262027-academic-year',
  'closed', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'knust-bursary-gh031', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh032'::uuid, gen_random_uuid()), 'Ketewa Biara Nsua (KBN) SRC Bursary', 'KNUST Students'' Representative Council', 'Kwame Nkrumah University of Science and Technology', 'A separate current call is listed on KNUST scholarships and grants page.', 'https://dosa.knust.edu.gh/page/scholarships',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ketewa-biara-nsua-kbn-src-bursary-gh032', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh033'::uuid, gen_random_uuid()), 'DoSA Support to Needy Students', 'KNUST Directorate of Student Affairs', 'Kwame Nkrumah University of Science and Technology', 'Financial support scheme, not necessarily a competitive named scholarship.', 'https://dosa.knust.edu.gh/page/scholarships',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'dosa-support-to-needy-students-gh033', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh034'::uuid, gen_random_uuid()), 'Noko Fio SRC Support', 'KNUST Students'' Representative Council', 'Kwame Nkrumah University of Science and Technology', 'Include in emergency student support, not scholarship category.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'noko-fio-src-support-gh034', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh035'::uuid, gen_random_uuid()), 'KNUST College Students'' Welfare Association Funds', 'KNUST college welfare associations (GESA, SOCIOSO, SCISA, SIMPUA, IAAS, CHS)', 'Kwame Nkrumah University of Science and Technology', 'These are multiple independently administered funds; obtain each college''s current criteria before making individual listings.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'knust-college-students-welfare-association-funds-gh035', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh036'::uuid, gen_random_uuid()), 'GRASAG Boa Wo Nua', 'KNUST Graduate Students Association', 'Kwame Nkrumah University of Science and Technology', 'Confirm application contact, award amount and cycle.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'grasag-boa-wo-nua-gh036', NULL::date, ARRAY['All Fields']::text[], ARRAY['postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh037'::uuid, gen_random_uuid()), 'KNUST Graduate Assistantship', 'KNUST', 'Kwame Nkrumah University of Science and Technology', 'Assistantship rather than conventional scholarship; list separately as funded study/work opportunity.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'knust-graduate-assistantship-gh037', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh038'::uuid, gen_random_uuid()), 'KNUST Undergraduate Work Study', 'KNUST', 'Kwame Nkrumah University of Science and Technology', 'Work-study rather than scholarship; classify under student financial support.', 'https://www.knust.edu.gh/node/49',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'knust-undergraduate-work-study-gh038', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh039'::uuid, gen_random_uuid()), 'Ashesi Financial Aid (AFA) / Ashesi Scholarship Fund', 'Ashesi University and donors', 'Ashesi University', 'This is a general institutional aid pool, not a single named donor award.', 'https://ashesi.edu.gh/scholarships/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ashesi-financial-aid-afa-ashesi-scholarship-fund-gh039', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh040'::uuid, gen_random_uuid()), 'Mastercard Foundation Scholars Program at Ashesi', 'Mastercard Foundation and Ashesi University', 'Ashesi University', 'Applicants do not directly select the award; Ashesi determines award category from financial aid application.', 'https://ashesi.edu.gh/the-mastercard-foundation-scholars-programme/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'mastercard-foundation-scholars-program-at-ashesi-gh040', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate', 'masters']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh041'::uuid, gen_random_uuid()), 'Kofi A. Tawiah Scholarship Program', 'Kofi A. Tawiah fund / Ashesi University', 'Ashesi University', 'Confirm exact eligibility and whether award is restricted to Ghanaian applicants.', 'https://ashesi.edu.gh/scholarships/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'kofi-a-tawiah-scholarship-program-gh041', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh042'::uuid, gen_random_uuid()), 'African Female Muslim Scholarship', 'Ashesi University / donors', 'Ashesi University', 'Confirm nationality, faith, gender, financial-need and application conditions with Ashesi.', 'https://ashesi.edu.gh/food-housing-legal-services-and-more-for-student-success/',
  'rolling', 'fully_funded', 'local', 'women',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'african-female-muslim-scholarship-gh042', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh043'::uuid, gen_random_uuid()), 'Scholars for Impact Program (SIP)', 'Ashesi University / donors', 'Ashesi University', 'Confirm current intake and eligibility directly with Ashesi.', 'https://ashesi.edu.gh/food-housing-legal-services-and-more-for-student-success/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'scholars-for-impact-program-sip-gh043', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh044'::uuid, gen_random_uuid()), 'Ashesi Emergency Scholarship / Emergency Financial Aid', 'Ashesi University', 'Ashesi University', 'Emergency support is described by Ashesi; confirm process with Financial Aid Office.', 'https://ashesi.edu.gh/support-schemes-for-students-from-low-income-families-3/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ashesi-emergency-scholarship-emergency-financial-aid-gh044', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh045'::uuid, gen_random_uuid()), 'Dora Gertrude Quaye Memorial Scholarship', 'Professor Margaret Gyapong / donors', 'University of Health and Allied Sciences', 'UHAS/GNA confirm active memorial scholarship. Confirm current application route and eligibility.', 'https://www.uhas.edu.gh/uhas/student-affairs/resource',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'dora-gertrude-quaye-memorial-scholarship-gh045', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh046'::uuid, gen_random_uuid()), 'UHAS Student Financial Support Scheme (SFSS)', 'University of Health and Allied Sciences', 'University of Health and Allied Sciences', 'Policy includes proposed thresholds and annual October application start; confirm current board and call.', 'https://uhas.edu.gh/uhas/sites/default/files/2026-03/UHAS-student-financial-support-scheme_171023.pdf',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'uhas-student-financial-support-scheme-sfss-gh046', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh047'::uuid, gen_random_uuid()), 'UEW Vice-Chancellor''s Scholarship Fund (VCSF)', 'University of Education, Winneba', 'University of Education, Winneba', 'Renewal requires GPA 2.50. The application is submitted through Faculty Dean/CODeL.', 'https://www.uew.edu.gh/students/vice-chancellors-scholarship-fund',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'uew-vice-chancellor-s-scholarship-fund-vcsf-gh047', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh048'::uuid, gen_random_uuid()), 'UCC General Bursary', 'University of Cape Coast', 'University of Cape Coast', 'UCC dashboard reports 2,610 awards and 1,933 beneficiaries across its financial-support history.', 'https://stufso.ucc.edu.gh/',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ucc-general-bursary-gh048', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh049'::uuid, gen_random_uuid()), 'Building Tomorrow Scholarship Scheme', 'Building Tomorrow / UCC', 'University of Cape Coast', 'UCC lists Building Tomorrow among donor schemes; request detailed eligibility and award package.', 'https://stufso.ucc.edu.gh/partner',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'building-tomorrow-scholarship-scheme-gh049', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh050'::uuid, gen_random_uuid()), 'UCC CoDE Student Support Scheme', 'UCC College of Distance Education', 'University of Cape Coast', 'UCC lists CoDE among donor schemes; confirm whether current awards are scholarships or bursaries.', 'https://stufso.ucc.edu.gh/partner',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ucc-code-student-support-scheme-gh050', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh051'::uuid, gen_random_uuid()), 'GNPC Scholarship Support at UCC', 'GNPC / UCC', 'University of Cape Coast', 'Listed as a donor scheme by UCC; avoid duplicating the national GNPC Foundation record in counts unless UCC award is a separate cohort.', 'https://stufso.ucc.edu.gh/partner',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'gnpc-scholarship-support-at-ucc-gh051', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh052'::uuid, gen_random_uuid()), 'Ghana Scholarships Secretariat Scholarship at UCC', 'Ghana Scholarships Authority / UCC', 'University of Cape Coast', 'Listed as Secretariat Scholarship on UCC donor page; may be delivery channel for national programme rather than separate award.', 'https://stufso.ucc.edu.gh/partner',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ghana-scholarships-secretariat-scholarship-at-ucc-gh052', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh053'::uuid, gen_random_uuid()), 'Ghana Chamber of Mines Tertiary Education Fund (GCM-TEF) Undergraduate Scholarship', 'Ghana Chamber of Mines', 'University of Mines and Technology', 'Portal also lists postgraduate research grants and faculty research funds; distinguish student scholarship from grants.', 'https://gcmtef.umat.edu.gh/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ghana-chamber-of-mines-tertiary-education-fund-gcm-tef-undergraduate-scholarship-gh053', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh054'::uuid, gen_random_uuid()), 'Ghana Chamber of Mines Postgraduate Research Grant', 'Ghana Chamber of Mines', 'University of Mines and Technology', 'Research grant rather than tuition scholarship; include in research funding category.', 'https://gcmtef.umat.edu.gh/',
  'rolling', 'grant', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ghana-chamber-of-mines-postgraduate-research-grant-gh054', NULL::date, ARRAY['All Fields']::text[], ARRAY['postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh055'::uuid, gen_random_uuid()), 'Gold Fields Ghana Foundation Scholarship and Bursary', 'Gold Fields Ghana Foundation', NULL, 'Foundation confirms scheme since 2005 and tertiary focus; obtain current host-community list and application form.', 'https://www.goldfields-ghana.com/programmes-and-projects.php',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'gold-fields-ghana-foundation-scholarship-and-bursary-gh055', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh056'::uuid, gen_random_uuid()), 'NADeF/Liebherr Excellence Scholarship', 'Newmont Ahafo Development Foundation and Liebherr Mining Ghana', NULL, 'Narrow community eligibility; verify 2027 cycle.', 'https://nadef.org/wp-content/uploads/2026/02/NADeF_Liebherr_Scholarship_Announcement_2026.pdf',
  'closed', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'nadef-liebherr-excellence-scholarship-gh056', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['diploma', 'undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh057'::uuid, gen_random_uuid()), 'Zijin Development Foundation / Newmont Ghana Community Scholarship', 'Zijin Development Foundation (formerly Newmont Ghana)', NULL, 'UHAS lists Zijin Development Foundation; identify exact scheme name, geography and current application route.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'zijin-development-foundation-newmont-ghana-community-scholarship-gh057', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh058'::uuid, gen_random_uuid()), 'Newmont Ahafo Community Scholarship (NADeF)', 'Newmont Ahafo Development Foundation', NULL, 'Avoid conflating with the separate NADeF/Liebherr Excellence Scholarship; request current general scholarship notice.', 'https://nadef.org/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'newmont-ahafo-community-scholarship-nadef-gh058', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh059'::uuid, gen_random_uuid()), 'Tertiary Scholars'' Aid (TSA) Project', 'Jubilee and TEN Joint Venture Partners: Tullow, Kosmos, PetroSA, GNPC and EXPLORCO', NULL, 'Verify current geographic list and next application cycle.', 'https://www.tertiaryscholarsaid.org/',
  'closed', 'fully_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'tertiary-scholars-aid-tsa-project-gh059', NULL::date, ARRAY['All Fields']::text[], ARRAY['shs', 'vocational', 'undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh060'::uuid, gen_random_uuid()), 'Tullow Ghana Scholars'' Aid Programme (SHS)', 'Tullow Oil Ghana / Jubilee partners', NULL, 'Different from the tertiary TSA project. Check current intake and whether the site remains the official application route.', 'https://www.jubileescholarsaidgh.com/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'tullow-ghana-scholars-aid-programme-shs-gh060', NULL::date, ARRAY['All Fields']::text[], ARRAY['shs', 'vocational']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh061'::uuid, gen_random_uuid()), 'Pecan Inspire Scholarship Programme (PISP)', 'Pecan Energies and partners including Lukoil Overseas Ghana Tano, GNPC and Fueltrade', NULL, 'Company reports 71/161 beneficiaries in different published updates; verify current application dates and reconcile cumulative counts.', 'https://www.pecanenergiesscholarships.com/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'pecan-inspire-scholarship-programme-pisp-gh061', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh062'::uuid, gen_random_uuid()), 'Pecan Energies–UPSA Scholarship', 'Pecan Energies and UPSA', 'University of Professional Studies, Accra', 'Potentially a campus delivery stream of PISP; confirm whether separate award or same PISP before counting as a distinct scholarship.', 'https://upsa.edu.gh/upsa-pecan-energies-partner-to-award-scholarships-to-outstanding-students/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'pecan-energies-upsa-scholarship-gh062', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh063'::uuid, gen_random_uuid()), 'CAMFED Ghana Bursary / Learner Support', 'Campaign for Female Education (CAMFED)', NULL, 'CAMFED is a broad education programme; verify exact Ghana tertiary award before publishing as a scholarship listing.', 'https://camfed.org/ghana/',
  'rolling', 'bursary', 'local', 'women',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'camfed-ghana-bursary-learner-support-gh063', NULL::date, ARRAY['All Fields']::text[], ARRAY['shs', 'undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh064'::uuid, gen_random_uuid()), 'West African Gas Pipeline Company (WAPCo) Scholarship Support', 'West African Gas Pipeline Company', 'University of Health and Allied Sciences', 'UHAS lists WAPCo among institutions supporting students; obtain actual scheme notice and eligibility.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'west-african-gas-pipeline-company-wapco-scholarship-support-gh064', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh065'::uuid, gen_random_uuid()), 'Ghana National Gas Company Scholarship Support', 'Ghana National Gas Company', 'University of Health and Allied Sciences', 'Need direct company announcement or university application notice before marking verified.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ghana-national-gas-company-scholarship-support-gh065', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh066'::uuid, gen_random_uuid()), 'Volta River Authority Scholarship Support', 'Volta River Authority', 'University of Health and Allied Sciences', 'Request direct VRA/University call; do not publish an Apply Now link yet.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'volta-river-authority-scholarship-support-gh066', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh067'::uuid, gen_random_uuid()), 'Karpowership Ghana Scholarship Opportunity', 'Karpowership', 'Takoradi Technical University', 'TTU lists as programme-specific opportunity. Need original provider call.', 'https://ttu.edu.gh/scholarships/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'karpowership-ghana-scholarship-opportunity-gh067', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh068'::uuid, gen_random_uuid()), 'Pecan Energies TTU Scholarship Opportunity', 'Pecan Energies', 'Takoradi Technical University', 'May overlap with PISP; confirm separate TTU cohort.', 'https://ttu.edu.gh/scholarships/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'pecan-energies-ttu-scholarship-opportunity-gh068', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh069'::uuid, gen_random_uuid()), 'Passico Ghana Scholarship Opportunity', 'Passico Ghana', 'Takoradi Technical University', 'Need provider announcement and current application link.', 'https://ttu.edu.gh/scholarships/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'passico-ghana-scholarship-opportunity-gh069', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh070'::uuid, gen_random_uuid()), 'Yinson Foundation Scholarship Opportunity', 'Yinson Foundation', 'Takoradi Technical University', 'Need provider announcement and current application link.', 'https://ttu.edu.gh/scholarships/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'yinson-foundation-scholarship-opportunity-gh070', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh071'::uuid, gen_random_uuid()), 'Akua Kuenyehia Foundation Scholarship', 'Akua Kuenyehia Foundation', NULL, 'User document provides detailed eligibility; verify directly with foundation and confirm whether intake is currently open.', 'https://akuakuenyehiafoundation.org/',
  'rolling', 'partially_funded', 'local', 'women',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'akua-kuenyehia-foundation-scholarship-gh071', NULL::date, ARRAY['All Fields']::text[], ARRAY['shs', 'undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh072'::uuid, gen_random_uuid()), 'Marian Kwofie Foundation Scholarship', 'Marian Kwofie Foundation', NULL, 'User document''s criteria resemble Akua Kuenyehia text; independently confirm that copied criteria are accurate.', 'https://www.mariankwofiefoundation.com/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'marian-kwofie-foundation-scholarship-gh072', NULL::date, ARRAY['All Fields']::text[], ARRAY['shs', 'undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh073'::uuid, gen_random_uuid()), 'The Rebecca Foundation Education Support', 'The Rebecca Foundation', NULL, 'Do not advertise as a general tertiary scholarship until a specific award/call is confirmed.', 'https://therebeccafoundationghana.org/',
  'rolling', 'partially_funded', 'local', 'women',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'the-rebecca-foundation-education-support-gh073', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh074'::uuid, gen_random_uuid()), 'Joseph and Elizabeth Quansah (J&E Quansah) Foundation Scholarship', 'J&E Quansah Foundation', NULL, 'Verify very low income thresholds and current call directly with foundation before publication.', 'https://www.jequansahfoundation.org/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'joseph-and-elizabeth-quansah-j-e-quansah-foundation-scholarship-gh074', NULL::date, ARRAY['All Fields']::text[], ARRAY['shs', 'undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh075'::uuid, gen_random_uuid()), 'Alice Dede Foundation Scholarship', 'Alice Dede Foundation', NULL, 'Do not publish Apply Now. The source document contains an unrelated ''Canon printer ink'' placeholder.', NULL,
  'rolling', 'partially_funded', 'local', 'women',
  FALSE, 'under_review', FALSE, FALSE,
  TRUE, 'alice-dede-foundation-scholarship-gh075', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh076'::uuid, gen_random_uuid()), 'Otumfuo Osei Tutu II Foundation Education Scholarship', 'Otumfuo Osei Tutu II Foundation', NULL, 'User document lists documents but does not establish current opening dates or current scope.', 'https://otumfuofoundation.org.gh/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'otumfuo-osei-tutu-ii-foundation-education-scholarship-gh076', NULL::date, ARRAY['All Fields']::text[], ARRAY['shs', 'undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh077'::uuid, gen_random_uuid()), 'KGL Foundation Scholarship', 'KGL Foundation', NULL, 'Verify exact academic thresholds, whether postgraduate eligibility applies, award amount and application window.', 'https://kglfoundation.org/grant-details',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'kgl-foundation-scholarship-gh077', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh078'::uuid, gen_random_uuid()), 'Brighter Investment Scholarship', 'Brighter Investment', NULL, 'Confirm the scheme exists and is currently offered; do not publish until direct evidence is obtained.', 'https://www.brighterinvestment.com/home',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'under_review', FALSE, FALSE,
  TRUE, 'brighter-investment-scholarship-gh078', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh079'::uuid, gen_random_uuid()), 'Anonymous Hope Fund Scholarship for Aspiring African Students', 'Anonymous Hope Fund', NULL, 'Verify legal identity, award history, funding terms and whether applications are genuinely free before listing.', 'https://ahfgrants.com/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'under_review', FALSE, FALSE,
  TRUE, 'anonymous-hope-fund-scholarship-for-aspiring-african-students-gh079', NULL::date, ARRAY['All Fields']::text[], ARRAY['vocational', 'undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh080'::uuid, gen_random_uuid()), 'Otumfuo Education Fund / Otumfuo Education Support', 'Otumfuo Osei Tutu II Foundation', NULL, 'Do not count separately unless foundation confirms a distinct named fund.', 'https://otumfuofoundation.org.gh/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'otumfuo-education-fund-otumfuo-education-support-gh080', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh081'::uuid, gen_random_uuid()), 'Kufuor Scholars Program', 'John A. Kufuor Foundation', NULL, 'Classify as leadership scholarship/fellowship only if funding/award terms are confirmed.', 'https://kufuorfoundation.org/kufuor-scholars-program-ksp/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'kufuor-scholars-program-gh081', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh082'::uuid, gen_random_uuid()), 'Florence Nkrumah Onny Memorial Fund', 'Florence Nkrumah Onny Memorial Fund', 'Ghana Communication Technology University', 'Ask GCTU Financial Aid Office to confirm current existence, award terms and application route.', 'https://site.gctu.edu.gh/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'needs_verification', TRUE, FALSE,
  TRUE, 'florence-nkrumah-onny-memorial-fund-gh082', NULL::date, ARRAY['All Fields']::text[], ARRAY['diploma', 'undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh083'::uuid, gen_random_uuid()), 'Barclays Tertiary Scholarship (historical)', 'Barclays Bank Ghana / UPSA', 'University of Professional Studies, Accra', 'Do not publish as active. Verify with UPSA; Barclays Ghana operations were rebranded to Absa.', 'https://upsa.edu.gh/academics/financial-aid-services/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'barclays-tertiary-scholarship-historical-gh083', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh084'::uuid, gen_random_uuid()), 'African Female STEM Scholarship – WAAW Foundation', 'Working to Advance STEM Education for African Women (WAAW)', NULL, 'Not Ghana-only but Ghanaian students studying in Ghana are eligible if current criteria met.', 'https://waawfoundation.org/scholarship/',
  'rolling', 'partially_funded', 'local', 'women',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'african-female-stem-scholarship-waaw-foundation-gh084', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh085'::uuid, gen_random_uuid()), 'IsDB Scholarship Programme', 'Islamic Development Bank', NULL, 'Not a Ghana-funded award; include in Ghana-eligible international opportunities category, not domestic-only.', 'https://www.isdb.org/scholarships',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'isdb-scholarship-programme-gh085', NULL::date, ARRAY['All Fields']::text[], ARRAY['vocational', 'undergraduate', 'postgraduate', 'masters', 'phd']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh086'::uuid, gen_random_uuid()), 'Zawadi Africa Educational Fund', 'Zawadi Africa Educational Fund', NULL, 'Confirm current Ghana participation and application cycle before publishing as Ghana opportunity.', 'https://www.zawadiafrica.org/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'zawadi-africa-educational-fund-gh086', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh087'::uuid, gen_random_uuid()), 'African Science Academy Full Scholarship', 'African Gifted Foundation / African Science Academy', NULL, 'This is a school-placement scholarship, not a general tertiary scholarship. Classify separately.', 'https://www.africangifted.org/',
  'rolling', 'fully_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'african-science-academy-full-scholarship-gh087', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['shs']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh088'::uuid, gen_random_uuid()), 'YALI Regional Leadership Center West Africa – Ghana', 'YALI RLC West Africa / GIMPA', NULL, 'Classify as funded training/fellowship, not tertiary tuition scholarship.', 'https://yaliwestafrica.net/rlc/index.php/apply-now/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', FALSE, FALSE,
  TRUE, 'yali-regional-leadership-center-west-africa-ghana-gh088', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh089'::uuid, gen_random_uuid()), 'Financial Support Scholarship – UHAS', 'UHAS / individual donors', 'University of Health and Allied Sciences', 'Generic line item; request named donor and current rules before publishing as a separate award.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'financial-support-scholarship-uhas-gh089', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh090'::uuid, gen_random_uuid()), 'Ghana Education Trust Fund Scholarship Support at UHAS', 'GETFund / UHAS', 'University of Health and Allied Sciences', 'Do not count as separate national award; retain as UHAS application channel note.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ghana-education-trust-fund-scholarship-support-at-uhas-gh090', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh091'::uuid, gen_random_uuid()), 'GNPC Scholarship Support at UHAS', 'GNPC Foundation / UHAS', 'University of Health and Allied Sciences', 'Do not count separately from GNPC Foundation Local Scholarship.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'gnpc-scholarship-support-at-uhas-gh091', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh092'::uuid, gen_random_uuid()), 'MTN Scholarship Support at UHAS', 'MTN Ghana Foundation / UHAS', 'University of Health and Allied Sciences', 'Do not count separately from MTN Bright Scholarship.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'mtn-scholarship-support-at-uhas-gh092', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh093'::uuid, gen_random_uuid()), 'CAMFED Scholarship Support at UHAS', 'CAMFED / UHAS', 'University of Health and Allied Sciences', 'Potential duplicate of CAMFED Ghana programme. Merge after confirmation.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'camfed-scholarship-support-at-uhas-gh093', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh094'::uuid, gen_random_uuid()), 'Gold Fields Scholarship Support at UHAS', 'Gold Fields Ghana Foundation / UHAS', 'University of Health and Allied Sciences', 'Do not count separately from Gold Fields Ghana Foundation Scholarship.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'gold-fields-scholarship-support-at-uhas-gh094', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh095'::uuid, gen_random_uuid()), 'Volta River Authority Scholarship Support at UHAS', 'VRA / UHAS', 'University of Health and Allied Sciences', 'Potential duplicate of VRA scholarship support record above; consolidate.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'volta-river-authority-scholarship-support-at-uhas-gh095', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh096'::uuid, gen_random_uuid()), 'Ghana National Gas Company Scholarship Support at UHAS', 'Ghana National Gas Company / UHAS', 'University of Health and Allied Sciences', 'Potentially a distinct company award; need direct notice.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ghana-national-gas-company-scholarship-support-at-uhas-gh096', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh097'::uuid, gen_random_uuid()), 'Zijin Development Foundation Scholarship Support at UHAS', 'Zijin Development Foundation / UHAS', 'University of Health and Allied Sciences', 'Confirm exact programme and whether same as Newmont/NADeF community scholarship.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'zijin-development-foundation-scholarship-support-at-uhas-gh097', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh098'::uuid, gen_random_uuid()), 'UCC Secretariat Scholarship', 'Ghana Scholarships Authority / UCC', 'University of Cape Coast', 'UCC reports 404 historical awards; treat as campus-administered Secretariat route, not separate national scheme.', 'https://stufso.ucc.edu.gh/partner',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ucc-secretariat-scholarship-gh098', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh099'::uuid, gen_random_uuid()), 'UCC Building Tomorrow (BTOM) Student Support', 'Building Tomorrow / UCC', 'University of Cape Coast', 'Potential duplicate of Building Tomorrow record; merge duplicate records in production.', 'https://stufso.ucc.edu.gh/partner',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ucc-building-tomorrow-btom-student-support-gh099', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_gh100'::uuid, gen_random_uuid()), 'UCC CoDE Donor Support', 'UCC College of Distance Education', 'University of Cape Coast', 'Potential duplicate of UCC CoDE Student Support Scheme; merge.', 'https://stufso.ucc.edu.gh/partner',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ucc-code-donor-support-gh100', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'Nana Osae Nyampong VI’s Legacy Scholarship (UG)', 'University of Ghana Students Financial Aid Office', 'University of Ghana', '2026/2027 call supports disadvantaged UGBS undergraduates resident in Commonwealth Hall; published eligibility includes financial need and academic threshold.', 'https://www.ug.edu.gh/financialaid/node/80',
  'open', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'nana-osae-nyampong-vi-s-legacy-scholarship-ug-new', '2026-11-27'::date, ARRAY['Business and Management']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'UGBS Scholars’ Scholarship (2026/27)', 'University of Ghana Business School / UG Students Financial Aid Office', 'University of Ghana', 'UG SFAO lists a 2026/2027 UGBS Scholars’ Scholarship call dated 30 July 2026. The individual call page should be checked for detailed terms.', 'https://www.ug.edu.gh/financialaid/home',
  'unannounced', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ugbs-scholars-scholarship-2026-27-new', NULL::date, ARRAY['Business and Management']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'UG Sponsorship / SRC Yi Bi Boa Scholarship (2026/27)', 'University of Ghana Students Financial Aid Office and UG SRC', 'University of Ghana', 'UG SFAO lists the 2026/27 UG Sponsorship / SRC Yi Bi Boa application and renewal call dated 30 June 2026.', 'https://www.ug.edu.gh/financialaid/home',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'ug-sponsorship-src-yi-bi-boa-scholarship-2026-27-new', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'One Student One Laptop Initiative (2026/27)', 'University of Ghana Students Financial Aid Office', 'University of Ghana', 'A university-listed device support initiative. Included for student funding discovery but is not a cash scholarship.', 'https://www.ug.edu.gh/financialaid/initiative/20262027-call-application-one-student-one-laptop-initiative',
  'unannounced', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'one-student-one-laptop-initiative-2026-27-new', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'Educational Pathways International (EPI) Scholarship at KNUST (2026/27)', 'Educational Pathways International / KNUST', 'Kwame Nkrumah University of Science and Technology', 'Four-year scholarship for brilliant but needy Ghanaian first- and second-year KNUST students. Current call published 12 Nov 2026.', 'https://www.knust.edu.gh/announcements/general/call-applications-educational-pathways-international-epi-scholarship-20262027-academic-year',
  'open', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'educational-pathways-international-epi-scholarship-at-knust-2026-27-new', '2026-11-27'::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'Fondazione Edu Scholarship at KNUST (2026/27)', 'Fondazione Edu / KNUST', 'Kwame Nkrumah University of Science and Technology', 'Fondazione Edu supports brilliant but needy KNUST students. Current call published 12 Nov 2026.', 'https://www.knust.edu.gh/announcements/general/call-applications-fondazione-edu-scholarship-20262027-academic-year',
  'open', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'fondazione-edu-scholarship-at-knust-2026-27-new', '2026-11-27'::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'Educational Pathways International (EPI) Scholarship at UDS (2026/27)', 'Educational Pathways International / University for Development Studies', 'University for Development Studies', 'UDS 2026/27 call describes EPI support for academically strong Ghanaian students with financial need.', 'https://www.uds.edu.gh/announcements/call-for-applications-educational-pathways-international-epi-scholarship',
  'closed', 'fully_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'educational-pathways-international-epi-scholarship-at-uds-2026-27-new', '2026-10-19'::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'Founder’s STEM Scholarship', 'Lancaster University Ghana / Transnational Academic Group', 'Lancaster University Ghana', 'Fully funded undergraduate scholarship designed to support an exceptional female student pursuing a STEM degree at Lancaster University Ghana.', 'https://lancaster.edu.gh/study/scholarships-and-bursaries/',
  'rolling', 'fully_funded', 'local', 'women',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'founder-s-stem-scholarship-new', NULL::date, ARRAY['Engineering', 'Science', 'Computer Science and IT']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'TAG Ghana Scholarships', 'Transnational Academic Group (TAG) Ghana / Lancaster University Ghana', 'Lancaster University Ghana', 'Lancaster University Ghana lists TAG Ghana Scholarships among its scholarship and bursary opportunities.', 'https://lancaster.edu.gh/study/scholarships-and-bursaries/',
  'rolling', 'bursary', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'tag-ghana-scholarships-new', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'KGL Foundation Scholarship at Lancaster University Ghana', 'KGL Foundation / Lancaster University Ghana', 'Lancaster University Ghana', 'KGL Foundation scholarships are listed by Lancaster University Ghana as supporting academic excellence, financial need and community growth.', 'https://lancaster.edu.gh/study/scholarships-and-bursaries/',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'kgl-foundation-scholarship-at-lancaster-university-ghana-new', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate', 'postgraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'Tertiary Education Scholarship Trust, Ghana (TES Ghana) support', 'Tertiary Education Scholarship Trust, Ghana', 'University of Health and Allied Sciences', 'UHAS lists TES Ghana among institutions supporting its students. This is a provider lead, not a verified open call; confirm award name and direct application route.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'tertiary-education-scholarship-trust-ghana-tes-ghana-support-new', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels, created_at
) VALUES (
  COALESCE('sch_new'::uuid, gen_random_uuid()), 'Dora Gertrude Quaye Memorial Scholarship (UHAS)', 'Professor Margaret Gyapong / donors', 'University of Health and Allied Sciences', 'UHAS lists the Dora Gertrude Quaye Memorial Scholarship in its financial-aid directory. Confirm the current award notice and exact criteria.', 'https://uhas.edu.gh/uhas/financial-aid',
  'rolling', 'partially_funded', 'local', 'all',
  FALSE, 'verified', TRUE, FALSE,
  TRUE, 'dora-gertrude-quaye-memorial-scholarship-uhas-new', NULL::date, ARRAY['All Fields']::text[], ARRAY['undergraduate']::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study;

