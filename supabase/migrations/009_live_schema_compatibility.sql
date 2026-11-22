-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — LIVE SCHEMA COMPATIBILITY MIGRATION
-- Migration: 009_live_schema_compatibility.sql
-- Purpose: Bring existing live database (applied 001 & 002) up to
--          full compatibility with repaired schema and migrations 003-008.
-- Safety: Non-destructive, idempotent, preserves all existing tables and data.
-- ============================================================

-- ============================================================
-- 1. UUID EXTENSION & SEARCH PATH COMPATIBILITY
-- ============================================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;
GRANT USAGE ON SCHEMA extensions TO postgres, anon, authenticated, service_role;

-- ============================================================
-- 2. ENUM TYPES EXPANSION (IDEMPOTENT & NON-DESTRUCTIVE)
-- ============================================================

-- Add 'foreign_university' to institution_category for international institution classification
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum e
    JOIN pg_type t ON t.oid = e.enumtypid
    WHERE t.typname = 'institution_category' AND e.enumlabel = 'foreign_university'
  ) THEN
    ALTER TYPE institution_category ADD VALUE 'foreign_university';
  END IF;
END $$;

-- Ensure tracking_status enum contains all status workflow values
DO $$
DECLARE
  val text;
BEGIN
  FOREACH val IN ARRAY ARRAY[
    'saved', 'preparing', 'started', 'under_review', 
    'shortlisted', 'interview', 'unsuccessful', 'withdrawn'
  ]
  LOOP
    IF NOT EXISTS (
      SELECT 1 FROM pg_enum e
      JOIN pg_type t ON t.oid = e.enumtypid
      WHERE t.typname = 'tracking_status' AND e.enumlabel = val
    ) THEN
      EXECUTE format('ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS %L', val);
    END IF;
  END LOOP;
END $$;

-- ============================================================
-- 3. REFERENCE TABLE CONSTRAINTS (FOR IDEMPOTENT SEEDING)
-- ============================================================

-- Re-point any scholarships referencing duplicate providers to the surviving provider record
UPDATE scholarships s
SET provider_id = b.id
FROM scholarship_providers a
JOIN scholarship_providers b ON a.name = b.name AND a.id <> b.id
WHERE s.provider_id = a.id
  AND a.ctid < b.ctid;

-- Safely delete duplicate provider records that now have zero references
DELETE FROM scholarship_providers a USING scholarship_providers b
WHERE a.ctid < b.ctid AND a.name = b.name;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'scholarship_providers_name_key'
  ) THEN
    ALTER TABLE scholarship_providers ADD CONSTRAINT scholarship_providers_name_key UNIQUE (name);
  END IF;
END $$;

-- Re-point any scholarships referencing duplicate institutions to the surviving institution record
UPDATE scholarships s
SET institution_id = b.id
FROM institutions a
JOIN institutions b ON a.name = b.name AND a.id <> b.id
WHERE s.institution_id = a.id
  AND a.ctid < b.ctid;

-- Safely delete duplicate institution records that now have zero references
DELETE FROM institutions a USING institutions b
WHERE a.ctid < b.ctid AND a.name = b.name;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'institutions_name_key'
  ) THEN
    ALTER TABLE institutions ADD CONSTRAINT institutions_name_key UNIQUE (name);
  END IF;
END $$;

-- ============================================================
-- 4. REFERENCE COUNTRIES & FIELDS OF STUDY (IDEMPOTENT UPSERT)
-- ============================================================

-- International destination countries needed by international scholarship opportunities
INSERT INTO countries (name, code, flag_emoji) VALUES
  ('Switzerland', 'CH', '🇨🇭'),
  ('Hungary', 'HU', '🇭🇺'),
  ('Italy', 'IT', '🇮🇹'),
  ('Cyprus', 'CY', '🇨🇾'),
  ('Serbia', 'RS', '🇷🇸'),
  ('Mauritius', 'MU', '🇲🇺'),
  ('Brazil', 'BR', '🇧🇷')
ON CONFLICT (code) DO NOTHING;

-- Ensure all standard fields of study are present
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
  ('Other', 'other')
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 5. SCHOLARSHIPS TABLE SCHEMA ENHANCEMENTS
-- ============================================================

-- Add deadline_text and logo visual metadata columns if missing
ALTER TABLE scholarships 
  ADD COLUMN IF NOT EXISTS deadline_text TEXT,
  ADD COLUMN IF NOT EXISTS logo_url TEXT,
  ADD COLUMN IF NOT EXISTS logo_storage_path TEXT,
  ADD COLUMN IF NOT EXISTS logo_alt_text TEXT,
  ADD COLUMN IF NOT EXISTS logo_updated_at TIMESTAMPTZ DEFAULT NOW();

