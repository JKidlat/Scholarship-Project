-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — SECURITY HARDENING MIGRATION
-- Migration: 008_security_hardening.sql
-- ============================================================

-- 1. Tighten Analytics Events RLS Policies
-- Only authenticated administrators should be permitted to read analytics aggregation data
DROP POLICY IF EXISTS "Admins read analytics" ON analytics_events;

CREATE POLICY "Admins read analytics" 
  ON analytics_events 
  FOR SELECT 
  TO authenticated 
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

-- 2. Tighten Scholarship Status Audit History RLS Policies
-- Prevent public or anonymous tampering with audit trail
DROP POLICY IF EXISTS "Admins manage status history" ON scholarship_status_history;

CREATE POLICY "Admins manage status history" 
  ON scholarship_status_history 
  FOR ALL 
  TO authenticated 
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

-- 3. Restrict Reference Table Mutations to Administrators
-- Anyone can read (SELECT), but only admins can INSERT/UPDATE/DELETE
DROP POLICY IF EXISTS "Admins manage providers" ON scholarship_providers;
CREATE POLICY "Admins manage providers" 
  ON scholarship_providers 
  FOR ALL 
  TO authenticated 
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Admins manage institutions" ON institutions;
CREATE POLICY "Admins manage institutions" 
  ON institutions 
  FOR ALL 
  TO authenticated 
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

DROP POLICY IF EXISTS "Admins manage fields" ON fields_of_study;
CREATE POLICY "Admins manage fields" 
  ON fields_of_study 
  FOR ALL 
  TO authenticated 
  USING (EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid()));

-- 4. Restrict Scholarship Logo Uploads in Storage to Administrators
DROP POLICY IF EXISTS "Admin Access: Upload scholarship logos" ON storage.objects;
DROP POLICY IF EXISTS "Admin Access: Update scholarship logos" ON storage.objects;
DROP POLICY IF EXISTS "Admin Access: Delete scholarship logos" ON storage.objects;

CREATE POLICY "Admin Access: Upload scholarship logos" 
  ON storage.objects FOR INSERT 
  TO authenticated 
  WITH CHECK (
    bucket_id = 'scholarship-logos' 
    AND EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid())
  );

CREATE POLICY "Admin Access: Update scholarship logos" 
  ON storage.objects FOR UPDATE 
  TO authenticated 
  USING (
    bucket_id = 'scholarship-logos' 
    AND EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid())
  );

CREATE POLICY "Admin Access: Delete scholarship logos" 
  ON storage.objects FOR DELETE 
  TO authenticated 
  USING (
    bucket_id = 'scholarship-logos' 
    AND EXISTS (SELECT 1 FROM admin_users WHERE user_id = auth.uid())
  );

-- 5. Seed Primary Administrator Role
-- Assign super_admin role to jansah.klintaps@gmail.com
DO $$
DECLARE
  target_user_id UUID;
BEGIN
  -- Look for existing user in auth.users
  SELECT id INTO target_user_id FROM auth.users WHERE email = 'jansah.klintaps@gmail.com' LIMIT 1;
  
  IF target_user_id IS NOT NULL THEN
    INSERT INTO admin_users (user_id, role)
    VALUES (target_user_id, 'super_admin')
    ON CONFLICT (user_id) DO UPDATE SET role = 'super_admin';
  END IF;
END $$;
