/**
 * @file CategoryGrid.jsx
 * @description Curated academic category showcase for the Ghana Scholarship Portal.
 * Uses authentic photographic imagery for each academic domain, paired with
 * functional interface iconography and high-contrast typography.
 *
 * Image Asset Mapping:
 * - Undergraduate: /images/categories/undergraduate.jpg
 * - Postgraduate: /images/categories/postgraduate.jpg
 * - International: /images/categories/international.jpg
 * - For Women: /images/categories/women_in_education.jpg
 * - Institution-Specific: /images/categories/institution_specific.jpg
 * - Public Institution: /images/categories/public_institution.jpg
 * - Science & Engineering: /images/categories/science_engineering.jpg
 * - Law & Social Sciences: /images/categories/law_social_sciences.jpg
 */

import React from 'react';
import { Link } from 'react-router-dom';
import { ArrowRight } from 'lucide-react';

const categories = [
  {
    label: 'Undergraduate',
    description: 'First-degree scholarships and local bursaries',
    href: '/scholarships/undergraduate',
    image: '/images/categories/undergraduate.jpg',
    tag: 'BSc / BA Degrees',
  },
  {
    label: 'Postgraduate',
    description: "Master's, MPhil, and doctoral research fellowships",
    href: '/scholarships/postgraduate',
    image: '/images/categories/postgraduate.jpg',
    tag: "Master's & PhD",
  },
  {
    label: 'International',
    description: 'Fully funded study abroad programs for Ghanaians',
    href: '/scholarships/international',
    image: '/images/categories/international.jpg',
    tag: 'Global Awards',
  },
  {
    label: 'For Women',
    description: 'Targeted scholarships promoting women in academia',
    href: '/scholarships/for-women',
    image: '/images/categories/women_in_education.jpg',
    tag: 'Female Scholars',
  },
  {
    label: 'Institution-Specific',
    description: 'Awards exclusive to named universities and colleges',
    href: '/scholarships/institution-specific',
    image: '/images/categories/institution_specific.jpg',
    tag: 'Campus Specific',
  },
  {
    label: 'Public Institution',
    description: 'Government assistance for public tertiary institutions',
    href: '/scholarships/public-institution',
    image: '/images/categories/public_institution.jpg',
    tag: 'State Universities',
  },
  {
    label: 'Science & Engineering',
    description: 'STEM research, computing, and technological innovation',
    href: '/scholarships?field=engineering',
    image: '/images/categories/science_engineering.jpg',
    tag: 'STEM Funding',
  },
  {
    label: 'Law & Social Sciences',
    description: 'Legal training, human rights, policy, and commerce',
    href: '/scholarships?field=law',
    image: '/images/categories/law_social_sciences.jpg',
    tag: 'Legal & Policy',
  },
];

export function CategoryGrid() {
  return (
    <section className="bg-white py-20 border-b border-[#E4E7EC]">
      <div className="site-container">
        {/* Section Header */}
        <div className="text-center mb-14 max-w-2xl mx-auto">
          <h2 className="font-heading font-extrabold text-3xl sm:text-4xl text-[#101828] mb-3">
            Browse by Scholarship Category
          </h2>
          <p className="text-[#667085] text-base leading-relaxed">
            Navigate through structured funding opportunities categorised by academic level,
            institutional eligibility, and field of study.
          </p>
        </div>

        {/* Photographic Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {categories.map(({ label, description, href, image, tag }) => (
            <Link
              key={href}
              to={href}
              className="group bg-white rounded-2xl border border-[#E4E7EC] overflow-hidden shadow-2xs hover:shadow-xl hover:border-[#173A8A]/30 transition-all duration-300 flex flex-col"
            >
              {/* Photographic Thumbnail Header with Functional Icon Pill */}
              <div className="relative h-44 overflow-hidden bg-slate-100">
                <img
                  src={image}
                  alt={`${label} academic category`}
                  width="400"
                  height="200"
                  loading="lazy"
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 filter brightness-[0.92]"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-[#050D2B]/80 via-transparent to-black/10" />

                {/* Top Badge Tag */}
                <div className="absolute top-3 right-3">
                  <span className="px-2.5 py-1 rounded-full bg-[#050D2B]/85 backdrop-blur-md text-[10px] font-bold uppercase tracking-wider text-[#FFC928] border border-white/10">
                    {tag}
                  </span>
                </div>

              </div>

              {/* Card Body & Call to Action */}
              <div className="p-5 flex-1 flex flex-col justify-between space-y-3">
                <div>
                  <h3 className="font-heading font-bold text-[#101828] text-base group-hover:text-[#173A8A] transition-colors leading-snug mb-1.5">
                    {label}
                  </h3>
                  <p className="text-xs text-[#667085] leading-relaxed line-clamp-2">
                    {description}
                  </p>
                </div>

                <div className="pt-2 border-t border-slate-100 flex items-center justify-between text-xs font-bold text-[#173A8A] group-hover:text-[#050D2B]">
                  <span>Explore Awards</span>
                  <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-1 transition-transform" />
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
}