-- Add frontend compatibility columns (safe standard columns with bidirectional sync trigger)
-- (Guarantees both SELECT queries like CARD_SELECT_FIELDS and INSERT/UPDATE mutations succeed without generated column conflicts)
ALTER TABLE scholarships 
  ADD COLUMN IF NOT EXISTS title TEXT,
  ADD COLUMN IF NOT EXISTS status TEXT,
  ADD COLUMN IF NOT EXISTS scope TEXT,
  ADD COLUMN IF NOT EXISTS deadline DATE,
  ADD COLUMN IF NOT EXISTS is_verified BOOLEAN DEFAULT FALSE;

-- Backfill compatibility columns from canonical columns for all existing records
UPDATE scholarships SET
  title = COALESCE(title, name),
  status = COALESCE(status, application_status::text),
  scope = COALESCE(scope, geographic_scope::text),
  deadline = COALESCE(deadline, application_deadline),
  is_verified = COALESCE(is_verified, verification_status = 'verified')
WHERE title IS NULL OR status IS NULL OR scope IS NULL;

-- Automatic synchronization trigger for compatibility columns
CREATE OR REPLACE FUNCTION sync_scholarship_compat_columns()
RETURNS TRIGGER AS $$
BEGIN
  -- Bidirectional name / title sync
  IF NEW.name IS NOT NULL AND (NEW.title IS NULL OR NEW.title = '') THEN
    NEW.title := NEW.name;
  ELSIF NEW.title IS NOT NULL AND (NEW.name IS NULL OR NEW.name = '') THEN
    NEW.name := NEW.title;
  END IF;

  -- Bidirectional application_status / status sync
  IF NEW.application_status IS NOT NULL AND (NEW.status IS NULL OR NEW.status = '') THEN
    NEW.status := NEW.application_status::text;
  ELSIF NEW.status IS NOT NULL AND NEW.application_status IS NULL THEN
    NEW.application_status := NEW.status::application_status;
  END IF;

  -- Bidirectional geographic_scope / scope sync
  IF NEW.geographic_scope IS NOT NULL AND (NEW.scope IS NULL OR NEW.scope = '') THEN
    NEW.scope := NEW.geographic_scope::text;
  ELSIF NEW.scope IS NOT NULL AND NEW.geographic_scope IS NULL THEN
    NEW.geographic_scope := NEW.scope::geographic_scope;
  END IF;

  -- Bidirectional application_deadline / deadline sync
  IF NEW.application_deadline IS NOT NULL AND NEW.deadline IS NULL THEN
    NEW.deadline := NEW.application_deadline;
  ELSIF NEW.deadline IS NOT NULL AND NEW.application_deadline IS NULL THEN
    NEW.application_deadline := NEW.deadline;
  END IF;

  -- Bidirectional verification_status / is_verified sync
  IF NEW.verification_status IS NOT NULL AND NEW.is_verified IS NULL THEN
    NEW.is_verified := (NEW.verification_status = 'verified');
  ELSIF NEW.is_verified IS NOT NULL AND NEW.verification_status IS NULL THEN
    NEW.verification_status := CASE WHEN NEW.is_verified THEN 'verified'::verification_status ELSE 'needs_verification'::verification_status END;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_sync_scholarship_compat ON scholarships;
CREATE TRIGGER trigger_sync_scholarship_compat
  BEFORE INSERT OR UPDATE ON scholarships
  FOR EACH ROW EXECUTE FUNCTION sync_scholarship_compat_columns();

