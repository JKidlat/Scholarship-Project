/**
 * @file StatsSection.jsx
 * @description Dynamic database metrics bar for the Ghana Scholarship Portal.
 * Queries Supabase (or cached local store fallback) to surface real-time
 * scholarship counts across total, open, international, and local awards.
 */

import React, { useState, useEffect } from 'react';
import { getScholarshipStats } from '../../services/scholarships';


export function StatsSection() {
  const [stats, setStats] = useState({ total: 0, open: 0, international: 0, local: 0 });

  useEffect(() => {
    let isMounted = true;
    getScholarshipStats().then((data) => {
      if (isMounted && data) {
        setStats(data);
      }
    }).catch((err) => {
      console.error('Error fetching live stats:', err);
    });

    return () => {
      isMounted = false;
    };
  }, []);

  const items = [
    {
      label: 'Verified Scholarships',
      sublabel: 'Active database opportunities',
      value: stats.total,
      suffix: '+',
      color: 'text-[#173A8A]',
      bg: 'bg-[#EEF2FF]',
    },
    {
      label: 'Currently Open',
      sublabel: 'Accepting 2026/2027 applications',
      value: stats.open,
      suffix: '',
      color: 'text-emerald-700',
      bg: 'bg-emerald-50',
    },
    {
      label: 'International Grants',
      sublabel: 'Study abroad schemes for Ghanaians',
      value: stats.international,
      suffix: '+',
      color: 'text-indigo-700',
      bg: 'bg-indigo-50',
    },
    {
      label: 'Local (Ghana)',
      sublabel: 'Public & private tertiary aid',
      value: stats.local,
      suffix: '+',
      color: 'text-[#854D0E]',
      bg: 'bg-amber-50',
    },
  ];

  return (
    <section className="bg-white border-b border-[#E4E7EC] py-8">
      <div className="site-container">
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 sm:gap-6">
          {items.map(({ label, sublabel, value, suffix, color, bg }) => (
            <div
              key={label}
              className="p-4 sm:p-5 rounded-2xl bg-[#F5F7FC] border border-[#E4E7EC] flex items-center gap-4 transition-all hover:bg-white hover:shadow-sm"
            >
              <div className="min-w-0">
                <div className={`font-heading font-black text-2xl sm:text-3xl ${color} leading-none mb-1`}>
                  {value > 0 ? `${value}${suffix}` : '—'}
                </div>
                <div className="text-[#101828] font-bold text-xs sm:text-sm truncate leading-snug">
                  {label}
                </div>
                <div className="text-[#667085] text-[11px] truncate hidden sm:block">
                  {sublabel}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
