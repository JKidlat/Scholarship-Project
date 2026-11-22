/**
 * @file FieldsSection.jsx
 * @description Academic discipline selector for the Ghana Scholarship Portal.
 * Uses realistic, high-quality photographs for each field of study.
 *
 * Links to /scholarships?field=<slug> which integrates with FilterSidebar.
 */

import React from 'react';
import { Link } from 'react-router-dom';
import { ArrowRight } from 'lucide-react';

const fields = [
  {
    name: 'Engineering & Tech',
    slug: 'engineering',
    description: 'Civil, Mechanical, Electrical, Robotics & STEM',
    image: '/images/fields/engineering.jpg',
  },
  {
    name: 'Medicine & Health Sciences',
    slug: 'medicine-health-sciences',
    description: 'Nursing, Pharmacy, MBBS, Clinical & Public Health',
    image: '/images/fields/medicine.jpg',
  },
  {
    name: 'Computer Science & IT',
    slug: 'computer-science-it',
    description: 'Software Engineering, Data Science, AI & Cyber',
    image: '/images/fields/computer_science.jpg',
  },
  {
    name: 'Business & Management',
    slug: 'business-management',
    description: 'Accounting, Finance, MBA, Commerce & Marketing',
    image: '/images/fields/business.jpg',
  },
  {
    name: 'Agriculture & Forestry',
    slug: 'agriculture',
    description: 'Agribusiness, Soil Science, Fisheries & Farming',
    image: '/images/fields/agriculture.jpg',
  },
  {
    name: 'Education & Teaching',
    slug: 'education',
    description: 'Pedagogy, Curriculum Design & Special Education',
    image: '/images/fields/education.jpg',
  },
  {
    name: 'Law & Legal Studies',
    slug: 'law',
    description: 'LLB, LLM, International Law & Human Rights',
    image: '/images/fields/law.jpg',
  },
  {
    name: 'Social Sciences',
    slug: 'social-sciences',
    description: 'Economics, Sociology, Politics & Development',
    image: '/images/fields/social_sciences.jpg',
  },
  {
    name: 'Arts & Humanities',
    slug: 'arts-humanities',
    description: 'History, Literature, Languages & Philosophy',
    image: '/images/fields/arts_humanities.jpg',
  },
  {
    name: 'Natural & Applied Sciences',
    slug: 'science',
    description: 'Physics, Chemistry, Biochemistry & Mathematics',
    image: '/images/fields/science.jpg',
  },
  {
    name: 'Architecture & Planning',
    slug: 'architecture',
    description: 'Urban Design, Quantity Surveying & Construction',
    image: '/images/fields/architecture.jpg',
  },
  {
    name: 'Environmental Studies',
    slug: 'environmental-studies',
    description: 'Climate Science, Water & Renewable Clean Energy',
    image: '/images/fields/environmental_studies.jpg',
  },
];

export function FieldsSection() {
  return (
    <section className="bg-white py-20 border-t border-[#E4E7EC]">
      <div className="site-container">
        {/* Section Header */}
        <div className="text-center mb-14 max-w-2xl mx-auto">
          <h2 className="font-heading font-extrabold text-3xl sm:text-4xl text-[#101828] mb-3">
            Browse Scholarships by Discipline
          </h2>
          <p className="text-[#667085] text-base leading-relaxed">
            Target your scholarship discovery directly according to your tertiary degree
            or research field of study.
          </p>
        </div>

        {/* Grid of Academic Fields with Authentic Photography */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {fields.map(({ name, slug, description, image }) => (
            <Link
              key={slug}
              to={`/scholarships?field=${slug}`}
              className="group flex flex-col bg-white rounded-2xl border border-[#E4E7EC] hover:border-[#173A8A] hover:shadow-lg transition-all duration-300 overflow-hidden"
            >
              {/* Photographic Discipline Banner */}
              <div className="relative h-40 w-full overflow-hidden bg-slate-100">
                <img
                  src={image}
                  alt={name}
                  loading="lazy"
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent opacity-60 group-hover:opacity-40 transition-opacity" />
              </div>

              {/* Card Body */}
              <div className="p-4 flex flex-col flex-1 justify-between bg-white">
                <div>
                  <h3 className="font-heading font-bold text-[#101828] text-base group-hover:text-[#173A8A] transition-colors leading-snug mb-1">
                    {name}
                  </h3>
                  <p className="text-xs text-[#667085] line-clamp-1 leading-relaxed">
                    {description}
                  </p>
                </div>

                <div className="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between text-xs font-semibold text-[#173A8A] group-hover:text-[#050D2B]">
                  <span>Explore Scholarships</span>
                  <ArrowRight className="w-3.5 h-3.5 text-[#FFC928] group-hover:translate-x-1 transition-transform" />
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
}
