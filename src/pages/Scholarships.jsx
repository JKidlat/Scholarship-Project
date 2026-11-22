/**
 * @file Scholarships.jsx
 * @description Primary public scholarship directory and search interface.
 *
 * Core Features:
 * - Search as you type with 300ms debounce across multi-field data
 * - Two-way URL search parameter synchronization (query, level, scope, funding, field, destination)
 * - Faceted FilterSidebar integrating study level, funding type, gender, and destination
 * - Interactive active filter tags allowing one-by-one removal without losing other filters
 * - Instant live sync with 'scholarship-updated' CustomEvent
 */

import React, { useState, useEffect, useCallback, useRef } from 'react';
import { useSearchParams } from 'react-router-dom';
import { Search, SlidersHorizontal, ArrowUpDown, RotateCcw, X, Sparkles } from 'lucide-react';
import { ScholarshipCard, ScholarshipCardSkeleton } from '../components/scholarship/ScholarshipCard';
import { FilterSidebar } from '../components/scholarship/FilterSidebar';
import { EmptyState } from '../components/common/EmptyState';
import { getFilteredScholarships, recordAnalyticsEvent } from '../services/scholarships';

export default function ScholarshipsPage() {
  const [searchParams, setSearchParams] = useSearchParams();

  // Search input state (immediate for typing responsiveness)
  const [searchInput, setSearchInput] = useState(searchParams.get('query') || searchParams.get('q') || '');
  const [debouncedQuery, setDebouncedQuery] = useState(searchInput);

  const [filters, setFilters] = useState({
    scope: 'all',
    levels: [],
    fundingTypes: [],
    gender: 'all',
    status: [],
    institutionCategory: 'all',
    field: '',
    destination: '',
    sort: 'newest',
  });

  const [results, setResults] = useState({
    data: [],
    total: 0,
    page: 1,
    pageSize: 12,
    totalPages: 1,
  });

  const [loading, setLoading] = useState(true);
  const [isMobileFiltersOpen, setIsMobileFiltersOpen] = useState(false);
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 12;

  const activeRequestRef = useRef(0);

  // Parse incoming URL query params and map category & filter aliases seamlessly
  useEffect(() => {
    const q = searchParams.get('query') || searchParams.get('q') || '';
    const cat = searchParams.get('category') || '';
    const lvl = searchParams.get('level') || '';
    const sc = searchParams.get('scope') || searchParams.get('type') || '';
    const cntry = searchParams.get('country') || '';
    const dest = searchParams.get('destination') || '';
    const fld = searchParams.get('field') || '';
    const fund = searchParams.get('funding') || searchParams.get('funding_type') || '';
    const gen = searchParams.get('gender') || '';

    // Map academic levels
    let resolvedLevels = [];
    if (lvl) {
      resolvedLevels = [lvl];
    } else if (cat === 'undergraduate' || cat === 'bachelors') {
      resolvedLevels = ['undergraduate'];
    } else if (cat === 'postgraduate') {
      resolvedLevels = ['postgraduate', 'masters', 'phd'];
    } else if (cat === 'masters') {
      resolvedLevels = ['masters'];
    } else if (cat === 'phd') {
      resolvedLevels = ['phd'];
    }

    // Map geographic scope
    let resolvedScope = 'all';
    if (sc === 'local' || sc === 'international') {
      resolvedScope = sc;
    } else if (cat === 'international') {
      resolvedScope = 'international';
    } else if (cntry === 'ghana' || cat === 'ghana') {
      resolvedScope = 'local';
    }

    // Map gender criteria
    let resolvedGender = 'all';
    if (gen === 'women' || gen === 'female' || cat === 'for-women' || cat === 'women') {
      resolvedGender = 'women';
    }

    // Map institution category
    let resolvedInstCat = 'all';
    if (cat === 'public-institution' || cat === 'public_university') {
      resolvedInstCat = 'public_university';
    } else if (cat === 'institution-specific' || cat === 'institution_specific') {
      resolvedInstCat = 'institution_specific';
    }

    // Map funding type
    let resolvedFunding = [];
    if (fund === 'fully-funded' || fund === 'fully_funded' || cat === 'fully-funded' || cat === 'fully_funded') {
      resolvedFunding = ['fully_funded'];
    } else if (fund === 'partially-funded' || fund === 'partially_funded') {
      resolvedFunding = ['partially_funded'];
    }

    // Map fields of study
    let resolvedField = fld;
    if (!resolvedField && cat && [
      'engineering',
      'medicine',
      'medicine-health-sciences',
      'computer-science-it',
      'business-management',
      'agriculture',
      'education',
      'law',
      'social-sciences',
      'arts-humanities',
      'science',
      'architecture',
      'environmental-studies'
    ].includes(cat)) {
      resolvedField = cat;
    }

    // Map destination
    let resolvedDest = dest;
    if (!resolvedDest && cntry && cntry !== 'ghana') {
      resolvedDest = cntry;
    }

    setSearchInput(q);
    setDebouncedQuery(q);
    setFilters((prev) => ({
      ...prev,
      scope: resolvedScope,
      levels: resolvedLevels,
      gender: resolvedGender,
      institutionCategory: resolvedInstCat,
      fundingTypes: resolvedFunding,
      field: resolvedField,
      destination: resolvedDest,
    }));
    setCurrentPage(1);
  }, [searchParams]);

  // Search as you type with 300ms debounce
  useEffect(() => {
    // When input is cleared, update results immediately without waiting
    if (!searchInput.trim()) {
      setDebouncedQuery('');
      setCurrentPage(1);
      return;
    }

    const handler = setTimeout(() => {
      setDebouncedQuery(searchInput.trim());
      setCurrentPage(1);

      if (searchInput.trim().length >= 3) {
        recordAnalyticsEvent('search', null, { query: searchInput.trim() });
      }
    }, 300);

    return () => clearTimeout(handler);
  }, [searchInput]);

  // Synchronize URL with active state
  const syncUrlParams = useCallback((newFilters, queryVal) => {
    const params = new URLSearchParams();
    if (queryVal && queryVal.trim()) params.set('query', queryVal.trim());
    if (newFilters.scope && newFilters.scope !== 'all') params.set('scope', newFilters.scope);
    if (newFilters.levels && newFilters.levels.length > 0) params.set('level', newFilters.levels[0]);
    if (newFilters.fundingTypes && newFilters.fundingTypes.length > 0) params.set('funding', newFilters.fundingTypes[0]);
    if (newFilters.gender && newFilters.gender !== 'all') params.set('gender', newFilters.gender);
    if (newFilters.field) params.set('field', newFilters.field);
    if (newFilters.destination) params.set('destination', newFilters.destination);
    setSearchParams(params, { replace: true });
  }, [setSearchParams]);

  // Execute optimized, paginated query
  useEffect(() => {
    const requestId = ++activeRequestRef.current;
    setLoading(true);

    async function fetchData() {
      try {
        const response = await getFilteredScholarships({
          page: currentPage,
          pageSize: itemsPerPage,
          query: debouncedQuery,
          scope: filters.scope,
          levels: filters.levels,
          fundingTypes: filters.fundingTypes,
          gender: filters.gender,
          status: filters.status,
          institutionCategory: filters.institutionCategory,
          field: filters.field,
          destination: filters.destination,
          sort: filters.sort,
        });

        // Ignore outdated responses
        if (requestId === activeRequestRef.current) {
          setResults(response);
          setLoading(false);
        }
      } catch (err) {
        if (requestId === activeRequestRef.current) {
          setLoading(false);
        }
      }
    }

    fetchData();
  }, [debouncedQuery, filters, currentPage]);

  // Live listener: immediately sync any scholarship edits without page reload
  useEffect(() => {
    const handleUpdated = (e) => {
      const updatedItem = e.detail?.scholarship;
      if (!updatedItem) return;
      setResults((prev) => ({
        ...prev,
        data: prev.data.map((item) =>
          item.id === updatedItem.id ||
          item.slug === updatedItem.slug ||
          (item.source_id && item.source_id === updatedItem.source_id)
            ? { ...item, ...updatedItem }
            : item
        ),
      }));
    };
    const handleDeleted = (e) => {
      const deletedId = e.detail?.id;
      const keys = e.detail?.keys || [];
      const lowerKeys = new Set([deletedId, ...keys].filter(Boolean).map((k) => String(k).toLowerCase()));
      setResults((prev) => {
        const nextData = prev.data.filter((item) => {
          const idKey = String(item.id || '').toLowerCase();
          const sourceKey = String(item.source_id || '').toLowerCase();
          const slugKey = String(item.slug || '').toLowerCase();
          return !lowerKeys.has(idKey) && !lowerKeys.has(sourceKey) && !lowerKeys.has(slugKey);
        });
        const diff = prev.data.length - nextData.length;
        return {
          ...prev,
          data: nextData,
          total: Math.max(0, prev.total - diff),
        };
      });
    };

    window.addEventListener('scholarship-updated', handleUpdated);
    window.addEventListener('scholarship-deleted', handleDeleted);
    return () => {
      window.removeEventListener('scholarship-updated', handleUpdated);
      window.removeEventListener('scholarship-deleted', handleDeleted);
    };
  }, []);

  const handleFilterChange = useCallback((newFilters) => {
    setFilters(newFilters);
    setCurrentPage(1);
    syncUrlParams(newFilters, searchInput);
  }, [searchInput, syncUrlParams]);

  const handleClearFilters = useCallback(() => {
    setSearchInput('');
    setDebouncedQuery('');
    const cleared = {
      scope: 'all',
      levels: [],
      fundingTypes: [],
      gender: 'all',
      status: [],
      institutionCategory: 'all',
      field: '',
      destination: '',
      sort: 'newest',
    };
    setFilters(cleared);
    setCurrentPage(1);
    setSearchParams({});
  }, [setSearchParams]);

  const removeSingleFilter = (type, val) => {
    const updated = { ...filters };
    if (type === 'query') {
      setSearchInput('');
      setDebouncedQuery('');
    } else if (type === 'scope') {
      updated.scope = 'all';
    } else if (type === 'level') {
      updated.levels = updated.levels.filter((l) => l !== val);
    } else if (type === 'funding') {
      updated.fundingTypes = updated.fundingTypes.filter((f) => f !== val);
    } else if (type === 'gender') {
      updated.gender = 'all';
    } else if (type === 'field') {
      updated.field = '';
    } else if (type === 'destination') {
      updated.destination = '';
    } else if (type === 'institutionCategory') {
      updated.institutionCategory = 'all';
    }
    setFilters(updated);
    setCurrentPage(1);
    syncUrlParams(updated, type === 'query' ? '' : searchInput);
  };

  // Determine active filter badges
  const activeChips = [];
  if (debouncedQuery) {
    activeChips.push({ type: 'query', label: `Search: "${debouncedQuery}"` });
  }
  if (filters.scope !== 'all') {
    activeChips.push({ type: 'scope', label: `Scope: ${filters.scope === 'local' ? 'Local (Ghana)' : 'International'}` });
  }
  filters.levels.forEach((lvl) => {
    activeChips.push({ type: 'level', val: lvl, label: `Level: ${lvl}` });
  });
  filters.fundingTypes.forEach((fnd) => {
    activeChips.push({ type: 'funding', val: fnd, label: `Funding: ${fnd.replace('_', ' ')}` });
  });
  if (filters.gender !== 'all') {
    activeChips.push({ type: 'gender', label: `Eligibility: ${filters.gender}` });
  }
  if (filters.field) {
    activeChips.push({ type: 'field', label: `Field: ${filters.field.replace('-', ' ')}` });
  }
  if (filters.destination) {
    activeChips.push({ type: 'destination', label: `Destination: ${filters.destination}` });
  }
  if (filters.institutionCategory !== 'all') {
    activeChips.push({ type: 'institutionCategory', label: `Category: ${filters.institutionCategory.replace('_', ' ')}` });
  }

  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-20 pb-20">
      {/* Header Banner */}
      <div className="bg-gradient-to-r from-[#050D2B] via-[#0B1740] to-[#173A8A] text-white py-12 mb-8 border-b border-white/10">
        <div className="site-container">
          <p className="text-xs font-bold text-[#FFC928] uppercase tracking-widest mb-2">
            Scholarship Directory
          </p>
          <h1 className="font-heading font-extrabold text-3xl sm:text-4xl text-white mb-3">
            Find Scholarships for Ghanaian Students
          </h1>
          <p className="text-white/80 text-sm sm:text-base max-w-2xl leading-relaxed">
            Discover verified scholarships, bursaries, and educational grants. Search by degree,
            field, host institution, destination, and application deadlines.
          </p>
        </div>
      </div>

      <div className="site-container">
        {/* Search Bar + Mobile Filter Button */}
        <div className="bg-white rounded-2xl border border-[#E4E7EC] p-3 sm:p-4 mb-4 shadow-sm flex flex-col sm:flex-row items-center gap-3">
          <div className="relative flex-1 w-full">
            <Search className="w-5 h-5 text-[#667085] absolute left-3.5 top-1/2 -translate-y-1/2 pointer-events-none" />
            <input
              type="text"
              placeholder="Search by scholarship title, provider, university, country, or course..."
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              className="w-full pl-11 pr-10 py-2.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl text-sm text-[#101828] placeholder-[#667085] focus:outline-none focus:border-[#173A8A] focus:bg-white transition-colors"
            />
            {searchInput && (
              <button
                type="button"
                onClick={() => {
                  setSearchInput('');
                  setDebouncedQuery('');
                  syncUrlParams(filters, '');
                }}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-xs text-slate-400 hover:text-slate-600 bg-slate-200 hover:bg-slate-300 rounded-full w-5 h-5 flex items-center justify-center font-bold"
                title="Clear search"
              >
                ×
              </button>
            )}
          </div>

          <div className="flex items-center gap-2 w-full sm:w-auto">
            {/* Sort Select */}
            <div className="flex items-center gap-1.5 bg-[#F5F7FC] border border-[#E4E7EC] rounded-xl px-3 py-2 flex-1 sm:flex-initial">
              <ArrowUpDown className="w-4 h-4 text-[#667085]" />
              <select
                value={filters.sort}
                onChange={(e) => handleFilterChange({ ...filters, sort: e.target.value })}
                className="bg-transparent text-xs font-semibold text-[#101828] focus:outline-none cursor-pointer"
              >
                <option value="newest">Featured &amp; Open First</option>
                <option value="deadline">Nearest Deadline</option>
              </select>
            </div>

            {/* Mobile Filter Toggle */}
            <button
              type="button"
              onClick={() => setIsMobileFiltersOpen(true)}
              className="lg:hidden flex items-center gap-2 px-4 py-2 bg-[#173A8A] text-white text-xs font-bold rounded-xl shrink-0"
            >
              <SlidersHorizontal className="w-4 h-4" />
              <span>Filters</span>
            </button>
          </div>
        </div>

        {/* Active Filters Row */}
        {activeChips.length > 0 && (
          <div className="mb-6 flex flex-wrap items-center gap-2 p-3 bg-white rounded-xl border border-slate-200 text-xs">
            <span className="font-semibold text-slate-500 uppercase tracking-wider text-[10px] mr-1">
              Active Filters:
            </span>
            {activeChips.map((chip, idx) => (
              <span
                key={idx}
                className="inline-flex items-center gap-1 px-2.5 py-1 rounded-lg bg-royal/10 text-royal font-medium border border-royal/20"
              >
                <span>{chip.label}</span>
                <button
                  type="button"
                  onClick={() => removeSingleFilter(chip.type, chip.val)}
                  className="hover:text-rose-600 p-0.5"
                  title="Remove filter"
                >
                  <X className="w-3 h-3" />
                </button>
              </span>
            ))}
            <button
              type="button"
              onClick={handleClearFilters}
              className="ml-auto text-xs text-rose-600 hover:underline font-semibold flex items-center gap-1"
            >
              <RotateCcw className="w-3 h-3" />
              <span>Clear All</span>
            </button>
          </div>
        )}

        {/* Main Content Layout */}
        <div className="flex gap-8 items-start">
          {/* Filter Sidebar (Desktop Sticky Sidebar & Mobile Drawer) */}
          <FilterSidebar
            filters={{ ...filters, query: searchInput }}
            onChange={handleFilterChange}
            onClear={handleClearFilters}
            isMobileOpen={isMobileFiltersOpen}
            onCloseMobile={() => setIsMobileFiltersOpen(false)}
            totalResults={results.total}
          />

          {/* Scholarship Results */}
          <main className="flex-1 min-w-0">
            {/* Results count header */}
            <div className="flex items-center justify-between mb-4">
              <p className="text-sm text-[#667085]">
                Showing{' '}
                <strong className="text-[#101828]">{results.total}</strong>{' '}
                {results.total === 1 ? 'verified opportunity' : 'verified opportunities'}
              </p>
              {activeChips.length > 0 && (
                <button
                  type="button"
                  onClick={handleClearFilters}
                  className="text-xs text-[#173A8A] hover:underline font-semibold flex items-center gap-1"
                >
                  <RotateCcw className="w-3 h-3" />
                  Reset Filters
                </button>
              )}
            </div>

            {loading ? (
              <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
                {[...Array(6)].map((_, i) => (
                  <ScholarshipCardSkeleton key={i} />
                ))}
              </div>
            ) : results.data.length === 0 ? (
              <div className="bg-white rounded-2xl border border-[#E4E7EC] p-8">
                <EmptyState
                  variant="search"
                  title="No scholarships found"
                  description="We could not find opportunities matching your search or filters. Try clearing some filters or searching by broader keywords."
                  action={{ label: 'Clear All Filters', onClick: handleClearFilters }}
                />
              </div>
            ) : (
              <>
                <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
                  {results.data.map((s) => (
                    <ScholarshipCard key={s.id || s.slug} scholarship={s} />
                  ))}
                </div>

                {/* Pagination */}
                {results.totalPages > 1 && (
                  <div className="flex items-center justify-center gap-2 mt-10">
                    <button
                      type="button"
                      disabled={currentPage === 1}
                      onClick={() => {
                        setCurrentPage((p) => Math.max(1, p - 1));
                        window.scrollTo({ top: 300, behavior: 'smooth' });
                      }}
                      className="px-4 py-2 rounded-xl border border-[#E4E7EC] text-xs font-semibold bg-white text-[#101828] hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                    >
                      ← Previous
                    </button>
                    <span className="text-xs font-bold text-navy-deep px-3">
                      Page {results.page} of {results.totalPages}
                    </span>
                    <button
                      type="button"
                      disabled={currentPage === results.totalPages}
                      onClick={() => {
                        setCurrentPage((p) => Math.min(results.totalPages, p + 1));
                        window.scrollTo({ top: 300, behavior: 'smooth' });
                      }}
                      className="px-4 py-2 rounded-xl border border-[#E4E7EC] text-xs font-semibold bg-white text-[#101828] hover:bg-slate-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                    >
                      Next →
                    </button>
                  </div>
                )}
              </>
            )}
          </main>
        </div>
      </div>
    </div>
  );
}
