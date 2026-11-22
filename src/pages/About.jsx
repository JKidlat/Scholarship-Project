/**
 * @file About.jsx
 * @description Comprehensive institutional overview and mission statement
 * for the Ghana Scholarship Portal.
 *
 * Emphasizes:
 * - Independent curation and verification of Ghanaian and international awards
 * - Anti-scam disclosure (free access, zero application fees)
 * - Authentic photographic integration of academic research environments
 */

import React from 'react';
import { Link } from 'react-router-dom';
import { Target, Eye, ShieldCheck, CheckCircle2, Award, Users, BookOpen, ArrowRight } from 'lucide-react';

export default function AboutPage() {
  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-20 pb-20">
      {/* Header Banner with Subtle Architectural Overlay */}
      <div className="relative bg-[#050D2B] text-white py-16 sm:py-20 mb-12 overflow-hidden border-b border-white/10">
        <div className="absolute inset-0 z-0">
          <img
            src="/images/about/university_library_hall.jpg"
            alt="Historic university research library hall"
            width="1440"
            height="360"
            className="w-full h-full object-cover object-center filter brightness-[0.2] contrast-[1.1]"
          />
          <div className="absolute inset-0 bg-gradient-to-r from-[#050D2B] via-[#050D2B]/95 to-[#050D2B]/85" />
        </div>

        <div className="site-container relative z-10 text-center max-w-3xl mx-auto">
          <span className="inline-block px-3 py-1 rounded-full bg-[#FFC928]/20 border border-[#FFC928]/30 text-xs font-bold text-[#FFC928] uppercase tracking-widest mb-4">
            About Our Mission &amp; Standards
          </span>
          <h1 className="font-heading font-black text-3xl sm:text-4xl md:text-5xl text-white mb-5 tracking-tight">
            Connecting Ghanaian Students to Educational Funding
          </h1>
          <p className="text-white/75 text-base md:text-lg leading-relaxed">
            The Ghana Scholarship Portal is an independent discovery directory built to help
            tertiary students discover legitimate funding, understand eligibility rules, track deadlines,
            and submit applications directly to official sponsors.
          </p>
        </div>
      </div>

      <div className="site-container max-w-5xl space-y-12">
        {/* Mission & Vision with Photographic Anchor */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-stretch">
          <div className="lg:col-span-7 flex flex-col justify-between gap-6">
            <div className="bg-white rounded-3xl p-8 border border-[#E4E7EC] shadow-sm space-y-3">
              <div className="w-12 h-12 rounded-2xl bg-[#173A8A] text-[#FFC928] flex items-center justify-center mb-2 shadow-2xs">
                <Target className="w-6 h-6" />
              </div>
              <h2 className="font-heading font-bold text-xl text-[#101828]">Our Mission</h2>
              <p className="text-sm text-[#667085] leading-relaxed">
                To eliminate information and financial barriers to higher education in Ghana by providing
                a completely free, transparent, and comprehensive scholarship discovery platform. We aggregate
                verified opportunities from domestic corporate foundations, government boards, and prestigious
                international sponsors.
              </p>
            </div>

            <div className="bg-white rounded-3xl p-8 border border-[#E4E7EC] shadow-sm space-y-3">
              <div className="w-12 h-12 rounded-2xl bg-[#173A8A] text-[#FFC928] flex items-center justify-center mb-2 shadow-2xs">
                <Eye className="w-6 h-6" />
              </div>
              <h2 className="font-heading font-bold text-xl text-[#101828]">Our Vision</h2>
              <p className="text-sm text-[#667085] leading-relaxed">
                A Ghana where every motivated and qualified student—regardless of financial background,
                geographic location, or gender—has unhindered access to the financial aid needed to fulfill
                their academic and professional ambitions.
              </p>
            </div>
          </div>

          {/* Authentic Campus Mentorship Photographic Card */}
          <div className="lg:col-span-5 rounded-3xl overflow-hidden border border-[#E4E7EC] shadow-sm relative bg-slate-900 flex flex-col">
            <img
              src="/images/about/students_mentorship.jpg"
              alt="Ghanaian university students engaged in collaborative academic mentorship"
              width="500"
              height="600"
              loading="lazy"
              className="w-full h-full object-cover filter brightness-[0.9] contrast-[1.05]"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-[#050D2B] via-transparent to-transparent opacity-90" />
            <div className="absolute bottom-6 left-6 right-6 text-white space-y-1">
              <span className="text-[11px] font-bold uppercase tracking-wider text-[#FFC928]">
                Student-Centred Directory
              </span>
              <h4 className="font-heading font-bold text-lg text-white">
                Empowering the Next Generation of Ghanaian Leaders
              </h4>
              <p className="text-xs text-white/70">
                Independent scholarship aggregation since 2026.
              </p>
            </div>
          </div>
        </div>

        {/* Operating Principles: Clear Distinction of What We Do vs What We Do Not Do */}
        <div className="bg-white rounded-3xl p-8 sm:p-10 border border-[#E4E7EC] shadow-sm">
          <div className="max-w-2xl mb-8">
            <span className="text-xs font-bold text-[#173A8A] uppercase tracking-wider block mb-1">
              Platform Integrity
            </span>
            <h2 className="font-heading font-extrabold text-2xl sm:text-3xl text-[#101828]">
              Understanding How This Directory Operates
            </h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="space-y-4 p-6 rounded-2xl bg-emerald-50/50 border border-emerald-100">
              <h3 className="font-heading font-bold text-base text-emerald-800 flex items-center gap-2">
                <CheckCircle2 className="w-5 h-5 text-emerald-600" />
                What We Do
              </h3>
              <ul className="space-y-3 text-xs sm:text-sm text-slate-700">
                <li className="flex items-start gap-2.5">
                  <span className="text-emerald-600 font-bold">•</span>
                  <span>Curate and verify domestic and international scholarship opportunities.</span>
                </li>
                <li className="flex items-start gap-2.5">
                  <span className="text-emerald-600 font-bold">•</span>
                  <span>Structure clear eligibility requirements, documentation checklists, and deadlines.</span>
                </li>
                <li className="flex items-start gap-2.5">
                  <span className="text-emerald-600 font-bold">•</span>
                  <span>Route students directly to official, verified sponsor application websites.</span>
                </li>
                <li className="flex items-start gap-2.5">
                  <span className="text-emerald-600 font-bold">•</span>
                  <span>Provide open filters by degree level, institution, field of study, and gender.</span>
                </li>
              </ul>
            </div>

            <div className="space-y-4 p-6 rounded-2xl bg-rose-50/50 border border-rose-100">
              <h3 className="font-heading font-bold text-base text-rose-800 flex items-center gap-2">
                <ShieldCheck className="w-5 h-5 text-rose-600" />
                What We Do NOT Do
              </h3>
              <ul className="space-y-3 text-xs sm:text-sm text-slate-700">
                <li className="flex items-start gap-2.5">
                  <span className="text-rose-600 font-bold">•</span>
                  <span>We do <strong>NOT</strong> process, review, or approve scholarship applications.</span>
                </li>
                <li className="flex items-start gap-2.5">
                  <span className="text-rose-600 font-bold">•</span>
                  <span>We do <strong>NOT</strong> charge fees or commission from students at any point.</span>
                </li>
                <li className="flex items-start gap-2.5">
                  <span className="text-rose-600 font-bold">•</span>
                  <span>We do <strong>NOT</strong> award scholarships or financial aid directly.</span>
                </li>
                <li className="flex items-start gap-2.5">
                  <span className="text-rose-600 font-bold">•</span>
                  <span>We do <strong>NOT</strong> act as intermediaries or agents for scholarship providers.</span>
                </li>
              </ul>
            </div>
          </div>
        </div>

        {/* Sponsor/Partner Call-to-action */}
        <div className="bg-[#0B1740] rounded-3xl p-8 sm:p-10 text-white flex flex-col md:flex-row items-center justify-between gap-6 border border-white/10 shadow-lg">
          <div className="space-y-2 text-center md:text-left">
            <h3 className="font-heading font-bold text-xl sm:text-2xl text-[#FFC928]">
              Are You a Scholarship Provider or University?
            </h3>
            <p className="text-sm text-white/75 max-w-xl">
              Foundations, alumni associations, and academic institutions offering funding for Ghanaian students
              are welcome to submit their opportunities for inclusion in the directory.
            </p>
          </div>
          <Link
            to="/contact"
            className="inline-flex items-center gap-2 px-6 py-3.5 bg-[#FFC928] text-[#050D2B] font-bold text-sm rounded-xl hover:bg-[#FFD84D] transition-colors whitespace-nowrap shadow-md"
          >
            <span>Submit An Opportunity</span>
            <ArrowRight className="w-4 h-4" />
          </Link>
        </div>
      </div>
    </div>
  );
}

export { AboutPage };
