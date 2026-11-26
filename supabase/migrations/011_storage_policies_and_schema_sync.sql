-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — STORAGE POLICIES & SCHEMA SYNC
-- Migration: 011_storage_policies_and_schema_sync.sql
-- ============================================================

-- 1. Ensure columns exist on public.scholarships
ALTER TABLE public.scholarships 
  ADD COLUMN IF NOT EXISTS host_country TEXT DEFAULT 'Ghana',
  ADD COLUMN IF NOT EXISTS target_countries TEXT[] DEFAULT ARRAY['Ghana']::TEXT[],
  ADD COLUMN IF NOT EXISTS application_process TEXT[];

-- 2. Ensure Storage Buckets exist and are public
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES 
  ('scholarship-logos', 'scholarship-logos', true, 5242880, ARRAY['image/png', 'image/jpeg', 'image/webp', 'image/svg+xml']),
  ('avatars', 'avatars', true, 5242880, ARRAY['image/png', 'image/jpeg', 'image/jpg', 'image/webp'])
ON CONFLICT (id) DO UPDATE SET 
  public = true,
  file_size_limit = EXCLUDED.file_size_limit,
  allowed_mime_types = EXCLUDED.allowed_mime_types;

-- 3. Storage Security Policies for 'scholarship-logos'
-- Public read access: Anyone can view scholarship provider logos
DROP POLICY IF EXISTS "Public Access: View scholarship logos" ON storage.objects;
CREATE POLICY "Public Access: View scholarship logos" 
  ON storage.objects FOR SELECT 
  USING (bucket_id = 'scholarship-logos');

-- Admin write access: Use public.is_admin() SECURITY DEFINER helper to prevent recursion and enforce admin privileges
DROP POLICY IF EXISTS "Admin Access: Upload scholarship logos" ON storage.objects;
CREATE POLICY "Admin Access: Upload scholarship logos" 
  ON storage.objects FOR INSERT 
  TO authenticated 
  WITH CHECK (
    bucket_id = 'scholarship-logos' 
    AND public.is_admin()
  );

DROP POLICY IF EXISTS "Admin Access: Update scholarship logos" ON storage.objects;
CREATE POLICY "Admin Access: Update scholarship logos" 
  ON storage.objects FOR UPDATE 
  TO authenticated 
  USING (
    bucket_id = 'scholarship-logos' 
    AND public.is_admin()
  );

DROP POLICY IF EXISTS "Admin Access: Delete scholarship logos" ON storage.objects;
CREATE POLICY "Admin Access: Delete scholarship logos" 
  ON storage.objects FOR DELETE 
  TO authenticated 
  USING (
    bucket_id = 'scholarship-logos' 
    AND public.is_admin()
  );

-- 4. Storage Security Policies for 'avatars'
DROP POLICY IF EXISTS "Public Access: View avatars" ON storage.objects;
CREATE POLICY "Public Access: View avatars" 
  ON storage.objects FOR SELECT 
  USING (bucket_id = 'avatars');

DROP POLICY IF EXISTS "User Access: Upload own avatar" ON storage.objects;
CREATE POLICY "User Access: Upload own avatar" 
  ON storage.objects FOR INSERT 
  TO authenticated 
  WITH CHECK (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

DROP POLICY IF EXISTS "User Access: Update own avatar" ON storage.objects;
CREATE POLICY "User Access: Update own avatar" 
  ON storage.objects FOR UPDATE 
  TO authenticated 
  USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

DROP POLICY IF EXISTS "User Access: Delete own avatar" ON storage.objects;
CREATE POLICY "User Access: Delete own avatar" 
  ON storage.objects FOR DELETE 
  TO authenticated 
  USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

-- 5. Privileges on storage and public schemas
GRANT USAGE ON SCHEMA storage TO anon, authenticated, service_role;
GRANT ALL ON ALL TABLES IN SCHEMA storage TO service_role;
GRANT SELECT ON storage.objects TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON storage.objects TO authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA public TO service_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon, authenticated;