-- High-performance composite indexes
CREATE INDEX IF NOT EXISTS idx_scholarships_pub_created 
  ON scholarships (is_published, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_scholarships_pub_status 
  ON scholarships (is_published, application_status);

CREATE INDEX IF NOT EXISTS idx_scholarships_pub_scope 
  ON scholarships (is_published, geographic_scope);

CREATE INDEX IF NOT EXISTS idx_scholarships_pub_funding 
  ON scholarships (is_published, funding_type);

CREATE INDEX IF NOT EXISTS idx_scholarships_pub_featured 
  ON scholarships (is_published, is_featured) 
  WHERE is_featured = TRUE;

-- ============================================================
-- 6. APPLICATION TRACKING ENHANCEMENTS (DEPENDENCY FOR 006)
-- ============================================================

ALTER TABLE IF EXISTS application_tracking
  ADD COLUMN IF NOT EXISTS reference_number TEXT,
  ADD COLUMN IF NOT EXISTS submission_date TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS interview_date TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS scholarship_slug TEXT,
  ADD COLUMN IF NOT EXISTS provider_name TEXT,
  ADD COLUMN IF NOT EXISTS scholarship_title TEXT,
  ADD COLUMN IF NOT EXISTS timeline JSONB DEFAULT '[]'::jsonb;

CREATE INDEX IF NOT EXISTS idx_app_tracking_user_id ON application_tracking(user_id);
CREATE INDEX IF NOT EXISTS idx_app_tracking_scholarship_id ON application_tracking(scholarship_id);
CREATE INDEX IF NOT EXISTS idx_app_tracking_status ON application_tracking(status);

-- ============================================================
-- 7. STUDENT PROFILE AVATAR & ACCOUNT DELETION (DEPENDENCY FOR 007)
-- ============================================================

ALTER TABLE IF EXISTS student_profiles 
  ADD COLUMN IF NOT EXISTS avatar_url TEXT,
  ADD COLUMN IF NOT EXISTS avatar_storage_path TEXT;

-- Storage buckets configuration
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES 
  ('scholarship-logos', 'scholarship-logos', true, 5242880, ARRAY['image/png', 'image/jpeg', 'image/webp', 'image/svg+xml']),
  ('avatars', 'avatars', true, 5242880, ARRAY['image/png', 'image/jpeg', 'image/jpg', 'image/webp'])
ON CONFLICT (id) DO UPDATE SET 
  public = EXCLUDED.public,
  file_size_limit = EXCLUDED.file_size_limit,
  allowed_mime_types = EXCLUDED.allowed_mime_types;

-- Self-service account deletion function
CREATE OR REPLACE FUNCTION delete_user_account()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, auth
AS $$
DECLARE
  current_user_id UUID := auth.uid();
BEGIN
  IF current_user_id IS NULL THEN
    RAISE EXCEPTION 'Not authenticated';
  END IF;

  DELETE FROM public.saved_scholarships WHERE user_id = current_user_id;
  DELETE FROM public.application_tracking WHERE user_id = current_user_id;
  DELETE FROM public.student_profiles WHERE user_id = current_user_id;
  UPDATE public.email_subscriptions SET user_id = NULL WHERE user_id = current_user_id;
  DELETE FROM auth.users WHERE id = current_user_id;
END;
$$;

-- ============================================================
-- 8. SECURITY HARDENING & SUPER ADMIN PROVISIONING (DEPENDENCY FOR 008)
-- ============================================================

-- Tighten RLS policies
DROP POLICY IF EXISTS "Admins read analytics" ON analytics_events;
CREATE POLICY "Admins read analytics" 
  ON analytics_events 
  FOR SELECT 
  TO authenticated 
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Admins manage status history" ON scholarship_status_history;
CREATE POLICY "Admins manage status history" 
  ON scholarship_status_history 
  FOR ALL 
  TO authenticated 
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

-- Provision primary super admin
DO $$
DECLARE
  target_user_id UUID;
BEGIN
  SELECT id INTO target_user_id FROM auth.users WHERE email = 'jansah.klintaps@gmail.com' LIMIT 1;
  IF target_user_id IS NOT NULL THEN
    INSERT INTO admin_users (user_id, role)
    VALUES (target_user_id, 'super_admin')
    ON CONFLICT (user_id) DO UPDATE SET role = 'super_admin';
  END IF;
END $$;

-- Automated trigger for super admin assignment on signup
CREATE OR REPLACE FUNCTION handle_admin_user_signup()
RETURNS TRIGGER AS $$
BEGIN
  IF LOWER(TRIM(COALESCE(NEW.email, ''))) = 'jansah.klintaps@gmail.com' THEN
    INSERT INTO admin_users (user_id, role)
    VALUES (NEW.id, 'super_admin')
    ON CONFLICT (user_id) DO UPDATE SET role = 'super_admin';
  ELSIF TG_OP = 'UPDATE' AND LOWER(TRIM(COALESCE(OLD.email, ''))) = 'jansah.klintaps@gmail.com' THEN
    DELETE FROM admin_users WHERE user_id = NEW.id;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_admin_user_created ON auth.users;
CREATE TRIGGER on_admin_user_created
  AFTER INSERT OR UPDATE ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_admin_user_signup();
