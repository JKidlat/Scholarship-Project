/**
 * @file DestinationsSection.jsx
 * @description International and domestic scholarship destination selector.
 * Allows Ghanaian students to filter opportunities according to study destination country.
 *
 * Links directly to /scholarships?destination=<country_code> which FilterSidebar consumes.
 */

import React from 'react';
import { Link } from 'react-router-dom';
import { Globe, ArrowRight } from 'lucide-react';

const destinations = [
  { name: 'Ghana', code: 'GH', flag: '/images/flags/gh.svg', note: 'Domestic tertiary opportunities' },
  { name: 'United Kingdom', code: 'GB', flag: '/images/flags/gb.svg', note: 'Chevening, Commonwealth' },
  { name: 'United States', code: 'US', flag: '/images/flags/us.svg', note: 'Fulbright, Mastercard' },
  { name: 'Canada', code: 'CA', flag: '/images/flags/ca.svg', note: 'Vanier, University grants' },
  { name: 'Germany', code: 'DE', flag: '/images/flags/de.svg', note: 'DAAD, Heinrich Böll' },
  { name: 'Japan', code: 'JP', flag: '/images/flags/jp.svg', note: 'MEXT, JICA scholarships' },
  { name: 'China', code: 'CN', flag: '/images/flags/cn.svg', note: 'CSC Chinese Government' },
  { name: 'Australia', code: 'AU', flag: '/images/flags/au.svg', note: 'Australia Awards Africa' },
  { name: 'France', code: 'FR', flag: '/images/flags/fr.svg', note: 'Eiffel Excellence' },
  { name: 'Netherlands', code: 'NL', flag: '/images/flags/nl.svg', note: 'Orange Knowledge' },
  { name: 'Sweden', code: 'SE', flag: '/images/flags/se.svg', note: 'SI Global Scholarships' },
  { name: 'South Korea', code: 'KR', flag: '/images/flags/kr.svg', note: 'Global Korea Scholarship' },
];

export function DestinationsSection() {
  return (
    <section className="bg-[#F5F7FC] py-20 border-t border-[#E4E7EC]">
      <div className="site-container">
        {/* Section Header */}
        <div className="text-center mb-14 max-w-2xl mx-auto">
          <h2 className="font-heading font-extrabold text-3xl sm:text-4xl text-[#101828] mb-3">
            Where Do You Aspire to Study?
          </h2>
          <p className="text-[#667085] text-base leading-relaxed">
            Discover fully funded opportunities for studies within Ghana or at top-ranked
            universities worldwide offering aid for Ghanaian citizens.
          </p>
        </div>

        {/* Destination Cards Grid */}
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
          {destinations.map(({ name, code, flag, note }) => (
            <Link
              key={code}
              to={`/scholarships?destination=${code}`}
              className="flex items-center gap-3.5 p-4 bg-white rounded-2xl border border-[#E4E7EC] hover:border-[#173A8A] hover:shadow-md transition-all duration-200 group"
            >
              <div className="w-10 h-7 shrink-0 rounded-md overflow-hidden border border-slate-200/80 shadow-2xs group-hover:scale-105 transition-transform bg-slate-50 flex items-center justify-center">
                <img
                  src={flag}
                  alt={`${name} flag`}
                  className="w-full h-full object-cover"
                  loading="lazy"
                />
              </div>
              <div className="min-w-0 flex-1">
                <h3 className="font-heading font-bold text-[#101828] text-sm group-hover:text-[#173A8A] transition-colors truncate">
                  {name}
                </h3>
                <p className="text-[11px] text-[#667085] truncate mt-0.5">{note}</p>
              </div>
            </Link>
          ))}
        </div>

        <div className="mt-10 text-center">
          <Link
            to="/scholarships/international"
            className="inline-flex items-center gap-2 text-xs font-bold text-[#173A8A] hover:text-[#050D2B] bg-white px-5 py-2.5 rounded-xl border border-[#E4E7EC] hover:border-[#173A8A]/30 shadow-2xs transition-all"
          >
            <Globe className="w-4 h-4 text-[#FFC928]" />
            <span>Explore All International Scholarships for Ghanaian Students</span>
            <ArrowRight className="w-3.5 h-3.5" />
          </Link>
        </div>
      </div>
    </section>
  );
}
