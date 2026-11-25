-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — RLS RECURSION FIX & SCHEMA GRANTS
-- Migration: 010_rls_security_definer_fix.sql
-- ============================================================

-- 1. SECURITY DEFINER helper function to prevent recursive RLS on admin_users
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.admin_users WHERE user_id = auth.uid()
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Non-recursive RLS policy on admin_users
DROP POLICY IF EXISTS "Admins read admin_users" ON public.admin_users;
CREATE POLICY "Admins read admin_users" ON public.admin_users FOR SELECT USING (user_id = auth.uid());

-- 3. Use is_admin() across administrative RLS policies
DROP POLICY IF EXISTS "Admins manage scholarships" ON public.scholarships;
CREATE POLICY "Admins manage scholarships" ON public.scholarships FOR ALL USING (public.is_admin());

DROP POLICY IF EXISTS "Admins read analytics" ON public.analytics_events;
CREATE POLICY "Admins read analytics" ON public.analytics_events FOR SELECT USING (public.is_admin());

DROP POLICY IF EXISTS "Admins manage status history" ON public.scholarship_status_history;
CREATE POLICY "Admins manage status history" ON public.scholarship_status_history FOR ALL USING (public.is_admin());

DROP POLICY IF EXISTS "Admins manage providers" ON public.scholarship_providers;
CREATE POLICY "Admins manage providers" ON public.scholarship_providers FOR ALL USING (public.is_admin());

DROP POLICY IF EXISTS "Admins manage institutions" ON public.institutions;
CREATE POLICY "Admins manage institutions" ON public.institutions FOR ALL USING (public.is_admin());

DROP POLICY IF EXISTS "Admins manage fields" ON public.fields_of_study;
CREATE POLICY "Admins manage fields" ON public.fields_of_study FOR ALL USING (public.is_admin());

-- 4. Grant table and schema privileges to Supabase roles
GRANT USAGE ON SCHEMA public TO anon, authenticated, service_role;
GRANT USAGE ON SCHEMA extensions TO anon, authenticated, service_role;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon, authenticated;
GRANT ALL ON ALL TABLES IN SCHEMA public TO service_role;

GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO anon, authenticated, service_role;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO anon, authenticated, service_role;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO anon, authenticated;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON ROUTINES TO anon, authenticated, service_role;
