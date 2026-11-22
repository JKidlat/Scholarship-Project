-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — DATABASE SCHEMA
-- Migration: 001_initial_schema.sql
-- Run in Supabase SQL Editor (or via Supabase CLI migrations)
-- ============================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================
-- ENUMS
-- ============================================================
CREATE TYPE geographic_scope AS ENUM ('local', 'international', 'both');
CREATE TYPE application_status AS ENUM ('open', 'closed', 'upcoming', 'rolling', 'unannounced', 'archived');
CREATE TYPE funding_type AS ENUM ('fully_funded', 'partially_funded', 'tuition_only', 'bursary', 'grant', 'fellowship', 'research', 'loan', 'other');
CREATE TYPE study_level AS ENUM ('shs', 'diploma', 'vocational', 'undergraduate', 'postgraduate', 'masters', 'phd', 'postdoctoral', 'other');
CREATE TYPE gender_eligibility AS ENUM ('all', 'women', 'men', 'women_priority', 'men_priority');
CREATE TYPE verification_status AS ENUM ('verified', 'needs_verification', 'under_review', 'archived');
CREATE TYPE institution_category AS ENUM ('public_university', 'private_university', 'public_tertiary', 'private_tertiary', 'other');
CREATE TYPE deadline_type AS ENUM ('fixed', 'rolling', 'unannounced');
CREATE TYPE import_status AS ENUM ('pending', 'processing', 'completed', 'failed');
CREATE TYPE tracking_status AS ENUM ('tracking', 'applied', 'submitted', 'awarded', 'rejected');

