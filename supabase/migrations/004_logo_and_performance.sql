-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — LOGO UPLOAD & PERFORMANCE MIGRATION
-- Migration: 004_logo_and_performance.sql
-- ============================================================

-- 1. Add Logo & Visual Metadata columns to scholarships table
ALTER TABLE scholarships 
  ADD COLUMN IF NOT EXISTS logo_url TEXT,
  ADD COLUMN IF NOT EXISTS logo_storage_path TEXT,
  ADD COLUMN IF NOT EXISTS logo_alt_text TEXT,
  ADD COLUMN IF NOT EXISTS logo_updated_at TIMESTAMPTZ DEFAULT NOW();

-- 2. Add Composite Performance Indexes for High-Traffic Filtering
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

-- 3. Storage Bucket for Provider & Scholarship Logos
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'scholarship-logos', 
  'scholarship-logos', 
  true, 
  5242880, -- 5 MB limit
  ARRAY['image/png', 'image/jpeg', 'image/webp', 'image/svg+xml']
)
ON CONFLICT (id) DO UPDATE SET 
  public = true,
  file_size_limit = 5242880,
  allowed_mime_types = ARRAY['image/png', 'image/jpeg', 'image/webp', 'image/svg+xml'];

-- 4. Storage Security Policies
-- Public read access: Anyone can view scholarship provider logos
CREATE POLICY "Public Access: View scholarship logos" 
  ON storage.objects FOR SELECT 
  USING (bucket_id = 'scholarship-logos');

-- Admin write access: Authenticated admins can upload logos
CREATE POLICY "Admin Access: Upload scholarship logos" 
  ON storage.objects FOR INSERT 
  TO authenticated 
  WITH CHECK (bucket_id = 'scholarship-logos');

-- Admin update access: Authenticated admins can update/replace logos
CREATE POLICY "Admin Access: Update scholarship logos" 
  ON storage.objects FOR UPDATE 
  TO authenticated 
  USING (bucket_id = 'scholarship-logos');

-- Admin delete access: Authenticated admins can delete logos
CREATE POLICY "Admin Access: Delete scholarship logos" 
  ON storage.objects FOR DELETE 
  TO authenticated 
  USING (bucket_id = 'scholarship-logos');
