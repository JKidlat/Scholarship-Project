/**
 * @file FilterSidebar.jsx
 * @description Faceted scholarship filtering sidebar for desktop and mobile viewports.
 *
 * Provides granular filtering by:
 * - Scope: All, Local (Ghana), International
 * - Study Level: Undergraduate, Masters, PhD, SHS, etc.
 * - Funding Type: Fully Funded, Partial, Tuition Only, Bursaries
 * - Gender Eligibility: Open to All, Female-specific, Male-specific
 * - Application Status: Open, Opening Soon, Rolling
 * - Institution Category & Destination Country
 */

import React, { useState } from 'react';
import { X, RotateCcw, ChevronDown, ChevronUp } from 'lucide-react';

const STUDY_LEVELS = [
  { id: 'undergraduate', label: 'Undergraduate' },
  { id: 'postgraduate', label: 'Postgraduate (General)' },
  { id: 'masters', label: "Master's Degree" },
  { id: 'phd', label: 'PhD / Doctorate' },
  { id: 'shs', label: 'Senior High School (SHS)' },
  { id: 'diploma', label: 'Diploma' },
  { id: 'vocational', label: 'Vocational & Technical' },
  { id: 'postdoctoral', label: 'Postdoctoral' },
  { id: 'other', label: 'Other Programmes' },
];

const FUNDING_TYPES = [
  { id: 'fully_funded', label: 'Fully Funded' },
  { id: 'partially_funded', label: 'Partially Funded' },
  { id: 'tuition_only', label: 'Tuition Only' },
  { id: 'bursary', label: 'Bursary' },
  { id: 'grant', label: 'Grant' },
  { id: 'fellowship', label: 'Fellowship' },
  { id: 'research', label: 'Research Funding' },
  { id: 'loan', label: 'Student Loan (Not a Grant)' },
  { id: 'other', label: 'Other Support' },
];

const STATUS_OPTIONS = [
  { id: 'open', label: 'Open' },
  { id: 'upcoming', label: 'Opening Soon' },
  { id: 'rolling', label: 'Rolling Applications' },
  { id: 'unannounced', label: 'Deadline Not Announced' },
  { id: 'closed', label: 'Closed' },
  { id: 'archived', label: 'Archived' },
];

const FIELDS_OF_STUDY = [
  'All Fields',
  'Engineering',
  'Medicine and Health Sciences',
  'Computer Science and IT',
  'Business and Management',
  'Agriculture',
  'Education',
  'Law',
  'Social Sciences',
  'Arts and Humanities',
  'Science (General)',
  'Architecture',
  'Environmental Studies',
];

const DESTINATIONS = [
  'All Destinations',
  'Ghana',
  'United Kingdom',
  'United States',
  'Canada',
  'Germany',
  'Japan',
  'China',
  'Australia',
  'France',
  'Netherlands',
];

