-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — INTERNATIONAL SCHOLARSHIPS SEED
-- Migration: 005_international_scholarships.sql
-- Total Records: 50 International Scholarships (INT001 - INT050)
-- Generated: 2026-11-18T23:01:34.386Z
-- ============================================================

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int001', ''), gen_random_uuid()::text)::uuid, 'Chevening Scholarships', 'UK Foreign, Commonwealth & Development Office', 'Participating UK universities', 'Chevening Scholarships supports eligible international applicants to study in United Kingdom. Official Ghana country page. Review the linked official call for the current award conditions and participating courses.', 'https://www.chevening.org/scholarship/ghana/',
  'closed', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'chevening-scholarships-int001', NULL::date, ARRAY["All eligible one-year taught master’s fields"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', 'Annual; 2027/28 cycle closed', 'Ghana country page confirms Ghana applicants; work experience and return-home commitment apply', ARRAY["Tuition, living stipend, travel and eligible allowances"]::text[], ARRAY["Official application form", "Ghanaian passport/ID", "academic certificates and transcripts", "CV", "references", "admission/course evidence where required", "personal statement/study plan", "other documents in the country-specific call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int002', ''), gen_random_uuid()::text)::uuid, 'Commonwealth Shared Scholarships', 'Commonwealth Scholarship Commission / UK universities', 'Participating UK universities and approved courses', 'Commonwealth Shared Scholarships supports eligible international applicants to study in United Kingdom. Official CSC eligible-country list and current call. Review the linked official call for the current award conditions and participating courses.', 'https://cscuk.fcdo.gov.uk/scholarships/commonwealth-shared-scholarships/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'commonwealth-shared-scholarships-int002', NULL::date, ARRAY["Approved development-related courses"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', '2027/28 closes 8 Dec 2026', 'Ghana is explicitly listed among eligible Commonwealth countries; apply to participating courses/universities', ARRAY["Tuition, approved fares, living stipend and allowances per CSC terms"]::text[], ARRAY["Official application form", "Ghanaian passport/ID", "academic certificates and transcripts", "CV", "references", "admission/course evidence where required", "personal statement/study plan", "other documents in the country-specific call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int003', ''), gen_random_uuid()::text)::uuid, 'Commonwealth Master’s Scholarships', 'Commonwealth Scholarship Commission', 'Nominating UK universities', 'Commonwealth Master’s Scholarships supports eligible international applicants to study in United Kingdom. Official CSC programme page; country/call conditions apply. Review the linked official call for the current award conditions and participating courses.', 'https://cscuk.fcdo.gov.uk/scholarships/commonwealth-masters-scholarships/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'commonwealth-master-s-scholarships-int003', NULL::date, ARRAY["Development-related approved fields"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', 'Annual; check 2027/28 call', 'Ghanaian citizens resident in Ghana may be eligible subject to annual CSC criteria and nomination route', ARRAY["Tuition, airfare, living allowance and other approved allowances"]::text[], ARRAY["Official application form", "Ghanaian passport/ID", "academic certificates and transcripts", "CV", "references", "admission/course evidence where required", "personal statement/study plan", "other documents in the country-specific call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int004', ''), gen_random_uuid()::text)::uuid, 'Reach Oxford Scholarship', 'University of Oxford', 'University of Oxford', 'Reach Oxford Scholarship supports eligible international applicants to study in United Kingdom. Official Oxford eligibility page. Review the linked official call for the current award conditions and participating courses.', 'https://www.ox.ac.uk/admissions/undergraduate/fees-and-funding/oxford-bursaries-and-scholarships/reach-oxford',
  'open', 'fully_funded', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'reach-oxford-scholarship-int004', NULL::date, ARRAY["All eligible undergraduate courses except excluded programmes"]::text[], ARRAY["undergraduate"]::text[],
  'United Kingdom', 'Annual; 2027 entry deadline 27 Jan 2027', 'Applicants must be from low-income countries where studying locally is unavailable or politically/economically difficult; Ghana eligibility must be assessed against current criteria', ARRAY["Course fees, living costs grant and one return airfare per year"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int005', ''), gen_random_uuid()::text)::uuid, 'Rhodes Scholarship for West Africa', 'Rhodes Trust', 'University of Oxford', 'Rhodes Scholarship for West Africa supports eligible international applicants to study in United Kingdom. Official Rhodes constituency page. Review the linked official call for the current award conditions and participating courses.', 'https://www.rhodeshouse.ox.ac.uk/scholarships/applications/west-africa/',
  'upcoming', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'rhodes-scholarship-for-west-africa-int005', NULL::date, ARRAY["Oxford postgraduate programmes"]::text[], ARRAY["masters", "phd"]::text[],
  'United Kingdom', 'Annual; next cycle dates to confirm', 'West Africa constituency includes Ghana; age, academic and leadership criteria apply', ARRAY["Oxford fees, stipend, settling-in allowance and travel"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int006', ''), gen_random_uuid()::text)::uuid, 'Clarendon Scholarship', 'University of Oxford / Clarendon Fund', 'University of Oxford', 'Clarendon Scholarship supports eligible international applicants to study in United Kingdom. Official Oxford funding page. Review the linked official call for the current award conditions and participating courses.', 'https://www.ox.ac.uk/admissions/graduate/fees-and-funding/funding/clarendon/applicants',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'clarendon-scholarship-int006', NULL::date, ARRAY["Most Oxford graduate disciplines"]::text[], ARRAY["masters", "phd"]::text[],
  'United Kingdom', 'Course-specific Dec/Jan deadlines', 'Open to applicants of all nationalities, including Ghanaian applicants; apply by course funding deadline', ARRAY["Full course fees and living-cost grant"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int007', ''), gen_random_uuid()::text)::uuid, 'Weidenfeld-Hoffmann Scholarships and Leadership Programme', 'Weidenfeld-Hoffmann Trust / University of Oxford', 'University of Oxford', 'Weidenfeld-Hoffmann Scholarships and Leadership Programme supports eligible international applicants to study in United Kingdom. Official Oxford scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://www.ox.ac.uk/admissions/graduate/fees-and-funding/fees-funding-and-scholarship-search/weidenfeld-hoffmann-scholarships-and-leadership-programme',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'weidenfeld-hoffmann-scholarships-and-leadership-programme-int007', NULL::date, ARRAY["Specified graduate courses"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', 'Course-specific annual deadlines', 'Ghana is among eligible countries; only listed courses and leadership programme applicants qualify', ARRAY["100% course fees and living-cost grant; leadership programme"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int008', ''), gen_random_uuid()::text)::uuid, 'Felix Scholarship', 'Felix Scholarship Trust', 'University of Oxford, University of Reading and SOAS', 'Felix Scholarship supports eligible international applicants to study in United Kingdom. Official Felix Trust; country/course conditions. Review the linked official call for the current award conditions and participating courses.', 'https://www.felixscholarship.org/about/',
  'open', 'fully_funded', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'felix-scholarship-int008', NULL::date, ARRAY["Selected postgraduate courses at Oxford", "Reading and SOAS"]::text[], ARRAY["masters", "phd"]::text[],
  'United Kingdom', 'Annual; check trust and university deadlines', 'Open to citizens of eligible developing countries; Ghana eligibility and participating institution/course must be checked for the cycle', ARRAY["Tuition, living stipend and return airfare subject to trust rules"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int009', ''), gen_random_uuid()::text)::uuid, 'Cambridge Trust postgraduate scholarships', 'Cambridge Trust', 'University of Cambridge', 'Cambridge Trust postgraduate scholarships supports eligible international applicants to study in United Kingdom. Official Cambridge Trust scholarships directory. Review the linked official call for the current award conditions and participating courses.', 'https://www.cambridgetrust.org/scholarships/',
  'open', 'partially_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'cambridge-trust-postgraduate-scholarships-int009', NULL::date, ARRAY["Cambridge postgraduate programmes"]::text[], ARRAY["masters", "phd"]::text[],
  'United Kingdom', 'Course-specific annual deadlines', 'International applicants, including Ghanaians, may apply; award type and eligibility vary by scheme', ARRAY["Full or partial fees and maintenance depending on award"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int010', ''), gen_random_uuid()::text)::uuid, 'Mastercard Foundation Scholars Program at Cambridge', 'Mastercard Foundation / University of Cambridge', 'University of Cambridge', 'Mastercard Foundation Scholars Program at Cambridge supports eligible international applicants to study in United Kingdom. Official Cambridge programme page. Review the linked official call for the current award conditions and participating courses.', 'https://www.mastercardfoundation.fund.cam.ac.uk/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mastercard-foundation-scholars-program-at-cambridge-int010', NULL::date, ARRAY["Eligible climate resilience and sustainability postgraduate programmes"]::text[], ARRAY["masters", "phd"]::text[],
  'United Kingdom', 'Annual; programme-specific', 'African applicants including Ghanaians; programme, work/leadership and financial-need criteria apply', ARRAY["Tuition, living costs, travel and support per programme terms"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int011', ''), gen_random_uuid()::text)::uuid, 'University of Glasgow African Excellence Award', 'University of Glasgow', 'University of Glasgow', 'University of Glasgow African Excellence Award supports eligible international applicants to study in United Kingdom. Official Glasgow award page. Review the linked official call for the current award conditions and participating courses.', 'https://www.gla.ac.uk/scholarships/universityofglasgowafricanexcellenceaward/',
  'open', 'partially_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'university-of-glasgow-african-excellence-award-int011', NULL::date, ARRAY["Eligible one-year taught postgraduate programmes"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', 'Annual; check 2027 entry call', 'African-domiciled applicants including Ghana; eligible course and offer required', ARRAY["Tuition fee discount; does not cover all living/visa costs"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int012', ''), gen_random_uuid()::text)::uuid, 'University of Bristol Think Big Scholarships', 'University of Bristol', 'University of Bristol', 'University of Bristol Think Big Scholarships supports eligible international applicants to study in United Kingdom. Official Bristol scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://www.bristol.ac.uk/students/support/finances/scholarships/think-big-scholarships/',
  'open', 'partially_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'university-of-bristol-think-big-scholarships-int012', NULL::date, ARRAY["Eligible undergraduate and postgraduate courses"]::text[], ARRAY["undergraduate", "masters"]::text[],
  'United Kingdom', 'Annual; check 2027 entry deadline', 'International fee-paying applicants including Ghanaian students; course exclusions apply', ARRAY["Tuition fee awards; values vary by level and year"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int013', ''), gen_random_uuid()::text)::uuid, 'GREAT Scholarship for Ghanaian Students at University of Kent', 'University of Kent / British Council', 'University of Kent', 'GREAT Scholarship for Ghanaian Students at University of Kent supports eligible international applicants to study in United Kingdom. Official Kent award page. Review the linked official call for the current award conditions and participating courses.', 'https://www.kent.ac.uk/scholarships/search/FNADGGPNTT01',
  'open', 'partially_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'great-scholarship-for-ghanaian-students-at-university-of-kent-int013', NULL::date, ARRAY["Eligible taught master’s programmes"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', '2027 cycle deadline 23 Apr 2027', 'Ghanaian applicants are explicitly targeted; offer and course conditions apply', ARRAY["£10,000 tuition contribution (cycle-specific)"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int014', ''), gen_random_uuid()::text)::uuid, 'University of Exeter Postgraduate Taught Scholarship for Ghana', 'University of Exeter', 'University of Exeter', 'University of Exeter Postgraduate Taught Scholarship for Ghana supports eligible international applicants to study in United Kingdom. Official Exeter award page. Review the linked official call for the current award conditions and participating courses.', 'https://www.exeter.ac.uk/study/funding/award/?id=5963',
  'open', 'partially_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'university-of-exeter-postgraduate-taught-scholarship-for-ghana-int014', '2027-08-31'::date, ARRAY["Eligible taught master’s programmes"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', '31 Aug 2027', 'Ghanaian citizen/passport holder classified as international fee payer with eligible 2027/28 offer', ARRAY["£10,000 first-year tuition reduction"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int015', ''), gen_random_uuid()::text)::uuid, 'York International Masters Scholarship', 'University of York', 'University of York', 'York International Masters Scholarship supports eligible international applicants to study in United Kingdom. Official York scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://www.york.ac.uk/study/postgraduate-taught/funding/international/york-international-masters-scholarship/',
  'open', 'partially_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'york-international-masters-scholarship-int015', NULL::date, ARRAY["Eligible taught master’s programmes"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', 'Course/award-specific', 'International fee-paying applicants including Ghanaian students; exclusions apply', ARRAY["£8,000 tuition fee reduction (published 2027/28 terms)"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int016', ''), gen_random_uuid()::text)::uuid, 'York International Undergraduate Scholarship', 'University of York', 'University of York', 'York International Undergraduate Scholarship supports eligible international applicants to study in United Kingdom. Official York scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://www.york.ac.uk/study/undergraduate/fees-funding/international/scholarships/york-international-ug-scholarship/',
  'open', 'partially_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'york-international-undergraduate-scholarship-int016', NULL::date, ARRAY["Eligible undergraduate programmes"]::text[], ARRAY["undergraduate"]::text[],
  'United Kingdom', 'Course/award-specific', 'International fee-paying applicants including Ghanaians; exclusions apply', ARRAY["£5,000 per year subject to published terms"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int017', ''), gen_random_uuid()::text)::uuid, 'York Global Impact Masters Scholarship', 'University of York', 'University of York', 'York Global Impact Masters Scholarship supports eligible international applicants to study in United Kingdom. Official York scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://www.york.ac.uk/study/postgraduate-taught/funding/international/global-impact-masters-scholarship/',
  'open', 'partially_funded', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'york-global-impact-masters-scholarship-int017', NULL::date, ARRAY["Eligible postgraduate courses"]::text[], ARRAY["masters"]::text[],
  'United Kingdom', 'Annual; renewal/current cycle to verify', 'International applicants including Ghanaians; check renewal and current intake status', ARRAY["Tuition contribution as specified in current call"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int018', ''), gen_random_uuid()::text)::uuid, 'Fulbright Foreign Student Program (Ghana)', 'U.S. Department of State / U.S. Embassy Ghana', 'Participating U.S. universities', 'Fulbright Foreign Student Program (Ghana) supports eligible international applicants to study in United States. Official U.S. Embassy Ghana page. Review the linked official call for the current award conditions and participating courses.', 'https://gh.usembassy.gov/education-culture/fulbright-program/',
  'open', 'other', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'fulbright-foreign-student-program-ghana-int018', NULL::date, ARRAY["Approved postgraduate fields"]::text[], ARRAY["masters", "phd"]::text[],
  'United States', 'Annual; Ghana call-specific', 'Ghanaian citizens apply through the Ghana-specific Fulbright competition; annual field and work-experience criteria apply', ARRAY["Tuition, living stipend, travel and health coverage per award terms"]::text[], ARRAY["Official application form", "Ghanaian passport/ID", "academic certificates and transcripts", "CV", "references", "admission/course evidence where required", "personal statement/study plan", "other documents in the country-specific call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int019', ''), gen_random_uuid()::text)::uuid, 'Joint Japan/World Bank Graduate Scholarship Program', 'World Bank / Government of Japan', 'Participating universities in Japan and other partner locations', 'Joint Japan/World Bank Graduate Scholarship Program supports eligible international applicants to study in Japan / participating countries. Official World Bank programme page. Review the linked official call for the current award conditions and participating courses.', 'https://www.worldbank.org/en/programs/scholarships/jj-wbgsp',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'joint-japan-world-bank-graduate-scholarship-program-int019', NULL::date, ARRAY["Participating development-related master’s programmes"]::text[], ARRAY["masters"]::text[],
  'Japan / participating countries', '2027 call; 27 Feb 2027 (verify round)', 'Ghana is an eligible developing-country nationality; applicants need relevant professional experience and admission to a participating programme', ARRAY["Tuition, monthly living stipend, travel, health insurance and travel allowance"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int020', ''), gen_random_uuid()::text)::uuid, 'Mastercard Foundation Scholars Program at McGill', 'Mastercard Foundation / McGill University', 'McGill University', 'Mastercard Foundation Scholars Program at McGill supports eligible international applicants to study in Canada. Official McGill eligibility page. Review the linked official call for the current award conditions and participating courses.', 'https://www.mcgill.ca/mastercardfdn-scholars/apply/eligibility',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mastercard-foundation-scholars-program-at-mcgill-int020', NULL::date, ARRAY["Selected graduate programmes"]::text[], ARRAY["masters"]::text[],
  'Canada', 'Annual; check current cohort', 'African citizens including Ghanaians; only specified programmes and applicant profile qualify', ARRAY["Tuition, living support, travel and academic support subject to programme terms"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int021', ''), gen_random_uuid()::text)::uuid, 'Mastercard Foundation Scholars Program at University of Toronto', 'Mastercard Foundation / University of Toronto', 'University of Toronto', 'Mastercard Foundation Scholars Program at University of Toronto supports eligible international applicants to study in Canada. Official Mastercard Foundation partner page. Review the linked official call for the current award conditions and participating courses.', 'https://mastercardfdn.org/en/what-we-do/our-programs/mastercard-foundation-scholars-program/where-to-apply/university-of-toronto-u-of-t/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mastercard-foundation-scholars-program-at-university-of-toronto-int021', NULL::date, ARRAY["Specified graduate programmes", "including selected health-related routes"]::text[], ARRAY["masters"]::text[],
  'Canada', 'Annual; programme-specific', 'African applicants including Ghanaians; verify eligible programme and cohort availability', ARRAY["Tuition and comprehensive scholar support per partner terms"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int022', ''), gen_random_uuid()::text)::uuid, 'Lester B. Pearson International Scholarship', 'University of Toronto', 'University of Toronto', 'Lester B. Pearson International Scholarship supports eligible international applicants to study in Canada. Official University of Toronto page. Review the linked official call for the current award conditions and participating courses.', 'https://future.utoronto.ca/pearson/about/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'lester-b-pearson-international-scholarship-int022', NULL::date, ARRAY["Undergraduate programmes"]::text[], ARRAY["undergraduate"]::text[],
  'Canada', 'Annual; school nomination deadlines precede admission', 'International students including Ghanaians; secondary school nomination required', ARRAY["Tuition, books, incidental fees and full residence support for four years"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int023', ''), gen_random_uuid()::text)::uuid, 'UBC International Scholars Program', 'University of British Columbia', 'University of British Columbia', 'UBC International Scholars Program supports eligible international applicants to study in Canada. Official UBC programme page. Review the linked official call for the current award conditions and participating courses.', 'https://you.ubc.ca/financial-planning/scholarships-awards-international-students/international-scholars/',
  'open', 'other', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'ubc-international-scholars-program-int023', NULL::date, ARRAY["Undergraduate programmes"]::text[], ARRAY["undergraduate"]::text[],
  'Canada', 'Annual; nomination deadline applies', 'International applicants including Ghanaians; school nomination, financial need and leadership required', ARRAY["Award based on demonstrated financial need, up to cost of study"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int024', ''), gen_random_uuid()::text)::uuid, 'UBC International Major Entrance Scholarship', 'University of British Columbia', 'University of British Columbia', 'UBC International Major Entrance Scholarship supports eligible international applicants to study in Canada. Official UBC international awards page. Review the linked official call for the current award conditions and participating courses.', 'https://you.ubc.ca/financial-planning/scholarships-awards-international-students/international-entrance-scholarships/',
  'open', 'tuition_only', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'ubc-international-major-entrance-scholarship-int024', NULL::date, ARRAY["Undergraduate programmes"]::text[], ARRAY["undergraduate"]::text[],
  'Canada', 'Automatic/annual admission cycle', 'Outstanding international applicants including Ghanaians; admission-based consideration', ARRAY["Renewable award; amount varies by year"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int025', ''), gen_random_uuid()::text)::uuid, 'UBC Outstanding International Student Award', 'University of British Columbia', 'University of British Columbia', 'UBC Outstanding International Student Award supports eligible international applicants to study in Canada. Official UBC international awards page. Review the linked official call for the current award conditions and participating courses.', 'https://you.ubc.ca/financial-planning/scholarships-awards-international-students/international-entrance-scholarships/',
  'open', 'other', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'ubc-outstanding-international-student-award-int025', NULL::date, ARRAY["Undergraduate programmes"]::text[], ARRAY["undergraduate"]::text[],
  'Canada', 'Automatic/annual admission cycle', 'International applicants including Ghanaian students; assessed at admission', ARRAY["One-time entrance award; amount varies"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int026', ''), gen_random_uuid()::text)::uuid, 'Swiss Government Excellence Scholarships', 'Swiss Federal Commission for Scholarships for Foreign Students', 'Swiss higher education and research institutions', 'Swiss Government Excellence Scholarships supports eligible international applicants to study in Switzerland. Official Swiss government page; country-specific call essential. Review the linked official call for the current award conditions and participating courses.', 'https://www.sbfi.admin.ch/en/swiss-government-excellence-scholarships',
  'open', 'fellowship', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'swiss-government-excellence-scholarships-int026', NULL::date, ARRAY["Research fellowship", "PhD and postdoctoral routes depending on country"]::text[], ARRAY["postdoctoral", "phd"]::text[],
  'Switzerland', 'Annual; embassy nomination calendar', 'Country-specific nomination; Ghanaian applicants must confirm that the relevant award type is offered to Ghana in the current call', ARRAY["Stipend and other benefits depend on award category"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int027', ''), gen_random_uuid()::text)::uuid, 'Stipendium Hungaricum Scholarship Programme', 'Government of Hungary / Tempus Public Foundation', 'Participating Hungarian universities', 'Stipendium Hungaricum Scholarship Programme supports eligible international applicants to study in Hungary. Official programme portal. Review the linked official call for the current award conditions and participating courses.', 'https://stipendiumhungaricum.hu/',
  'open', 'other', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'stipendium-hungaricum-scholarship-programme-int027', NULL::date, ARRAY["Wide range of eligible disciplines"]::text[], ARRAY["undergraduate", "masters", "phd"]::text[],
  'Hungary', 'Annual; partner nomination deadline', 'Applicants must apply through a sending partner with a valid Ghana allocation; confirm Ghana bilateral quota for the cycle', ARRAY["Tuition-free study, stipend, accommodation contribution and medical insurance"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int028', ''), gen_random_uuid()::text)::uuid, 'Italian Government MAECI Scholarships', 'Italian Ministry of Foreign Affairs and International Cooperation', 'Participating Italian universities', 'Italian Government MAECI Scholarships supports eligible international applicants to study in Italy. Official Study in Italy / MAECI portal. Review the linked official call for the current award conditions and participating courses.', 'https://studyinitaly.esteri.it/',
  'open', 'other', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'italian-government-maeci-scholarships-int028', NULL::date, ARRAY["Eligible master’s", "arts", "PhD and research programmes"]::text[], ARRAY["masters", "phd", "postdoctoral"]::text[],
  'Italy', 'Annual; call-specific', 'Foreign applicants including Ghanaians may apply where nationality is included in annual call; age and course rules apply', ARRAY["Monthly grant and limited tuition/insurance support under current call"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int029', ''), gen_random_uuid()::text)::uuid, 'DAAD Development-Related Postgraduate Courses (EPOS)', 'German Academic Exchange Service (DAAD)', 'Participating German universities', 'DAAD Development-Related Postgraduate Courses (EPOS) supports eligible international applicants to study in Germany. Official DAAD programme and course list. Review the linked official call for the current award conditions and participating courses.', 'https://www.daad.de/en/studying-in-germany/scholarships/daad-scholarships/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'daad-development-related-postgraduate-courses-epos-int029', NULL::date, ARRAY["Selected development-related postgraduate courses"]::text[], ARRAY["masters", "phd"]::text[],
  'Germany', 'Course-specific; 2027/28 dates vary', 'Applicants from developing countries including Ghana; usually at least two years relevant work experience and eligible course', ARRAY["Stipend, insurance, travel allowance and study support per DAAD terms"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int030', ''), gen_random_uuid()::text)::uuid, 'Erasmus Mundus Joint Masters Scholarships', 'European Commission / participating consortia', 'Joint master consortia across Europe', 'Erasmus Mundus Joint Masters Scholarships supports eligible international applicants to study in Multiple European countries. Official Erasmus+ programme page. Review the linked official call for the current award conditions and participating courses.', 'https://erasmus-plus.ec.europa.eu/opportunities/opportunities-for-individuals/students/erasmus-mundus-joint-masters',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'erasmus-mundus-joint-masters-scholarships-int030', NULL::date, ARRAY["Participating joint master’s programmes"]::text[], ARRAY["masters"]::text[],
  'Multiple European countries', 'Most programmes Oct-Jan for next academic year', 'Open worldwide; Ghanaian applicants eligible subject to consortium admission criteria', ARRAY["Participation costs, travel, visa and living allowance contribution"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int031', ''), gen_random_uuid()::text)::uuid, 'Uppsala University Global Scholarship', 'Uppsala University', 'Uppsala University', 'Uppsala University Global Scholarship supports eligible international applicants to study in Sweden. Official Uppsala scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://www.uu.se/en/study/masters-studies/scholarships/uppsala-university-scholarships',
  'open', 'other', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'uppsala-university-global-scholarship-int031', NULL::date, ARRAY["Selected international master’s programmes"]::text[], ARRAY["masters"]::text[],
  'Sweden', 'Annual; admissions-linked', 'Fee-paying international applicants including Ghanaians; first-priority programme ranking and admission requirements apply', ARRAY["Full tuition fee waiver; living costs not covered"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int032', ''), gen_random_uuid()::text)::uuid, 'Anders Wall’s Scholarship for Studies at Uppsala University', 'Uppsala University / Anders Wall Foundation', 'Uppsala University', 'Anders Wall’s Scholarship for Studies at Uppsala University supports eligible international applicants to study in Sweden. Official Uppsala scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://www.uu.se/en/study/masters-studies/scholarships/uppsala-university-scholarships',
  'open', 'other', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'anders-wall-s-scholarship-for-studies-at-uppsala-university-int032', NULL::date, ARRAY["Selected master’s programmes"]::text[], ARRAY["masters"]::text[],
  'Sweden', 'Annual; admissions-linked', 'Applicants from African countries including Ghana, subject to programme and admission rules', ARRAY["Full tuition fee waiver; living costs not covered"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int033', ''), gen_random_uuid()::text)::uuid, 'CyprusAid Scholarship Scheme at University of Nicosia', 'Government of Cyprus / University of Nicosia', 'University of Nicosia / designated Cyprus institution', 'CyprusAid Scholarship Scheme at University of Nicosia supports eligible international applicants to study in Cyprus. Official Ghana Scholarships Authority foreign notice. Review the linked official call for the current award conditions and participating courses.', 'https://scholarships.gov.gh/opportunities/',
  'closed', 'tuition_only', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'cyprusaid-scholarship-scheme-at-university-of-nicosia-int033', NULL::date, ARRAY["Master of Advanced Studies in European and International Governance / specific published programme"]::text[], ARRAY["masters"]::text[],
  'Cyprus', 'Notice-specific; previous call closed', 'Ghanaian applicants invited through Ghana Scholarships Authority notice; check current nomination and programme terms', ARRAY["Tuition support as stated in official cycle notice"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int034', ''), gen_random_uuid()::text)::uuid, 'World in Serbia Scholarship Programme', 'Government of Serbia', 'Accredited public universities in Serbia', 'World in Serbia Scholarship Programme supports eligible international applicants to study in Serbia. Official Ghana Scholarships Authority notice. Review the linked official call for the current award conditions and participating courses.', 'https://scholarships.gov.gh/opportunities/scholarship-opportunity-in-the-republic-of-Serbia',
  'closed', 'other', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'world-in-serbia-scholarship-programme-int034', NULL::date, ARRAY["Programmes at accredited Serbian public institutions"]::text[], ARRAY["undergraduate", "masters", "phd"]::text[],
  'Serbia', '2026/27 call closed 26 Jun 2026', 'Ghanaian citizens explicitly invited through Ghana Scholarships Authority; nomination route applies', ARRAY["Scholarship package according to Serbia bilateral offer; verify tuition, stipend and travel in current call"]::text[], ARRAY["Official application form", "Ghanaian passport/ID", "academic certificates and transcripts", "CV", "references", "admission/course evidence where required", "personal statement/study plan", "other documents in the country-specific call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int035', ''), gen_random_uuid()::text)::uuid, 'Chinese Government Scholarship (CSC Type A / Bilateral)', 'China Scholarship Council / Ghana Scholarships Authority', 'Participating Chinese universities', 'Chinese Government Scholarship (CSC Type A / Bilateral) supports eligible international applicants to study in China. Official CSC portal and Ghana authority channel. Review the linked official call for the current award conditions and participating courses.', 'https://www.campuschina.org/',
  'open', 'other', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'chinese-government-scholarship-csc-type-a-bilateral-int035', NULL::date, ARRAY["Chinese universities and approved programmes"]::text[], ARRAY["undergraduate", "masters", "phd"]::text[],
  'China', 'Annual; Ghana nomination calendar', 'Ghanaian applicants use the bilateral route and Ghana nomination instructions; annual agency number and quota apply', ARRAY["Tuition, accommodation, stipend and medical insurance according to award category"]::text[], ARRAY["Official application form", "Ghanaian passport/ID", "academic certificates and transcripts", "CV", "references", "admission/course evidence where required", "personal statement/study plan", "other documents in the country-specific call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int036', ''), gen_random_uuid()::text)::uuid, 'UNESCO/China Great Wall Co-Sponsored Fellowships', 'UNESCO / Government of China', 'Participating Chinese universities', 'UNESCO/China Great Wall Co-Sponsored Fellowships supports eligible international applicants to study in China. Official UNESCO fellowship portal. Review the linked official call for the current award conditions and participating courses.', 'https://www.unesco.org/en/fellowships',
  'open', 'grant', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'unesco-china-great-wall-co-sponsored-fellowships-int036', NULL::date, ARRAY["Selected priority disciplines and research programmes"]::text[], ARRAY["masters", "phd", "postdoctoral"]::text[],
  'China', 'Annual; country allocation dependent', 'Ghana eligibility depends on UNESCO country allocation and national commission nomination for each cycle', ARRAY["Tuition, accommodation, stipend and medical insurance according to call"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int037', ''), gen_random_uuid()::text)::uuid, 'MEXT Research Students Scholarship', 'Government of Japan / MEXT', 'Japanese universities', 'MEXT Research Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.', 'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mext-research-students-scholarship-int037', NULL::date, ARRAY["Research leading to graduate degree"]::text[], ARRAY["masters", "phd", "postdoctoral"]::text[],
  'Japan', 'Annual; embassy schedule', 'Ghanaian applicants may apply through Japanese Embassy in Ghana when annual call opens; academic and age requirements apply', ARRAY["Tuition, monthly stipend and airfare"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int038', ''), gen_random_uuid()::text)::uuid, 'MEXT Undergraduate Students Scholarship', 'Government of Japan / MEXT', 'Japanese universities', 'MEXT Undergraduate Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.', 'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mext-undergraduate-students-scholarship-int038', NULL::date, ARRAY["Natural sciences", "social sciences and humanities tracks"]::text[], ARRAY["undergraduate"]::text[],
  'Japan', 'Annual; embassy schedule', 'Ghanaian applicants may apply through Japanese Embassy in Ghana; age, school results and examinations apply', ARRAY["Tuition, monthly stipend, preparatory education and airfare"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int039', ''), gen_random_uuid()::text)::uuid, 'MEXT Japanese Studies Students Scholarship', 'Government of Japan / MEXT', 'Japanese universities', 'MEXT Japanese Studies Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.', 'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mext-japanese-studies-students-scholarship-int039', NULL::date, ARRAY["Japanese language and culture studies"]::text[], ARRAY["undergraduate"]::text[],
  'Japan', 'Annual; embassy schedule', 'Ghanaian students enrolled in relevant undergraduate Japanese studies may apply through embassy recommendation', ARRAY["Tuition, monthly stipend and airfare"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int040', ''), gen_random_uuid()::text)::uuid, 'MEXT College of Technology Students Scholarship', 'Government of Japan / MEXT', 'Japanese colleges of technology', 'MEXT College of Technology Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.', 'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mext-college-of-technology-students-scholarship-int040', NULL::date, ARRAY["Engineering and technology college programmes"]::text[], ARRAY["diploma"]::text[],
  'Japan', 'Annual; embassy schedule', 'Ghanaian applicants may apply through embassy recommendation; age and science/mathematics prerequisites apply', ARRAY["Tuition, stipend, preparatory Japanese and airfare"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int041', ''), gen_random_uuid()::text)::uuid, 'MEXT Specialized Training College Students Scholarship', 'Government of Japan / MEXT', 'Japanese specialised training colleges', 'MEXT Specialized Training College Students Scholarship supports eligible international applicants to study in Japan. Official Study in Japan MEXT page. Review the linked official call for the current award conditions and participating courses.', 'https://www.studyinjapan.go.jp/en/planning/scholarships/mext-scholarships/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mext-specialized-training-college-students-scholarship-int041', NULL::date, ARRAY["Technology", "personal care/nutrition", "education", "business", "fashion and related tracks"]::text[], ARRAY["diploma"]::text[],
  'Japan', 'Annual; embassy schedule', 'Ghanaian applicants may apply through embassy recommendation; age and examination criteria apply', ARRAY["Tuition, stipend, preparatory Japanese and airfare"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int042', ''), gen_random_uuid()::text)::uuid, 'Australia Awards Scholarships (Africa)', 'Australian Government Department of Foreign Affairs and Trade', 'Participating Australian universities', 'Australia Awards Scholarships (Africa) supports eligible international applicants to study in Australia. Official DFAT participating countries and intake dates. Review the linked official call for the current award conditions and participating courses.', 'https://www.dfat.gov.au/people-to-people/australia-awards/participating-countries',
  'closed', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'australia-awards-scholarships-africa-int042', NULL::date, ARRAY["Priority development fields in Africa country profile"]::text[], ARRAY["masters"]::text[],
  'Australia', '2027 intake closed 30 Apr 2026', 'Ghana explicitly listed as participating country; Ghana country profile, work experience and return-home conditions apply', ARRAY["Tuition, return airfare, establishment allowance, living contribution and health cover"]::text[], ARRAY["Official application form", "Ghanaian passport/ID", "academic certificates and transcripts", "CV", "references", "admission/course evidence where required", "personal statement/study plan", "other documents in the country-specific call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int043', ''), gen_random_uuid()::text)::uuid, 'Monash International Merit Scholarship', 'Monash University', 'Monash University', 'Monash International Merit Scholarship supports eligible international applicants to study in Australia. Official Monash scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://www.monash.edu/study/fees-scholarships/scholarships/find-a-scholarship/international-merit-5770',
  'open', 'tuition_only', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'monash-international-merit-scholarship-int043', NULL::date, ARRAY["Eligible undergraduate and postgraduate coursework"]::text[], ARRAY["undergraduate", "masters"]::text[],
  'Australia', 'Annual; admission-linked', 'International fee-paying students including Ghanaian applicants; academic merit and course exclusions apply', ARRAY["Tuition fee contribution; amount and duration under current terms"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int044', ''), gen_random_uuid()::text)::uuid, 'University of Melbourne Graduate Research Scholarships', 'University of Melbourne', 'University of Melbourne', 'University of Melbourne Graduate Research Scholarships supports eligible international applicants to study in Australia. Official Melbourne scholarship page. Review the linked official call for the current award conditions and participating courses.', 'https://scholarships.unimelb.edu.au/awards/graduate-research-scholarships',
  'open', 'fellowship', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'university-of-melbourne-graduate-research-scholarships-int044', NULL::date, ARRAY["Research master’s and doctoral programmes"]::text[], ARRAY["masters", "phd"]::text[],
  'Australia', 'Annual; admission/research round', 'Domestic and international research applicants including Ghanaians; selection based on academic merit', ARRAY["Full fee offset, living stipend, relocation grant and overseas student health cover for eligible international awardees"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int045', ''), gen_random_uuid()::text)::uuid, 'Adelaide University Global Academic Excellence Scholarship', 'Adelaide University', 'Adelaide University', 'Adelaide University Global Academic Excellence Scholarship supports eligible international applicants to study in Australia. Official Adelaide University site; exact award page required. Review the linked official call for the current award conditions and participating courses.', 'https://adelaide.edu.au/',
  'upcoming', 'tuition_only', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'adelaide-university-global-academic-excellence-scholarship-int045', NULL::date, ARRAY["Eligible undergraduate and postgraduate coursework"]::text[], ARRAY["undergraduate", "masters"]::text[],
  'Australia', 'Annual; 2027 award details to reconfirm', 'International applicants including Ghanaian students; verify 2027 award name, transition arrangements and eligible programmes', ARRAY["Tuition reduction under current published terms"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int046', ''), gen_random_uuid()::text)::uuid, 'University of Sydney International Scholarship', 'University of Sydney', 'University of Sydney', 'University of Sydney International Scholarship supports eligible international applicants to study in Australia. Official University of Sydney scholarship directory. Review the linked official call for the current award conditions and participating courses.', 'https://www.sydney.edu.au/scholarships/international.html',
  'open', 'tuition_only', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'university-of-sydney-international-scholarship-int046', NULL::date, ARRAY["Research degrees and selected coursework awards"]::text[], ARRAY["masters", "phd"]::text[],
  'Australia', 'Round-specific', 'International applicants including Ghanaians; exact award, supervisor and research round determine eligibility', ARRAY["Stipend and/or tuition support depending on named award"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int047', ''), gen_random_uuid()::text)::uuid, 'Mandela Rhodes Scholarship', 'Mandela Rhodes Foundation', 'Participating South African universities', 'Mandela Rhodes Scholarship supports eligible international applicants to study in South Africa. Official Mandela Rhodes Foundation. Review the linked official call for the current award conditions and participating courses.', 'https://www.mandelarhodes.org/scholarship/',
  'open', 'fully_funded', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mandela-rhodes-scholarship-int047', NULL::date, ARRAY["Honours and master’s study at South African universities"]::text[], ARRAY["masters"]::text[],
  'South Africa', 'Annual; check 2027 call', 'Citizens of African countries including Ghana; age, academic and leadership requirements apply', ARRAY["Tuition, accommodation, meals, stipend, books, research and medical aid"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int048', ''), gen_random_uuid()::text)::uuid, 'Mauritius-Africa Scholarship Scheme', 'Government of Mauritius / Ghana Scholarships Authority', 'Public higher education institutions in Mauritius', 'Mauritius-Africa Scholarship Scheme supports eligible international applicants to study in Mauritius. Official Ghana Scholarships Authority notice. Review the linked official call for the current award conditions and participating courses.', 'https://scholarships.gov.gh/opportunities/the-mauritius-africa-scholarship-scheme-20262027-academic-year',
  'open', 'other', 'international', 'all',
  TRUE, 'verified', FALSE, FALSE,
  TRUE, 'mauritius-africa-scholarship-scheme-int048', NULL::date, ARRAY["Public higher education institutions in Mauritius"]::text[], ARRAY["diploma", "undergraduate", "masters", "other", "phd"]::text[],
  'Mauritius', '2026/27 call; check next cycle', 'Ghanaian citizens resident in Ghana explicitly eligible; age and academic requirements differ by level', ARRAY["Coverage and travel/allowances according to annual scheme terms"]::text[], ARRAY["Official application form", "Ghanaian passport/ID", "academic certificates and transcripts", "CV", "references", "admission/course evidence where required", "personal statement/study plan", "other documents in the country-specific call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int049', ''), gen_random_uuid()::text)::uuid, 'Brazil PEC-G Undergraduate Student Agreement Programme', 'Government of Brazil / Ministry of Foreign Affairs', 'Participating Brazilian universities', 'Brazil PEC-G Undergraduate Student Agreement Programme supports eligible international applicants to study in Brazil. Official Brazilian government PEC-G page. Review the linked official call for the current award conditions and participating courses.', 'https://www.gov.br/mre/pt-br/assuntos/cultura-e-educacao/temas-educacionais/programa-de-estudantes-convenio-de-graduacao-pec-g',
  'open', 'other', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'brazil-pec-g-undergraduate-student-agreement-programme-int049', NULL::date, ARRAY["Undergraduate courses at participating Brazilian institutions"]::text[], ARRAY["undergraduate"]::text[],
  'Brazil', 'Annual; country nomination calendar', 'Ghanaian applicants may participate only if Ghana is included in the current partner-country call and nomination route; Portuguese proficiency and financial means required', ARRAY["Tuition-free placement; living costs are generally applicant responsibility unless separate support applies"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

INSERT INTO scholarships (
  id, title, provider, institution, description, official_url,
  application_status, funding_type, geographic_scope, gender_eligibility,
  is_verified, verification_status, institution_specific, is_public_institution,
  is_published, slug, application_deadline, fields_of_study, study_levels,
  host_country, deadline_text, eligibility_requirements, benefits, required_documents, created_at
) VALUES (
  COALESCE(NULLIF('sch_int050', ''), gen_random_uuid()::text)::uuid, 'Brazil PEC-PG Postgraduate Student Agreement Programme', 'CAPES / Government of Brazil', 'Participating Brazilian universities', 'Brazil PEC-PG Postgraduate Student Agreement Programme supports eligible international applicants to study in Brazil. Official CAPES international scholarship portal. Review the linked official call for the current award conditions and participating courses.', 'https://www.gov.br/capes/pt-br/assuntos/bolsas-e-auxilios-internacionais',
  'open', 'other', 'international', 'all',
  FALSE, 'needs_verification', FALSE, FALSE,
  TRUE, 'brazil-pec-pg-postgraduate-student-agreement-programme-int050', NULL::date, ARRAY["Postgraduate study and research at Brazilian institutions"]::text[], ARRAY["masters", "phd"]::text[],
  'Brazil', 'Annual; call-specific', 'Ghanaian eligibility depends on participating-country arrangements and current call; Portuguese/language, supervisor and research proposal requirements apply', ARRAY["Scholarship stipend and other benefits as specified in annual CAPES call"]::text[], ARRAY["Application form", "academic transcripts/certificates", "passport or national ID", "CV", "references", "admission evidence", "personal statement/research proposal", "language evidence where required. Confirm exact checklist in current call."]::text[], NOW()
) ON CONFLICT (slug) DO UPDATE SET
  title = EXCLUDED.title,
  provider = EXCLUDED.provider,
  institution = EXCLUDED.institution,
  description = EXCLUDED.description,
  official_url = EXCLUDED.official_url,
  application_status = EXCLUDED.application_status,
  funding_type = EXCLUDED.funding_type,
  geographic_scope = EXCLUDED.geographic_scope,
  host_country = EXCLUDED.host_country,
  deadline_text = EXCLUDED.deadline_text,
  study_levels = EXCLUDED.study_levels,
  fields_of_study = EXCLUDED.fields_of_study,
  is_published = EXCLUDED.is_published;

