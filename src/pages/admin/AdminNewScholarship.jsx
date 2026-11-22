import React, { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import { createScholarship } from '../../services/scholarships';
import { Button } from '../../components/common/Button';
import { generateSlug } from '../../utils/formatters';
import { ArrowLeft, CheckCircle2, AlertCircle, PlusCircle } from 'lucide-react';
import { LogoUploadField } from '../../components/admin/LogoUploadField';

export default function AdminNewScholarship() {
  const navigate = useNavigate();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

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

  async function handleSubmit(e) {
    e.preventDefault();
    if (!form.title || !form.provider || !form.official_url) {
      setError('Title, Provider, and Official Application URL are required.');
      return;
    }

    setLoading(true);
    setError(null);

    try {
      const slug = generateSlug(form.title) + '-' + Math.random().toString(36).substring(2, 6);

      const payload = {
        title: form.title.trim(),
        name: form.title.trim(),
        slug,
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
        application_deadline: form.application_deadline ? form.application_deadline : null,
        deadline: form.application_deadline ? form.application_deadline : null,
        official_url: form.official_url.trim(),
        description: form.description.trim() || null,
        short_description: form.description.trim() ? form.description.trim().substring(0, 160) : null,
        eligibility_criteria: form.eligibility_criteria ? form.eligibility_criteria.split('\n').filter(Boolean) : null,
        benefits: form.benefits ? form.benefits.split('\n').filter(Boolean) : null,
        application_process: form.application_process ? form.application_process.split('\n').filter(Boolean) : null,
        required_documents: form.required_documents ? form.required_documents.split('\n').filter(Boolean) : null,
        application_status: form.status,
        status: form.status,
        is_featured: form.is_featured,
        is_verified: form.is_verified,
        verification_status: form.is_verified ? 'verified' : 'needs_verification',
        is_published: true,
        logo_url: form.logo_url,
        logo_storage_path: form.logo_storage_path,
        logo_alt_text: form.logo_alt_text || `${form.provider} official logo`,
        logo_updated_at: new Date().toISOString(),
      };

      await createScholarship(payload);
      navigate('/admin/scholarships');
    } catch (err) {
      setError(err.message || 'Failed to create scholarship listing.');
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="flex items-center gap-3">
        <Link
          to="/admin/scholarships"
          className="p-2 rounded-lg border border-slate-200 text-slate-600 hover:bg-slate-100 transition-colors"
        >
          <ArrowLeft className="w-4 h-4" />
        </Link>
        <div>
          <h1 className="font-heading text-2xl font-extrabold text-navy-deep">
            Add New Scholarship
          </h1>
          <p className="text-xs text-slate-500">
            Publish a verified scholarship opportunity directly into the portal directory.
          </p>
        </div>
      </div>

      {error && (
        <div className="p-4 rounded-xl bg-red-50 border border-red-200 text-red-700 text-sm flex items-start gap-2.5">
          <AlertCircle className="w-5 h-5 shrink-0 mt-0.5" />
          <span>{error}</span>
        </div>
      )}

      <form onSubmit={handleSubmit} className="bg-white rounded-2xl border border-slate-200 p-6 sm:p-8 shadow-card space-y-8">
        {/* SECTION 1: Identity & Provider Info */}
        <div className="space-y-4">
          <h2 className="text-sm font-bold uppercase tracking-wider text-royal border-b border-slate-100 pb-2">
            1. Opportunity Identity & Host Institution
          </h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div className="sm:col-span-2">
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Scholarship Title *
              </label>
              <input
                type="text"
                name="title"
                required
                value={form.title}
                onChange={handleChange}
                placeholder="e.g. Ghana Scholarship Secretariat Local Tertiary Award"
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              />
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Provider / Funding Body *
              </label>
              <input
                type="text"
                name="provider"
                required
                value={form.provider}
                onChange={handleChange}
                placeholder="e.g. Ghana Scholarship Secretariat"
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              />
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Host / Partner Institution
              </label>
              <input
                type="text"
                name="institution"
                value={form.institution}
                onChange={handleChange}
                placeholder="e.g. University of Ghana (or leave blank if universal)"
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              />
            </div>
          </div>
        </div>

        {/* SECTION 2: Logo / Provider Image Upload */}
        <LogoUploadField
          logoUrl={form.logo_url}
          storagePath={form.logo_storage_path}
          onChange={handleLogoChange}
          providerName={form.provider || 'Provider'}
        />

        {/* SECTION 3: Classification & Dates */}
        <div className="space-y-4">
          <h2 className="text-sm font-bold uppercase tracking-wider text-royal border-b border-slate-100 pb-2">
            3. Classification, Scope & Dates
          </h2>
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Geographic Scope
              </label>
              <select
                name="scope"
                value={form.scope}
                onChange={handleChange}
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              >
                <option value="local">Local (Ghana Only)</option>
                <option value="international">International (Study Abroad)</option>
                <option value="both">Both Local & International</option>
              </select>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Funding Coverage
              </label>
              <select
                name="funding_type"
                value={form.funding_type}
                onChange={handleChange}
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              >
                <option value="fully_funded">Fully Funded</option>
                <option value="partially_funded">Partially Funded</option>
                <option value="tuition_only">Tuition Only</option>
                <option value="bursary">Bursary</option>
                <option value="grant">Grant</option>
                <option value="fellowship">Fellowship</option>
                <option value="loan">Student Loan</option>
                <option value="other">Other Support</option>
              </select>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Initial Status
              </label>
              <select
                name="status"
                value={form.status}
                onChange={handleChange}
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              >
                <option value="open">Open for Applications</option>
                <option value="upcoming">Opening Soon</option>
                <option value="rolling">Rolling Applications</option>
                <option value="closed">Closed</option>
                <option value="unannounced">Deadline Not Announced</option>
              </select>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Application Deadline
              </label>
              <input
                type="date"
                name="application_deadline"
                value={form.application_deadline}
                onChange={handleChange}
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
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
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              >
                <option value="all">Open to All Genders</option>
                <option value="women">Women Only</option>
                <option value="men">Men Only</option>
                <option value="women_priority">Women Encouraged / Priority</option>
              </select>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Target Study Levels
              </label>
              <input
                type="text"
                name="study_levels"
                value={form.study_levels}
                onChange={handleChange}
                placeholder="undergraduate, masters, phd"
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              />
            </div>
          </div>
        </div>

        {/* SECTION 4: Application URL & Description */}
        <div className="space-y-4">
          <h2 className="text-sm font-bold uppercase tracking-wider text-royal border-b border-slate-100 pb-2">
            4. Official Portal & Criteria Details
          </h2>
          <div>
            <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
              Official Application URL *
            </label>
            <input
              type="url"
              name="official_url"
              required
              value={form.official_url}
              onChange={handleChange}
              placeholder="https://scholarships.gov.gh/apply"
              className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal font-mono"
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
              placeholder="Provide a concise summary of the scholarship opportunity..."
              className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
            />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Eligibility Criteria (one per line)
              </label>
              <textarea
                name="eligibility_criteria"
                rows={4}
                value={form.eligibility_criteria}
                onChange={handleChange}
                placeholder="Must be a Ghanaian citizen&#10;Minimum WASSCE aggregate 12&#10;Admitted into an accredited public university"
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
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
                placeholder="Full academic tuition coverage&#10;Monthly accommodation stipend&#10;Laptop allowance"
                className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-royal/30 focus:border-royal"
              />
            </div>
          </div>
        </div>

        {/* SECTION 5: Controls */}
        <div className="flex flex-wrap items-center justify-between gap-4 pt-4 border-t border-slate-100">
          <div className="flex items-center gap-6">
            <label className="flex items-center gap-2 cursor-pointer">
              <input
                type="checkbox"
                name="is_featured"
                checked={form.is_featured}
                onChange={handleChange}
                className="w-4 h-4 text-royal rounded border-slate-300 focus:ring-royal"
              />
              <span className="text-xs font-semibold text-slate-700">Feature on Homepage</span>
            </label>

            <label className="flex items-center gap-2 cursor-pointer">
              <input
                type="checkbox"
                name="is_verified"
                checked={form.is_verified}
                onChange={handleChange}
                className="w-4 h-4 text-royal rounded border-slate-300 focus:ring-royal"
              />
              <span className="text-xs font-semibold text-slate-700">Verified by Admin</span>
            </label>
          </div>

          <div className="flex items-center gap-3">
            <Link
              to="/admin/scholarships"
              className="px-4 py-2.5 border border-slate-300 text-slate-700 text-xs font-semibold rounded-xl hover:bg-slate-50"
            >
              Cancel
            </Link>
            <Button type="submit" variant="primary" disabled={loading} className="text-xs flex items-center gap-1.5">
              <PlusCircle className="w-4 h-4" />
              <span>{loading ? 'Publishing...' : 'Publish Scholarship'}</span>
            </Button>
          </div>
        </div>
      </form>
    </div>
  );
}

export { AdminNewScholarship };
