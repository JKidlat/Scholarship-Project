-- ============================================================
-- GHANA SCHOLARSHIP PORTAL — ADD FOREIGN_UNIVERSITY ENUM VALUE
-- Migration: 0041_add_foreign_university_enum.sql
-- Purpose: Add 'foreign_university' to institution_category enum
--          in its own transaction so it commits before migration 005 uses it.
-- ============================================================

ALTER TYPE institution_category ADD VALUE IF NOT EXISTS 'foreign_university';
