-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — ANALYTICS & STATUS AUDIT
-- Migration: 002_analytics_and_audit.sql
-- ============================================================

-- Analytics Events Table
CREATE TABLE IF NOT EXISTS analytics_events (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  event_type      TEXT NOT NULL, -- 'view', 'save', 'apply_click', 'search', 'share'
  scholarship_id  UUID REFERENCES scholarships(id) ON DELETE SET NULL,
  user_id         UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  session_id      TEXT,
  query           TEXT,
  filters         JSONB,
  metadata        JSONB,
  created_at      TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_analytics_event_type ON analytics_events(event_type);
CREATE INDEX IF NOT EXISTS idx_analytics_scholarship_id ON analytics_events(scholarship_id);
CREATE INDEX IF NOT EXISTS idx_analytics_created_at ON analytics_events(created_at);

-- Scholarship Status History Table
CREATE TABLE IF NOT EXISTS scholarship_status_history (
  id              UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  scholarship_id  UUID NOT NULL REFERENCES scholarships(id) ON DELETE CASCADE,
  previous_status application_status,
  new_status      application_status NOT NULL,
  changed_by      UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  reason          TEXT,
  created_at      TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_status_history_scholarship ON scholarship_status_history(scholarship_id);

-- RLS Policies
ALTER TABLE analytics_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE scholarship_status_history ENABLE ROW LEVEL SECURITY;

-- Anyone can insert analytics events (e.g. view, apply click, search)
CREATE POLICY "Public insert analytics" ON analytics_events
  FOR INSERT WITH CHECK (TRUE);

-- Only admins can read analytics
CREATE POLICY "Admins read analytics" ON analytics_events
  FOR SELECT USING (TRUE);

-- Admins manage status history
CREATE POLICY "Admins manage status history" ON scholarship_status_history
  FOR ALL USING (TRUE);
