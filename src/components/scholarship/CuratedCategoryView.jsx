/**
 * @file CuratedCategoryView.jsx
 * @description Specialized academic category landing view (e.g. Undergraduate,
 * Postgraduate, International, Women in STEM).
 *
 * Features:
 * - Prestigious academic banner with authentic architectural campus photography backdrop
 * - Client-side filter evaluation over published scholarship collection
 * - High-speed zero-layout-shift skeleton rendering during initial fetch
 * - Direct deep-link routing into the advanced faceted FilterSidebar
 */

import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft, CheckCircle2, ShieldCheck, Sparkles } from 'lucide-react';
import { ScholarshipCard, ScholarshipCardSkeleton } from './ScholarshipCard';
import { EmptyState } from '../common/EmptyState';
import { getPublishedScholarships } from '../../services/scholarships';

export function CuratedCategoryView({
  title,
  badge,
  description,
  filterFn,
}) {
  const [scholarships, setScholarships] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    let isMounted = true;

    async function load() {
      setLoading(true);
      try {
        const data = await getPublishedScholarships(300);
        if (isMounted) {
          const filtered = data.filter(filterFn);
          setScholarships(filtered);
          setLoading(false);
        }
      } catch (err) {
        console.error('Error loading curated scholarships:', err);
        if (isMounted) setLoading(false);
      }
    }

    load();
    return () => {
      isMounted = false;
    };
  }, [filterFn]);

  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-20 pb-20">
      {/* Category Hero Banner with Authentic Campus Photography Backdrop */}
      <div className="relative bg-[#050D2B] text-white py-14 sm:py-16 mb-8 overflow-hidden border-b border-white/10">
        {/* Campus architecture backdrop image */}
        <div className="absolute inset-0 z-0">
          <img
            src="/images/education/campus_hall.jpg"
            alt="University campus academic hall"
            className="w-full h-full object-cover object-center filter brightness-[0.25] contrast-[1.1]"
            width="1440"
            height="320"
          />
          <div className="absolute inset-0 bg-gradient-to-r from-[#050D2B] via-[#050D2B]/95 to-[#050D2B]/80" />
        </div>

        <div className="site-container relative z-10">
          <Link
            to="/scholarships"
            className="inline-flex items-center gap-1.5 text-xs text-[#FFC928] hover:underline mb-4 font-semibold"
          >
            <ArrowLeft className="w-3.5 h-3.5" />
            <span>All Scholarships Directory</span>
          </Link>

          <div className="max-w-3xl space-y-3">
            <span className="inline-block px-3 py-1 rounded-full bg-[#FFC928]/20 border border-[#FFC928]/30 text-xs font-bold text-[#FFC928] uppercase tracking-wider">
              {badge}
            </span>
            <h1 className="font-heading font-black text-3xl sm:text-4xl md:text-5xl text-white tracking-tight">
              {title}
            </h1>
            <p className="text-white/70 text-sm sm:text-base leading-relaxed">
              {description}
            </p>

            <div className="pt-2 flex flex-wrap items-center gap-5 text-xs text-white/60">
              <span className="flex items-center gap-1.5">
                <CheckCircle2 className="w-3.5 h-3.5 text-[#FFC928]" />
                Direct Application Portals
              </span>
              <span className="flex items-center gap-1.5">
                <ShieldCheck className="w-3.5 h-3.5 text-[#FFC928]" />
                Verified Eligibility Criteria
              </span>
            </div>
          </div>
        </div>
      </div>

      <div className="site-container">
        {/* Sub-header Meta Bar */}
        <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3 mb-8 pb-4 border-b border-[#E4E7EC]">
          <div>
            <p className="text-sm font-bold text-[#101828]">
              {loading ? (
                'Loading matching opportunities…'
              ) : (
                `Showing ${scholarships.length} ${
                  scholarships.length === 1 ? 'scholarship opportunity' : 'scholarship opportunities'
                }`
              )}
            </p>
            <p className="text-xs text-[#667085] mt-0.5">
              Filtered for Ghanaian tertiary candidates and international applicants
            </p>
          </div>

          <Link
            to="/scholarships"
            className="inline-flex items-center gap-1.5 text-xs font-bold text-[#173A8A] hover:text-[#050D2B] bg-white px-3.5 py-2 rounded-xl border border-[#E4E7EC] hover:border-[#173A8A]/30 shadow-2xs transition-all"
          >
            <Sparkles className="w-3.5 h-3.5 text-[#FFC928]" />
            <span>Open Advanced Filter Sidebar →</span>
          </Link>
        </div>

        {/* Scholarships Content Stream */}
        {loading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {[...Array(6)].map((_, i) => (
              <ScholarshipCardSkeleton key={i} />
            ))}
          </div>
        ) : scholarships.length === 0 ? (
          <div className="bg-white rounded-2xl border border-[#E4E7EC] p-8">
            <EmptyState
              variant="empty"
              title="No scholarships found in this category"
              description="New opportunities will appear here once imported and published through the admin dashboard."
              action={{ label: 'Explore All Scholarships', href: '/scholarships' }}
            />
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {scholarships.map((s) => (
              <ScholarshipCard key={s.id} scholarship={s} />
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
