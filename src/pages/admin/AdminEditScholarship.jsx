/**
 * @file AdminEditScholarship.jsx
 * @description Administrative record editor for existing scholarship listings.
 *
 * Responsibilities:
 * - Loads canonical scholarship record by id, source_id, or slug
 * - Provides full CRUD field updates with URL sanitization
 * - Integrates with LogoUploadField for Supabase Storage logo management
 * - Dispatches 'scholarship-updated' CustomEvent upon successful commit
 */

import React, { useState, useEffect } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { getScholarshipById, updateScholarship } from '../../services/scholarships';
import { Button } from '../../components/common/Button';
import { ArrowLeft, CheckCircle2, AlertCircle, Save, ExternalLink } from 'lucide-react';
import { LogoUploadField } from '../../components/admin/LogoUploadField';

export default function AdminEditScholarship() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [scholarship, setScholarship] = useState(null);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(false);

  const [form, setForm] = useState({
    title: '',
    provider: '',
    institution: '',
    institution_category: 'public_university',
    scope: 'local',
    funding_type: 'fully_funded',
    target_countries: 'Ghana',
    host_country: 'Ghana',
    study_levels: 'undergraduate',
    fields_of_study: 'All Fields',
    gender_eligibility: 'all',
    application_deadline: '',
    official_url: '',
    information_url: '',
    deadline_text: '',
    description: '',
    eligibility_criteria: '',
    benefits: '',
    application_process: '',
    required_documents: '',
    status: 'open',
    is_featured: false,
    is_verified: true,
    logo_url: null,
    logo_storage_path: null,
    logo_alt_text: null,
  });

  useEffect(() => {
    async function fetchItem() {
      setLoading(true);
      try {
        const found = await getScholarshipById(id);
        if (found) {
          setScholarship(found);
          setForm({
            title: found.title || found.name || '',
            provider: typeof found.provider === 'object' ? found.provider?.name : (found.provider || ''),
            institution: typeof found.institution === 'object' ? found.institution?.name : (found.institution || ''),
            institution_category: found.institution_category || 'public_university',
            scope: found.geographic_scope || found.scope || 'local',
            funding_type: found.funding_type || 'fully_funded',
            target_countries: Array.isArray(found.target_countries) ? found.target_countries.join(', ') : (found.target_countries || 'Ghana'),
            host_country: found.host_country || 'Ghana',
            study_levels: Array.isArray(found.study_levels) ? found.study_levels.join(', ') : (found.study_levels || 'undergraduate'),
            fields_of_study: Array.isArray(found.fields_of_study) ? found.fields_of_study.join(', ') : (found.fields_of_study || 'All Fields'),
            gender_eligibility: found.gender_eligibility || 'all',
            application_deadline: found.application_deadline || found.deadline || '',
            official_url: found.official_url || found.application_url || '',
            information_url: found.information_url || '',
            deadline_text: found.deadline_text || '',
            description: found.description || found.short_description || found.full_description || '',
            eligibility_criteria: Array.isArray(found.eligibility_criteria)
              ? found.eligibility_criteria.join('\n')
              : Array.isArray(found.eligibility_requirements)
              ? found.eligibility_requirements.join('\n')
              : (found.eligibility_criteria || found.eligibility_requirements || ''),
            benefits: Array.isArray(found.benefits) ? found.benefits.join('\n') : (found.benefits || ''),
            application_process: Array.isArray(found.application_process) ? found.application_process.join('\n') : (found.application_process || ''),
            required_documents: Array.isArray(found.required_documents) ? found.required_documents.join('\n') : (found.required_documents || ''),
            status: found.application_status || found.status || 'open',
            is_featured: !!found.is_featured,
            is_verified: !!found.is_verified,
            logo_url: found.logo_url || null,
            logo_storage_path: found.logo_storage_path || null,
            logo_alt_text: found.logo_alt_text || null,
          });
        } else {
          setError('Scholarship record not found.');
        }
      } catch (err) {
        console.error('Error fetching scholarship for edit:', err);
        setError('Failed to load scholarship.');
      } finally {
        setLoading(false);
      }
    }
    fetchItem();
  }, [id]);

  function handleChange(e) {
    const { name, value, type, checked } = e.target;
    setForm((prev) => ({
      ...prev,
      [name]: type === 'checkbox' ? checked : value,
    }));
  }

  function handleLogoChange(logoData) {
    setForm((prev) => ({
      ...prev,
      ...logoData,
    }));
  }

  function sanitizeUrl(val) {
    if (!val) return '';
    const trimmed = String(val).trim();
    if (!trimmed) return '';
    if (/^https?:\/\//i.test(trimmed)) return trimmed;
    return `https://${trimmed}`;
  }

  async function handleSubmit(e) {
    e.preventDefault();
    if (!form.title || !form.title.trim()) {
      setError('Scholarship Title is required.');
      return;
    }
    if (!form.provider || !form.provider.trim()) {
      setError('Scholarship Provider / Organization is required.');
      return;
    }
    if (!form.official_url || !form.official_url.trim()) {
      setError('Official Application URL is required.');
      return;
    }

    setSaving(true);
    setError(null);
    setSuccess(false);

    try {
      const sanitizedOfficialUrl = sanitizeUrl(form.official_url);
      const sanitizedInfoUrl = sanitizeUrl(form.information_url);

      const updates = {
        title: form.title.trim(),
        name: form.title.trim(),
        provider: form.provider.trim(),
        institution: form.institution.trim() || null,
        institution_category: form.institution_category,
        geographic_scope: form.scope,
        scope: form.scope,
        funding_type: form.funding_type,
        target_countries: form.target_countries ? form.target_countries.split(',').map((s) => s.trim()) : ['Ghana'],
        host_country: form.host_country.trim() || 'Ghana',
        study_levels: form.study_levels ? form.study_levels.split(',').map((s) => s.trim()) : ['undergraduate'],
        fields_of_study: form.fields_of_study ? form.fields_of_study.split(',').map((s) => s.trim()) : ['All Fields'],
        gender_eligibility: form.gender_eligibility,
        application_deadline: form.application_deadline ? form.application_deadline.trim() : null,
        deadline: form.application_deadline ? form.application_deadline.trim() : null,
        deadline_text: form.deadline_text?.trim() || null,
        official_url: sanitizedOfficialUrl,
        application_url: sanitizedOfficialUrl,
        information_url: sanitizedInfoUrl || null,
        description: form.description.trim(),
        full_description: form.description.trim(),
        short_description: form.description.trim() ? form.description.trim().substring(0, 160) : null,
        eligibility_criteria: form.eligibility_criteria ? form.eligibility_criteria.split('\n').map((s) => s.trim()).filter(Boolean) : null,
        eligibility_requirements: form.eligibility_criteria ? form.eligibility_criteria.trim() : '',
        benefits: form.benefits ? form.benefits.split('\n').map((s) => s.trim()).filter(Boolean) : null,
        application_process: form.application_process ? form.application_process.split('\n').map((s) => s.trim()).filter(Boolean) : null,
        required_documents: form.required_documents ? form.required_documents.split('\n').map((s) => s.trim()).filter(Boolean) : null,
        application_status: form.status,
        status: form.status,
        is_featured: form.is_featured,
        is_verified: form.is_verified,
        verification_status: form.is_verified ? 'verified' : 'needs_verification',
        logo_url: form.logo_url,
        logo_storage_path: form.logo_storage_path,
        logo_alt_text: form.logo_alt_text || `${form.provider.trim()} official logo`,
        logo_updated_at: new Date().toISOString(),
      };

      const targetId = scholarship?.id || scholarship?.source_id || scholarship?.slug || id;
      const result = await updateScholarship(targetId, updates);

      if (result && result.success) {
        setSuccess(true);
        // Automatically redirect to All Scholarships page with confirmation state
        setTimeout(() => {
          navigate('/admin/scholarships', {
            state: {
              updatedTitle: updates.title,
              updatedId: targetId,
            },
            replace: true,
          });
        }, 500);
      } else {
        throw new Error(result?.error || 'Failed to save changes to scholarship.');
      }
    } catch (err) {
      console.error('Error updating scholarship:', err);
      setError(err.message || 'Failed to update scholarship record.');
    } finally {
      setSaving(false);
    }
  }

  if (loading) {
    return (
      <div className="max-w-4xl mx-auto space-y-6">
        <div className="h-6 w-36 bg-slate-200 animate-pulse rounded"></div>
        <div className="h-96 bg-white rounded-xl border border-slate-200 p-8 animate-pulse"></div>
      </div>
    );
  }

  const publicSlug = scholarship?.slug || id;

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-3">
          <Link
            to="/admin/scholarships"
            className="p-2 text-slate-500 hover:text-navy-deep hover:bg-slate-100 rounded-lg transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </Link>
          <div>
            <h1 className="text-2xl font-bold font-heading text-navy-deep">Edit Scholarship</h1>
            <p className="text-sm text-slate-500">
              Update opportunity details, replace provider logo, modify deadlines, or manage visibility.
            </p>
          </div>
        </div>

        {publicSlug && (
          <Link
            to={`/scholarship/${publicSlug}`}
            target="_blank"
            className="text-xs font-semibold text-royal hover:underline inline-flex items-center gap-1 bg-royal/10 px-3 py-1.5 rounded-lg"
          >
            <span>View Public Page</span>
            <ExternalLink className="w-3.5 h-3.5" />
          </Link>
        )}
      </div>

      {error && (
        <div className="p-4 bg-rose-50 border border-rose-200 rounded-xl flex items-center gap-3 text-rose-800 text-sm">
          <AlertCircle className="w-5 h-5 text-rose-500 flex-shrink-0" />
          <span>{error}</span>
        </div>
      )}

      {success && (
        <div className="p-5 bg-emerald-50 border border-emerald-200 rounded-xl space-y-3 text-emerald-900 shadow-xs">
          <div className="flex items-center gap-3">
            <CheckCircle2 className="w-6 h-6 text-emerald-600 flex-shrink-0" />
            <div>
              <p className="font-bold text-sm text-emerald-900">Scholarship updated successfully!</p>
              <p className="text-xs text-emerald-700 mt-0.5">
                All changes have been saved to the database and are now live on the public website.
              </p>
            </div>
          </div>
          <div className="flex items-center gap-3 pt-2 border-t border-emerald-200/80">
            <Link
              to={`/scholarship/${publicSlug}`}
              target="_blank"
              className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-emerald-600 text-white rounded-lg text-xs font-bold hover:bg-emerald-700 transition-colors"
            >
              <ExternalLink className="w-3.5 h-3.5" />
              <span>Verify on Public Card &amp; Detail Page</span>
            </Link>
            <Link
              to="/admin/scholarships"
              className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-white border border-emerald-300 text-emerald-800 rounded-lg text-xs font-semibold hover:bg-emerald-100/50 transition-colors"
            >
              <span>Back to Scholarships List</span>
            </Link>
          </div>
        </div>
      )}

      <form onSubmit={handleSubmit} className="bg-white rounded-xl border border-slate-200 p-6 md:p-8 space-y-8 shadow-sm">
        {/* Basic Info */}
        <div className="space-y-4">
          <h2 className="text-sm font-bold uppercase tracking-wider text-royal border-b pb-2">
            1. Identity &amp; Host Institution
          </h2>
          <div>
            <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
              Scholarship Title *
            </label>
            <input
              type="text"
              name="title"
              value={form.title}
              onChange={handleChange}
              required
              className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
            />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Provider / Sponsor *
              </label>
              <input
                type="text"
                name="provider"
                value={form.provider}
                onChange={handleChange}
                required
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
              />
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Host Institution
              </label>
              <input
                type="text"
                name="institution"
                value={form.institution}
                onChange={handleChange}
                placeholder="e.g. University of Oxford, KNUST"
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
              />
            </div>
          </div>
        </div>

        {/* Logo Upload Section */}
        <LogoUploadField
          logoUrl={form.logo_url}
          storagePath={form.logo_storage_path}
          onChange={handleLogoChange}
          providerName={form.provider || 'Provider'}
        />

        {/* Classification */}
        <div className="space-y-4">
          <h2 className="text-sm font-bold uppercase tracking-wider text-royal border-b pb-2">
            3. Category & Scope
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Geographic Scope
              </label>
              <select
                name="scope"
                value={form.scope}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal bg-white"
              >
                <option value="local">Local (Ghana Only)</option>
                <option value="international">International (Abroad)</option>
                <option value="both">Both Local & International</option>
              </select>
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Funding Type
              </label>
              <select
                name="funding_type"
                value={form.funding_type}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal bg-white"
              >
                <option value="fully_funded">Fully Funded</option>
                <option value="partially_funded">Partially Funded</option>
                <option value="tuition_only">Tuition Only</option>
                <option value="bursary">Bursary</option>
                <option value="grant">Grant</option>
                <option value="loan">Student Loan</option>
                <option value="other">Other</option>
              </select>
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Application Status
              </label>
              <select
                name="status"
                value={form.status}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal bg-white"
              >
                <option value="open">Open</option>
                <option value="closed">Closed</option>
                <option value="upcoming">Upcoming</option>
                <option value="rolling">Rolling</option>
                <option value="unannounced">Deadline Not Announced</option>
                <option value="archived">Archived</option>
              </select>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Application Deadline (YYYY-MM-DD or descriptive text)
              </label>
              <input
                type="text"
                name="application_deadline"
                value={form.application_deadline}
                onChange={handleChange}
                placeholder="YYYY-MM-DD or e.g. Annual; 2027/28 cycle closed"
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
              />
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Gender Eligibility
              </label>
              <select
                name="gender_eligibility"
                value={form.gender_eligibility}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal bg-white"
              >
                <option value="all">Open to All Genders</option>
                <option value="women">Women Only</option>
                <option value="men">Men Only</option>
                <option value="women_priority">Women Encouraged / Priority</option>
              </select>
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Study Levels (comma separated)
              </label>
              <input
                type="text"
                name="study_levels"
                value={form.study_levels}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
              />
            </div>
          </div>
        </div>

        {/* URLs & Details */}
        <div className="space-y-4">
          <h2 className="text-sm font-bold uppercase tracking-wider text-royal border-b pb-2">
            4. Details & Official Link
          </h2>
          <div>
            <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
              Official Application URL *
            </label>
            <input
              type="text"
              name="official_url"
              value={form.official_url}
              onChange={handleChange}
              placeholder="https://..."
              required
              className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal font-mono"
            />
          </div>

          <div>
            <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
              Information / More Info URL
            </label>
            <input
              type="text"
              name="information_url"
              value={form.information_url}
              onChange={handleChange}
              placeholder="https://..."
              className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal font-mono"
            />
          </div>

          <div>
            <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
              Deadline Note (descriptive text)
            </label>
            <input
              type="text"
              name="deadline_text"
              value={form.deadline_text}
              onChange={handleChange}
              placeholder="e.g. Annual; 2027/28 cycle closed"
              className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
            />
          </div>

          <div>
            <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
              Overview Description
            </label>
            <textarea
              name="description"
              rows={3}
              value={form.description}
              onChange={handleChange}
              className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
            />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Eligibility Criteria (one per line)
              </label>
              <textarea
                name="eligibility_criteria"
                rows={4}
                value={form.eligibility_criteria}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
              />
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Benefits & Coverage (one per line)
              </label>
              <textarea
                name="benefits"
                rows={4}
                value={form.benefits}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
              />
            </div>
          </div>
        </div>

        {/* Checkboxes */}
        <div className="flex flex-wrap gap-6 pt-2 border-t">
          <label className="flex items-center gap-2 cursor-pointer">
            <input
              type="checkbox"
              name="is_verified"
              checked={form.is_verified}
              onChange={handleChange}
              className="w-4 h-4 text-royal rounded border-slate-300 focus:ring-royal"
            />
            <span className="text-sm font-medium text-slate-700">Verified by Admin</span>
          </label>
          <label className="flex items-center gap-2 cursor-pointer">
            <input
              type="checkbox"
              name="is_featured"
              checked={form.is_featured}
              onChange={handleChange}
              className="w-4 h-4 text-gold rounded border-slate-300 focus:ring-gold"
            />
            <span className="text-sm font-medium text-slate-700">Feature on Homepage</span>
          </label>
        </div>

        {/* Actions */}
        <div className="flex justify-end gap-3 pt-4 border-t">
          <Link
            to="/admin/scholarships"
            className="px-5 py-2.5 rounded-lg border border-slate-200 text-sm font-medium text-slate-600 hover:bg-slate-50 transition-colors"
          >
            Cancel
          </Link>
          <Button
            type="submit"
            variant="primary"
            loading={saving}
            disabled={saving}
            className="flex items-center gap-2"
          >
            <Save className="w-4 h-4" />
            <span>{saving ? 'Saving changes...' : success ? 'Saved!' : 'Save Changes'}</span>
          </Button>
        </div>
      </form>
    </div>
  );
}

export { AdminEditScholarship };