export function FilterSidebar({
  filters,
  onChange,
  onClear,
  isMobileOpen,
  onCloseMobile,
  totalResults,
}) {
  const [openSections, setOpenSections] = useState({
    scope: true,
    levels: true,
    funding: true,
    status: true,
    gender: true,
    instCat: true,
    field: true,
    destination: true,
  });

  const toggleSection = (key) => {
    setOpenSections((prev) => ({ ...prev, [key]: !prev[key] }));
  };

  const handleLevelToggle = (lvl) => {
    const updated = filters.levels.includes(lvl)
      ? filters.levels.filter((l) => l !== lvl)
      : [...filters.levels, lvl];
    onChange({ ...filters, levels: updated });
  };

  const handleFundingToggle = (f) => {
    const updated = filters.fundingTypes.includes(f)
      ? filters.fundingTypes.filter((x) => x !== f)
      : [...filters.fundingTypes, f];
    onChange({ ...filters, fundingTypes: updated });
  };

  const handleStatusToggle = (s) => {
    const updated = filters.status.includes(s)
      ? filters.status.filter((x) => x !== s)
      : [...filters.status, s];
    onChange({ ...filters, status: updated });
  };

  const content = (
    <div className="space-y-6">
      {/* Header bar */}
      <div className="flex items-center justify-between pb-4 border-b border-[#E4E7EC]">
        <div>
          <h3 className="font-heading font-bold text-base text-[#101828]">Filters</h3>
          <p className="text-xs text-[#667085] mt-0.5">
            {totalResults} {totalResults === 1 ? 'scholarship' : 'scholarships'} found
          </p>
        </div>
        <button
          onClick={onClear}
          className="flex items-center gap-1.5 text-xs font-semibold text-[#173A8A] hover:text-[#050D2B] transition-colors"
        >
          <RotateCcw className="w-3.5 h-3.5" />
          Clear All
        </button>
      </div>

      {/* 1. Geographical Scope */}
      <div className="border-b border-[#E4E7EC] pb-5">
        <button
          onClick={() => toggleSection('scope')}
          className="w-full flex items-center justify-between text-left font-heading font-bold text-sm text-[#101828] mb-3"
        >
          <span>Geographical Scope</span>
          {openSections.scope ? (
            <ChevronUp className="w-4 h-4 text-[#667085]" />
          ) : (
            <ChevronDown className="w-4 h-4 text-[#667085]" />
          )}
        </button>
        {openSections.scope && (
          <div className="space-y-2 text-sm text-[#101828]">
            {[
              { id: 'all', label: 'All Opportunities' },
              { id: 'local', label: 'Local (Within Ghana)' },
              { id: 'international', label: 'International (Study Abroad)' },
              { id: 'both', label: 'Local & International Eligible' },
            ].map((opt) => (
              <label key={opt.id} className="flex items-center gap-2 cursor-pointer text-xs">
                <input
                  type="radio"
                  name="scope"
                  checked={filters.scope === opt.id}
                  onChange={() => onChange({ ...filters, scope: opt.id })}
                  className="text-[#173A8A] focus:ring-[#FFC928]"
                />
                <span>{opt.label}</span>
              </label>
            ))}
          </div>
        )}
      </div>

      {/* 2. Study Level (Multiple selection) */}
      <div className="border-b border-[#E4E7EC] pb-5">
        <button
          onClick={() => toggleSection('levels')}
          className="w-full flex items-center justify-between text-left font-heading font-bold text-sm text-[#101828] mb-3"
        >
          <span>Study Level</span>
          {openSections.levels ? (
            <ChevronUp className="w-4 h-4 text-[#667085]" />
          ) : (
            <ChevronDown className="w-4 h-4 text-[#667085]" />
          )}
        </button>
        {openSections.levels && (
          <div className="space-y-2 max-h-48 overflow-y-auto pr-1">
            {STUDY_LEVELS.map((lvl) => (
              <label key={lvl.id} className="flex items-center gap-2 cursor-pointer text-xs text-[#101828]">
                <input
                  type="checkbox"
                  checked={filters.levels.includes(lvl.id)}
                  onChange={() => handleLevelToggle(lvl.id)}
                  className="rounded border-[#E4E7EC] text-[#173A8A] focus:ring-[#FFC928]"
                />
                <span>{lvl.label}</span>
              </label>
            ))}
          </div>
        )}
      </div>

      {/* 3. Scholarship Funding Type */}
      <div className="border-b border-[#E4E7EC] pb-5">
        <button
          onClick={() => toggleSection('funding')}
          className="w-full flex items-center justify-between text-left font-heading font-bold text-sm text-[#101828] mb-3"
        >
          <span>Funding Type</span>
          {openSections.funding ? (
            <ChevronUp className="w-4 h-4 text-[#667085]" />
          ) : (
            <ChevronDown className="w-4 h-4 text-[#667085]" />
          )}
        </button>
        {openSections.funding && (
          <div className="space-y-2 max-h-44 overflow-y-auto pr-1">
            {FUNDING_TYPES.map((f) => (
              <label key={f.id} className="flex items-center gap-2 cursor-pointer text-xs text-[#101828]">
                <input
                  type="checkbox"
                  checked={filters.fundingTypes.includes(f.id)}
                  onChange={() => handleFundingToggle(f.id)}
                  className="rounded border-[#E4E7EC] text-[#173A8A] focus:ring-[#FFC928]"
                />
                <span>{f.label}</span>
              </label>
            ))}
          </div>
        )}
      </div>

      {/* 4. Application Status */}
      <div className="border-b border-[#E4E7EC] pb-5">
        <button
          onClick={() => toggleSection('status')}
          className="w-full flex items-center justify-between text-left font-heading font-bold text-sm text-[#101828] mb-3"
        >
          <span>Application Status</span>
          {openSections.status ? (
            <ChevronUp className="w-4 h-4 text-[#667085]" />
          ) : (
            <ChevronDown className="w-4 h-4 text-[#667085]" />
          )}
        </button>
        {openSections.status && (
          <div className="space-y-2">
            {STATUS_OPTIONS.map((st) => (
              <label key={st.id} className="flex items-center gap-2 cursor-pointer text-xs text-[#101828]">
                <input
                  type="checkbox"
                  checked={filters.status.includes(st.id)}
                  onChange={() => handleStatusToggle(st.id)}
                  className="rounded border-[#E4E7EC] text-[#173A8A] focus:ring-[#FFC928]"
                />
                <span>{st.label}</span>
              </label>
            ))}
          </div>
        )}
      </div>

      {/* 5. Gender Eligibility */}
      <div className="border-b border-[#E4E7EC] pb-5">
        <button
          onClick={() => toggleSection('gender')}
          className="w-full flex items-center justify-between text-left font-heading font-bold text-sm text-[#101828] mb-3"
        >
          <span>Gender Eligibility</span>
          {openSections.gender ? (
            <ChevronUp className="w-4 h-4 text-[#667085]" />
          ) : (
            <ChevronDown className="w-4 h-4 text-[#667085]" />
          )}
        </button>
        {openSections.gender && (
          <div className="space-y-2">
            {[
              { id: 'all', label: 'All Genders (Open)' },
              { id: 'women', label: 'Women-Specific Only' },
              { id: 'men', label: 'Men-Specific Only' },
              { id: 'women_priority', label: 'Women Encouraged / Priority' },
            ].map((g) => (
              <label key={g.id} className="flex items-center gap-2 cursor-pointer text-xs text-[#101828]">
                <input
                  type="radio"
                  name="gender"
                  checked={filters.gender === g.id}
                  onChange={() => onChange({ ...filters, gender: g.id })}
                  className="text-[#173A8A] focus:ring-[#FFC928]"
                />
                <span>{g.label}</span>
              </label>
            ))}
          </div>
        )}
      </div>

      {/* 6. Institution Category */}
      <div className="border-b border-[#E4E7EC] pb-5">
        <button
          onClick={() => toggleSection('instCat')}
          className="w-full flex items-center justify-between text-left font-heading font-bold text-sm text-[#101828] mb-3"
        >
          <span>Institution Category</span>
          {openSections.instCat ? (
            <ChevronUp className="w-4 h-4 text-[#667085]" />
          ) : (
            <ChevronDown className="w-4 h-4 text-[#667085]" />
          )}
        </button>
        {openSections.instCat && (
          <div className="space-y-2">
            {[
              { id: 'all', label: 'All Institution Types' },
              { id: 'public_university', label: 'Public University' },
              { id: 'private_university', label: 'Private University' },
              { id: 'public_tertiary', label: 'Public Tertiary Institution' },
              { id: 'private_tertiary', label: 'Private Tertiary' },
            ].map((cat) => (
              <label key={cat.id} className="flex items-center gap-2 cursor-pointer text-xs text-[#101828]">
                <input
                  type="radio"
                  name="instCat"
                  checked={filters.institutionCategory === cat.id}
                  onChange={() => onChange({ ...filters, institutionCategory: cat.id })}
                  className="text-[#173A8A] focus:ring-[#FFC928]"
                />
                <span>{cat.label}</span>
              </label>
            ))}
          </div>
        )}
      </div>

      {/* 7. Field of Study */}
      <div className="border-b border-[#E4E7EC] pb-5">
        <button
          onClick={() => toggleSection('field')}
          className="w-full flex items-center justify-between text-left font-heading font-bold text-sm text-[#101828] mb-3"
        >
          <span>Field of Study</span>
          {openSections.field ? (
            <ChevronUp className="w-4 h-4 text-[#667085]" />
          ) : (
            <ChevronDown className="w-4 h-4 text-[#667085]" />
          )}
        </button>
        {openSections.field && (
          <select
            value={filters.field}
            onChange={(e) => onChange({ ...filters, field: e.target.value })}
            className="w-full px-3 py-2 text-xs border border-[#E4E7EC] rounded-lg bg-white text-[#101828] focus:border-[#173A8A] focus:outline-none"
          >
            {FIELDS_OF_STUDY.map((f) => (
              <option key={f} value={f === 'All Fields' ? '' : f}>
                {f}
              </option>
            ))}
          </select>
        )}
      </div>

      {/* 8. Destination Country */}
      <div>
        <button
          onClick={() => toggleSection('destination')}
          className="w-full flex items-center justify-between text-left font-heading font-bold text-sm text-[#101828] mb-3"
        >
          <span>Study Destination</span>
          {openSections.destination ? (
            <ChevronUp className="w-4 h-4 text-[#667085]" />
          ) : (
            <ChevronDown className="w-4 h-4 text-[#667085]" />
          )}
        </button>
        {openSections.destination && (
          <select
            value={filters.destination}
            onChange={(e) => onChange({ ...filters, destination: e.target.value })}
            className="w-full px-3 py-2 text-xs border border-[#E4E7EC] rounded-lg bg-white text-[#101828] focus:border-[#173A8A] focus:outline-none"
          >
            {DESTINATIONS.map((d) => (
              <option key={d} value={d === 'All Destinations' ? '' : d}>
                {d}
              </option>
            ))}
          </select>
        )}
      </div>
    </div>
  );

  return (
    <>
      <aside className="hidden lg:block w-72 flex-shrink-0 bg-white border border-[#E4E7EC] rounded-2xl p-6 h-fit sticky top-24 shadow-sm">
        {content}
      </aside>

      {isMobileOpen && (
        <div className="fixed inset-0 z-50 lg:hidden flex">
          <div
            className="fixed inset-0 bg-black/50 backdrop-blur-sm"
            onClick={onCloseMobile}
          />
          <div className="relative ml-auto w-full max-w-xs bg-white h-full overflow-y-auto p-6 z-10 shadow-2xl">
            <div className="flex items-center justify-between pb-4 border-b border-[#E4E7EC] mb-4">
              <span className="font-heading font-bold text-lg">Filter Scholarships</span>
              <button
                onClick={onCloseMobile}
                className="p-1.5 rounded-lg text-[#667085] hover:bg-[#F5F7FC]"
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            {content}
            <div className="pt-6 border-t border-[#E4E7EC] mt-6">
              <button
                onClick={onCloseMobile}
                className="w-full py-3 bg-[#173A8A] text-white font-bold text-sm rounded-xl text-center"
              >
                Apply Filters ({totalResults})
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