-- ============================================================
-- COUNTRIES
-- ============================================================
CREATE TABLE countries (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        TEXT NOT NULL UNIQUE,
  code        CHAR(2) NOT NULL UNIQUE,
  flag_emoji  TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Seed common countries
INSERT INTO countries (name, code, flag_emoji) VALUES
  ('Ghana', 'GH', '🇬🇭'),
  ('United Kingdom', 'GB', '🇬🇧'),
  ('United States', 'US', '🇺🇸'),
  ('Canada', 'CA', '🇨🇦'),
  ('Germany', 'DE', '🇩🇪'),
  ('Japan', 'JP', '🇯🇵'),
  ('China', 'CN', '🇨🇳'),
  ('Australia', 'AU', '🇦🇺'),
  ('France', 'FR', '🇫🇷'),
  ('Netherlands', 'NL', '🇳🇱'),
  ('Sweden', 'SE', '🇸🇪'),
  ('Norway', 'NO', '🇳🇴'),
  ('South Korea', 'KR', '🇰🇷'),
  ('India', 'IN', '🇮🇳'),
  ('Nigeria', 'NG', '🇳🇬'),
  ('South Africa', 'ZA', '🇿🇦'),
  ('Kenya', 'KE', '🇰🇪'),
  ('Turkey', 'TR', '🇹🇷'),
  ('Russia', 'RU', '🇷🇺'),
  ('Other', 'OT', '🌍');

-- ============================================================
-- FIELDS OF STUDY
-- ============================================================
CREATE TABLE fields_of_study (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        TEXT NOT NULL UNIQUE,
  slug        TEXT NOT NULL UNIQUE,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO fields_of_study (name, slug) VALUES
  ('Engineering', 'engineering'),
  ('Medicine and Health Sciences', 'medicine-health-sciences'),
  ('Computer Science and IT', 'computer-science-it'),
  ('Business and Management', 'business-management'),
  ('Agriculture', 'agriculture'),
  ('Education', 'education'),
  ('Law', 'law'),
  ('Social Sciences', 'social-sciences'),
  ('Arts and Humanities', 'arts-humanities'),
  ('Science (General)', 'science'),
  ('Architecture', 'architecture'),
  ('Environmental Studies', 'environmental-studies'),
  ('Economics', 'economics'),
  ('Mathematics and Statistics', 'mathematics-statistics'),
  ('Communication and Media', 'communication-media'),
  ('Public Health', 'public-health'),
  ('Nursing', 'nursing'),
  ('Pharmacy', 'pharmacy'),
  ('Veterinary Science', 'veterinary-science'),
  ('Other', 'other');

-- ============================================================
-- SCHOLARSHIP PROVIDERS
-- ============================================================
CREATE TABLE scholarship_providers (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        TEXT NOT NULL,
  website     TEXT,
  logo_url    TEXT,
  description TEXT,
  country_id  UUID REFERENCES countries(id),
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- INSTITUTIONS
-- ============================================================
CREATE TABLE institutions (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name        TEXT NOT NULL,
  category    institution_category NOT NULL DEFAULT 'public_university',
  country_id  UUID REFERENCES countries(id),
  website     TEXT,
  logo_url    TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- SCHOLARSHIPS (CORE TABLE)
-- ============================================================
CREATE TABLE scholarships (
  id                            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  slug                          TEXT NOT NULL UNIQUE,
  name                          TEXT NOT NULL,
  short_description             TEXT,
  full_description              TEXT,
  
  -- Classification
  geographic_scope              geographic_scope NOT NULL DEFAULT 'local',
  funding_type                  funding_type NOT NULL DEFAULT 'other',
  application_status            application_status NOT NULL DEFAULT 'unannounced',
  gender_eligibility            gender_eligibility NOT NULL DEFAULT 'all',
  verification_status           verification_status NOT NULL DEFAULT 'needs_verification',
  
  -- Provider
  provider_id                   UUID REFERENCES scholarship_providers(id) ON DELETE SET NULL,
  
  -- Institution
  institution_specific          BOOLEAN NOT NULL DEFAULT FALSE,
  institution_id                UUID REFERENCES institutions(id) ON DELETE SET NULL,
  institution_category_restriction  institution_category,
  
  -- Public school restriction
  public_school_specific        BOOLEAN NOT NULL DEFAULT FALSE,
  public_school_restriction_note TEXT,
  
  -- Eligibility text (free text from import)
  eligibility_requirements      TEXT,
  application_instructions      TEXT,
  benefits                      TEXT[], -- Array of benefit strings
  required_documents            TEXT[], -- Array of document requirements
  
  -- Dates
  application_open_date         DATE,
  application_deadline          DATE,
  deadline_type                 deadline_type NOT NULL DEFAULT 'unannounced',
  
  -- Links
  application_url               TEXT,
  information_url               TEXT,
  official_source_url           TEXT,
  
  -- Admin
  admin_notes                   TEXT,
  last_verified_at              TIMESTAMPTZ,
  
  -- Publication
  is_published                  BOOLEAN NOT NULL DEFAULT FALSE,
  is_featured                   BOOLEAN NOT NULL DEFAULT FALSE,
  
  created_at                    TIMESTAMPTZ DEFAULT NOW(),
  updated_at                    TIMESTAMPTZ DEFAULT NOW()
);

-- Index for search performance
CREATE INDEX idx_scholarships_status ON scholarships(application_status);
CREATE INDEX idx_scholarships_scope ON scholarships(geographic_scope);
CREATE INDEX idx_scholarships_funding ON scholarships(funding_type);
CREATE INDEX idx_scholarships_gender ON scholarships(gender_eligibility);
CREATE INDEX idx_scholarships_published ON scholarships(is_published);
CREATE INDEX idx_scholarships_featured ON scholarships(is_featured);
CREATE INDEX idx_scholarships_deadline ON scholarships(application_deadline);
CREATE INDEX idx_scholarships_slug ON scholarships(slug);
-- Full text search index
CREATE INDEX idx_scholarships_fts ON scholarships USING GIN (
  to_tsvector('english', 
    COALESCE(name, '') || ' ' || 
    COALESCE(short_description, '') || ' ' || 
    COALESCE(full_description, '') || ' ' || 
    COALESCE(eligibility_requirements, '')
  )
);

-- ============================================================
-- SCHOLARSHIP STUDY LEVELS (many-to-many)
-- ============================================================
CREATE TABLE scholarship_study_levels (
  scholarship_id  UUID NOT NULL REFERENCES scholarships(id) ON DELETE CASCADE,
  level           study_level NOT NULL,
  PRIMARY KEY (scholarship_id, level)
);

-- ============================================================
-- SCHOLARSHIP FIELDS OF STUDY (many-to-many)
-- ============================================================
CREATE TABLE scholarship_fields (
  scholarship_id    UUID NOT NULL REFERENCES scholarships(id) ON DELETE CASCADE,
  field_id          UUID NOT NULL REFERENCES fields_of_study(id) ON DELETE CASCADE,
  PRIMARY KEY (scholarship_id, field_id)
);

-- ============================================================
-- SCHOLARSHIP DESTINATION COUNTRIES (many-to-many)
-- ============================================================
CREATE TABLE scholarship_destinations (
  scholarship_id  UUID NOT NULL REFERENCES scholarships(id) ON DELETE CASCADE,
  country_id      UUID NOT NULL REFERENCES countries(id) ON DELETE CASCADE,
  PRIMARY KEY (scholarship_id, country_id)
);

-- ============================================================
-- SCHOLARSHIP ELIGIBLE NATIONALITIES (many-to-many)
-- ============================================================
CREATE TABLE scholarship_nationalities (
  scholarship_id  UUID NOT NULL REFERENCES scholarships(id) ON DELETE CASCADE,
  country_id      UUID NOT NULL REFERENCES countries(id) ON DELETE CASCADE,
  PRIMARY KEY (scholarship_id, country_id)
);

-- ============================================================
-- VERIFICATION HISTORY
-- ============================================================
CREATE TABLE verification_history (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  scholarship_id  UUID NOT NULL REFERENCES scholarships(id) ON DELETE CASCADE,
  previous_status verification_status,
  new_status      verification_status NOT NULL,
  notes           TEXT,
  verified_by     UUID REFERENCES auth.users(id),
  created_at      TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- STUDENT PROFILES
-- ============================================================
CREATE TABLE student_profiles (
  id                        UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id                   UUID NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  full_name                 TEXT,
  nationality               TEXT,
  country_of_residence      TEXT,
  current_level             study_level,
  institution               TEXT,
  field_of_study            TEXT,
  preferred_destination     TEXT,
  graduation_year           INTEGER,
  created_at                TIMESTAMPTZ DEFAULT NOW(),
  updated_at                TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- SAVED SCHOLARSHIPS
-- ============================================================
CREATE TABLE saved_scholarships (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id         UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  scholarship_id  UUID NOT NULL REFERENCES scholarships(id) ON DELETE CASCADE,
  saved_at        TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, scholarship_id)
);

-- ============================================================
-- APPLICATION TRACKING
-- ============================================================
CREATE TABLE application_tracking (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id         UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  scholarship_id  UUID NOT NULL REFERENCES scholarships(id) ON DELETE CASCADE,
  status          tracking_status NOT NULL DEFAULT 'tracking',
  notes           TEXT,
  applied_at      TIMESTAMPTZ,
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, scholarship_id)
);

-- ============================================================
-- EMAIL SUBSCRIPTIONS
-- ============================================================
CREATE TABLE email_subscriptions (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email       TEXT NOT NULL UNIQUE,
  user_id     UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  preferences JSONB DEFAULT '{"new_scholarships": true, "deadline_alerts": true, "matched_opportunities": true}'::jsonb,
  is_active   BOOLEAN NOT NULL DEFAULT TRUE,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- ADMIN ROLES
-- ============================================================
CREATE TABLE admin_users (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id     UUID NOT NULL UNIQUE REFERENCES auth.users(id) ON DELETE CASCADE,
  role        TEXT NOT NULL DEFAULT 'editor', -- 'super_admin' | 'editor'
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- IMPORT BATCHES
-- ============================================================
CREATE TABLE import_batches (
  id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  filename      TEXT NOT NULL,
  total_rows    INTEGER NOT NULL DEFAULT 0,
  imported      INTEGER NOT NULL DEFAULT 0,
  skipped       INTEGER NOT NULL DEFAULT 0,
  errors        INTEGER NOT NULL DEFAULT 0,
  status        import_status NOT NULL DEFAULT 'pending',
  created_by    UUID REFERENCES auth.users(id),
  created_at    TIMESTAMPTZ DEFAULT NOW(),
  completed_at  TIMESTAMPTZ
);

-- ============================================================
-- IMPORT ERRORS
-- ============================================================
CREATE TABLE import_errors (
  id            UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  batch_id      UUID NOT NULL REFERENCES import_batches(id) ON DELETE CASCADE,
  row_number    INTEGER NOT NULL,
  field         TEXT,
  error_message TEXT NOT NULL,
  raw_data      JSONB,
  created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- ROW LEVEL SECURITY POLICIES
-- ============================================================

-- Enable RLS
ALTER TABLE scholarships ENABLE ROW LEVEL SECURITY;
ALTER TABLE student_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE saved_scholarships ENABLE ROW LEVEL SECURITY;
ALTER TABLE application_tracking ENABLE ROW LEVEL SECURITY;
ALTER TABLE email_subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE admin_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE import_batches ENABLE ROW LEVEL SECURITY;
ALTER TABLE import_errors ENABLE ROW LEVEL SECURITY;
ALTER TABLE verification_history ENABLE ROW LEVEL SECURITY;

-- Public can read published scholarships
CREATE POLICY "Public read published scholarships"
  ON scholarships FOR SELECT
  USING (is_published = TRUE);

-- Admins can do everything on scholarships
CREATE POLICY "Admins manage scholarships"
  ON scholarships FOR ALL
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

-- Student profiles: own row only
CREATE POLICY "Users manage own profile"
  ON student_profiles FOR ALL
  USING (user_id = auth.uid());

-- Saved scholarships: own rows only
CREATE POLICY "Users manage own saved"
  ON saved_scholarships FOR ALL
  USING (user_id = auth.uid());

-- Application tracking: own rows only
CREATE POLICY "Users manage own tracking"
  ON application_tracking FOR ALL
  USING (user_id = auth.uid());

-- Email subscriptions: own rows only
CREATE POLICY "Users manage own subscriptions"
  ON email_subscriptions FOR ALL
  USING (email = auth.jwt()->>'email' OR user_id = auth.uid());

-- Admin only: admin_users table
CREATE POLICY "Admins read admin_users"
  ON admin_users FOR SELECT
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

-- Import: admins only
CREATE POLICY "Admins manage imports"
  ON import_batches FOR ALL
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

CREATE POLICY "Admins read import errors"
  ON import_errors FOR SELECT
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

-- Public read reference tables
ALTER TABLE countries ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read countries" ON countries FOR SELECT USING (TRUE);

ALTER TABLE fields_of_study ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read fields" ON fields_of_study FOR SELECT USING (TRUE);

ALTER TABLE institutions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read institutions" ON institutions FOR SELECT USING (TRUE);

ALTER TABLE scholarship_providers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read providers" ON scholarship_providers FOR SELECT USING (TRUE);

ALTER TABLE scholarship_study_levels ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read study levels" ON scholarship_study_levels FOR SELECT USING (TRUE);

ALTER TABLE scholarship_fields ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read scholarship fields" ON scholarship_fields FOR SELECT USING (TRUE);

ALTER TABLE scholarship_destinations ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read destinations" ON scholarship_destinations FOR SELECT USING (TRUE);

ALTER TABLE scholarship_nationalities ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read nationalities" ON scholarship_nationalities FOR SELECT USING (TRUE);

-- ============================================================
-- HELPER FUNCTION: auto-update updated_at
-- ============================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_scholarships_updated_at
  BEFORE UPDATE ON scholarships
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_providers_updated_at
  BEFORE UPDATE ON scholarship_providers
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_institutions_updated_at
  BEFORE UPDATE ON institutions
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_profiles_updated_at
  BEFORE UPDATE ON student_profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_tracking_updated_at
  BEFORE UPDATE ON application_tracking
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ============================================================
-- FUNCTION: auto-create student profile on signup
-- ============================================================
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO student_profiles (user_id, full_name)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'full_name', NEW.email)
  )
  ON CONFLICT (user_id) DO NOTHING;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

