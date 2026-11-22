-- ============================================================
-- 006_application_tracking_enhancements.sql
-- Ghana Scholarship Portal: Enhanced Application Progress Tracker
-- ============================================================

-- 1. Extend or recreate tracking_status enum if needed
DO $$
BEGIN
  -- Attempt to add any missing enum values if type exists
  IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'tracking_status') THEN
    ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS 'saved';
    ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS 'preparing';
    ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS 'started';
    ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS 'under_review';
    ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS 'shortlisted';
    ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS 'interview';
    ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS 'unsuccessful';
    ALTER TYPE tracking_status ADD VALUE IF NOT EXISTS 'withdrawn';
  END IF;
EXCEPTION
  WHEN duplicate_object THEN NULL;
END $$;

-- 2. Add extended tracker columns to application_tracking
ALTER TABLE IF EXISTS application_tracking
  ADD COLUMN IF NOT EXISTS reference_number TEXT,
  ADD COLUMN IF NOT EXISTS submission_date TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS interview_date TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS scholarship_slug TEXT,
  ADD COLUMN IF NOT EXISTS provider_name TEXT,
  ADD COLUMN IF NOT EXISTS scholarship_title TEXT,
  ADD COLUMN IF NOT EXISTS timeline JSONB DEFAULT '[]'::jsonb;

-- 3. Ensure Row Level Security is active
ALTER TABLE IF EXISTS application_tracking ENABLE ROW LEVEL SECURITY;

-- 4. RLS Policy: Students can view, insert, update and delete only their own tracked applications
DROP POLICY IF EXISTS "Users manage own tracking" ON application_tracking;
CREATE POLICY "Users manage own tracking"
  ON application_tracking FOR ALL
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

-- 5. Helpful indexes for performance
CREATE INDEX IF NOT EXISTS idx_app_tracking_user_id ON application_tracking(user_id);
CREATE INDEX IF NOT EXISTS idx_app_tracking_scholarship_id ON application_tracking(scholarship_id);
CREATE INDEX IF NOT EXISTS idx_app_tracking_status ON application_tracking(status);
