/**
 * @file FeaturedScholarships.jsx
 * @description Curated homepage stream of high-impact scholarships.
 * Renders real provider logos and verified badges, reacting dynamically
 * to any administrator edits via live window event listeners.
 */

import React, { useState, useEffect, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { ScholarshipCard, ScholarshipCardSkeleton } from '../scholarship/ScholarshipCard';
import { EmptyState } from '../common/EmptyState';
import { getFeaturedOpenScholarships, invalidateScholarshipCache } from '../../services/scholarships';

export function FeaturedScholarships() {
  const [scholarships, setScholarships] = useState([]);
  const [loading, setLoading] = useState(true);

  const loadScholarships = useCallback(async (showSkeleton = false) => {
    if (showSkeleton) setLoading(true);
    const data = await getFeaturedOpenScholarships(6);
    setScholarships(data);
    setLoading(false);
  }, []);

  useEffect(() => {
    loadScholarships(true);
  }, [loadScholarships]);

  useEffect(() => {
    const handleSync = () => {
      // Invalidate cache and reload only when a scholarship is genuinely modified or deleted
      invalidateScholarshipCache();
      loadScholarships(false);
    };

    window.addEventListener('scholarship-updated', handleSync);
    window.addEventListener('scholarship-deleted', handleSync);
    window.addEventListener('storage', handleSync);

    return () => {
      window.removeEventListener('scholarship-updated', handleSync);
      window.removeEventListener('scholarship-deleted', handleSync);
      window.removeEventListener('storage', handleSync);
    };
  }, [loadScholarships]);

  return (
    <section className="bg-[#F5F7FC] py-20">
      <div className="site-container">
        <div className="flex items-end justify-between gap-4 mb-12">
          <div>
            <h2 className="font-heading font-extrabold text-3xl md:text-4xl text-[#101828] mb-3">
              Featured Scholarships
            </h2>
            <p className="text-[#667085] text-base max-w-lg">
              {scholarships.length === 0
                ? 'Scholarship records will appear here once imported through the admin dashboard.'
                : 'Handpicked opportunities for Ghanaian students.'}
            </p>
          </div>
          <Link
            to="/scholarships"
            className="hidden md:flex items-center gap-2 text-sm font-semibold text-[#173A8A] hover:text-[#122d6e] whitespace-nowrap"
          >
            View all scholarships →
          </Link>
        </div>

        {loading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {[...Array(6)].map((_, i) => (
              <ScholarshipCardSkeleton key={i} />
            ))}
          </div>
        ) : scholarships.length === 0 ? (
          <EmptyState
            variant="empty"
            title="No scholarships yet"
            description="Scholarship opportunities will appear here once your database is populated through the admin dashboard."
            action={{ label: 'Admin Dashboard', href: '/admin' }}
          />
        ) : (
          <>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {scholarships.map((s) => (
                <ScholarshipCard key={s.id} scholarship={s} />
              ))}
            </div>
            <div className="text-center mt-10">
              <Link
                to="/scholarships"
                className="inline-flex items-center gap-2 px-8 py-3.5 bg-[#173A8A] text-white font-semibold rounded-xl hover:bg-[#122d6e] transition-colors"
              >
                Browse All Scholarships →
              </Link>
            </div>
          </>
        )}
      </div>
    </section>
  );
}
