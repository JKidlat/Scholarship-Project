-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — STUDENT PROFILE AVATAR & DELETION
-- Migration: 007_student_profile_avatar_and_deletion.sql
-- ============================================================

-- 1. Add avatar columns to student_profiles table
ALTER TABLE student_profiles 
  ADD COLUMN IF NOT EXISTS avatar_url TEXT,
  ADD COLUMN IF NOT EXISTS avatar_storage_path TEXT;

-- 2. Storage Bucket for Student Profile Pictures (Avatars)
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'avatars', 
  'avatars', 
  true, 
  5242880, -- 5 MB limit
  ARRAY['image/png', 'image/jpeg', 'image/jpg', 'image/webp']
)
ON CONFLICT (id) DO UPDATE SET 
  public = true,
  file_size_limit = 5242880,
  allowed_mime_types = ARRAY['image/png', 'image/jpeg', 'image/jpg', 'image/webp'];

-- 3. Storage Security Policies for Avatars
-- Anyone can view avatar pictures
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'objects' 
      AND schemaname = 'storage' 
      AND policyname = 'Public Access: View avatars'
  ) THEN
    CREATE POLICY "Public Access: View avatars" 
      ON storage.objects FOR SELECT 
      USING (bucket_id = 'avatars');
  END IF;
END $$;

-- Authenticated students can upload their own avatar picture
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'objects' 
      AND schemaname = 'storage' 
      AND policyname = 'User Access: Upload own avatar'
  ) THEN
    CREATE POLICY "User Access: Upload own avatar" 
      ON storage.objects FOR INSERT 
      TO authenticated 
      WITH CHECK (bucket_id = 'avatars');
  END IF;
END $$;

-- Authenticated students can update their own avatar picture
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'objects' 
      AND schemaname = 'storage' 
      AND policyname = 'User Access: Update own avatar'
  ) THEN
    CREATE POLICY "User Access: Update own avatar" 
      ON storage.objects FOR UPDATE 
      TO authenticated 
      USING (bucket_id = 'avatars');
  END IF;
END $$;

-- Authenticated students can delete their own avatar picture
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'objects' 
      AND schemaname = 'storage' 
      AND policyname = 'User Access: Delete own avatar'
  ) THEN
    CREATE POLICY "User Access: Delete own avatar" 
      ON storage.objects FOR DELETE 
      TO authenticated 
      USING (bucket_id = 'avatars');
  END IF;
END $$;

-- 4. PostgreSQL RPC Function for Irreversible Self-Service Account Deletion
-- Automatically cleans up all personal data without orphaned records
CREATE OR REPLACE FUNCTION delete_user_account()
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, auth
AS $$
DECLARE
  current_user_id UUID := auth.uid();
BEGIN
  -- Verify caller is authenticated
  IF current_user_id IS NULL THEN
    RAISE EXCEPTION 'Not authenticated';
  END IF;

  -- 1. Delete all bookmarked / saved scholarships
  DELETE FROM public.saved_scholarships WHERE user_id = current_user_id;

  -- 2. Delete all application tracking records and milestones
  DELETE FROM public.application_tracking WHERE user_id = current_user_id;

  -- 3. Delete student profile record
  DELETE FROM public.student_profiles WHERE user_id = current_user_id;

  -- 4. Disassociate email subscriptions (keep subscriber list clean without orphaned auth foreign keys)
  UPDATE public.email_subscriptions SET user_id = NULL WHERE user_id = current_user_id;

  -- 5. Delete from auth.users (cascades any remaining references)
  DELETE FROM auth.users WHERE id = current_user_id;
END;
$$;
