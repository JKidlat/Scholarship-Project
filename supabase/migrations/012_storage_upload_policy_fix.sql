-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — STORAGE LOGO UPLOAD POLICY FIX
-- Migration: 012_storage_upload_policy_fix.sql
-- ============================================================

-- 1. Ensure the scholarship-logos bucket exists and is public
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'scholarship-logos',
  'scholarship-logos',
  true,
  5242880,
  ARRAY['image/png', 'image/jpeg', 'image/webp', 'image/svg+xml']
)
ON CONFLICT (id) DO UPDATE SET
  public = true,
  file_size_limit = 5242880,
  allowed_mime_types = ARRAY['image/png', 'image/jpeg', 'image/webp', 'image/svg+xml'];

-- 2. Drop existing insert/update policies that restricted uploads solely to Supabase Auth sessions
DROP POLICY IF EXISTS "Admin Access: Upload scholarship logos" ON storage.objects;
DROP POLICY IF EXISTS "Admin Access: Update scholarship logos" ON storage.objects;
DROP POLICY IF EXISTS "Admin Access: Delete scholarship logos" ON storage.objects;
DROP POLICY IF EXISTS "Direct Upload: scholarship logos" ON storage.objects;
DROP POLICY IF EXISTS "Direct Update: scholarship logos" ON storage.objects;
DROP POLICY IF EXISTS "Direct Delete: scholarship logos" ON storage.objects;

-- 3. Allow logo uploads into 'scholarship-logos' bucket under 'logos/' path
CREATE POLICY "Direct Upload: scholarship logos"
  ON storage.objects FOR INSERT
  WITH CHECK (
    bucket_id = 'scholarship-logos'
    AND (name LIKE 'logos/%')
  );

-- 4. Allow updates and deletes on scholarship logos
CREATE POLICY "Direct Update: scholarship logos"
  ON storage.objects FOR UPDATE
  USING (
    bucket_id = 'scholarship-logos'
    AND (name LIKE 'logos/%')
  );

CREATE POLICY "Direct Delete: scholarship logos"
  ON storage.objects FOR DELETE
  USING (
    bucket_id = 'scholarship-logos'
    AND (name LIKE 'logos/%')
  );

-- 5. Ensure public read policy remains intact
DROP POLICY IF EXISTS "Public Access: View scholarship logos" ON storage.objects;
CREATE POLICY "Public Access: View scholarship logos"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'scholarship-logos');

-- 6. Grant appropriate privileges to roles
GRANT USAGE ON SCHEMA storage TO anon, authenticated, service_role;
GRANT ALL ON storage.objects TO service_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON storage.objects TO anon, authenticated;
