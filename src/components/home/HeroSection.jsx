/**
 * @file HeroSection.jsx
 * @description Primary landing showcase for the Ghana Scholarship Portal.
 * Combines high-contrast educational typography, an intuitive scholarship search bar,
 * and authentic photography of African university scholars.
 *
 * Design Guidelines:
 * - Brand palette: Navy Deep (#050D2B), Royal (#173A8A), Gold (#FFC928), White (#FFFFFF)
 * - Zero artificial/abstract shapes or generic SVG cliparts
 * - Eager-loaded photography with explicit dimensions to eliminate Cumulative Layout Shift (CLS)
 */

import React, { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import {
  Search,
  ArrowRight,
  GraduationCap,
  Globe,
  Award,
  Users,
  ShieldCheck,
  CheckCircle2,
  Sparkles,
} from 'lucide-react';

// Quick access filter pills displayed below the primary search bar
const quickLinks = [
  { label: 'Undergraduate', href: '/scholarships/undergraduate', icon: GraduationCap },
  { label: 'Postgraduate', href: '/scholarships/postgraduate', icon: Award },
  { label: 'International', href: '/scholarships/international', icon: Globe },
  { label: 'For Women', href: '/scholarships/for-women', icon: Users },
];

export function HeroSection() {
  const navigate = useNavigate();
  const [query, setQuery] = useState('');

  /**
   * Dispatches user search query to the /scholarships directory
   * with URL-encoded query parameters.
   */
  const handleSearch = (e) => {
    e.preventDefault();
    if (query.trim()) {
      navigate(`/scholarships?query=${encodeURIComponent(query.trim())}`);
    } else {
      navigate('/scholarships');
    }
  };

  return (
    <section className="relative bg-[#050D2B] text-white pt-28 pb-16 lg:pt-36 lg:pb-24 overflow-hidden border-b border-white/10">
      {/* Subtle architectural grid pattern overlay for depth */}
      <div
        className="absolute inset-0 opacity-[0.03] pointer-events-none"
        style={{
          backgroundImage: `linear-gradient(#ffffff 1px, transparent 1px), linear-gradient(90deg, #ffffff 1px, transparent 1px)`,
          backgroundSize: '48px 48px',
        }}
      />

      <div className="site-container relative z-10">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-8 items-center">
          {/* LEFT COLUMN: Educational Value Proposition & Search */}
          <div className="lg:col-span-7 space-y-6 text-center lg:text-left">


            {/* Main Headline */}
            <h1 className="font-heading text-3xl sm:text-5xl lg:text-6xl font-black text-white leading-[1.1] tracking-tight">
              Find Verified{' '}
              <span className="text-[#FFC928]">Scholarships.</span>
              <br />
              Fund Your Future In{' '}
              <span className="underline decoration-[#FFC928] decoration-4 underline-offset-8">
                Ghana &amp; Abroad.
              </span>
            </h1>

            {/* Sub-headline description */}
            <p className="text-white/70 text-base sm:text-lg leading-relaxed max-w-2xl mx-auto lg:mx-0">
              Explore 160+ authenticated local awards, government grants, and international
              scholarships for Ghanaian undergraduates, postgraduates, and researchers. Free to browse.
              Direct links to official application portals.
            </p>

            {/* Interactive Search Bar */}
            <form
              onSubmit={handleSearch}
              className="flex flex-col sm:flex-row gap-2.5 max-w-xl mx-auto lg:mx-0 pt-2"
            >
              <div className="flex-1 relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-white/40" />
                <input
                  type="search"
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="Search by degree, sponsor, university or field…"
                  className="w-full pl-12 pr-4 py-3.5 bg-white/10 border border-white/20 rounded-xl text-white placeholder-white/40 text-sm sm:text-base focus:outline-none focus:border-[#FFC928] focus:ring-2 focus:ring-[#FFC928]/30 transition-all"
                />
              </div>
              <button
                type="submit"
                className="flex items-center justify-center gap-2 px-7 py-3.5 bg-[#FFC928] text-[#050D2B] font-bold text-sm sm:text-base rounded-xl hover:bg-[#FFD84D] transition-colors whitespace-nowrap shadow-md hover:shadow-lg"
              >
                <span>Search</span>
                <ArrowRight className="w-4 h-4" />
              </button>
            </form>

            {/* Curated Category Quick Links */}
            <div className="pt-2">
              <span className="text-xs font-semibold text-white/50 block mb-2 uppercase tracking-wider">
                Popular Categories:
              </span>
              <div className="flex flex-wrap items-center justify-center lg:justify-start gap-2">
                {quickLinks.map(({ label, href, icon: Icon }) => (
                  <Link
                    key={href}
                    to={href}
                    className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-white/5 hover:bg-white/15 border border-white/10 text-white/80 hover:text-white text-xs font-medium transition-all"
                  >
                    <Icon className="w-3.5 h-3.5 text-[#FFC928]" />
                    <span>{label}</span>
                  </Link>
                ))}
                <Link
                  to="/scholarships"
                  className="inline-flex items-center gap-1 px-3 py-1.5 rounded-lg bg-[#FFC928]/15 hover:bg-[#FFC928]/25 text-[#FFC928] border border-[#FFC928]/30 text-xs font-semibold transition-all"
                >
                  <span>All 160+ Awards →</span>
                </Link>
              </div>
            </div>
          </div>


          {/* RIGHT COLUMN: Authentic Educational Photography Showcase */}
          <div className="lg:col-span-5 relative">
            <div className="relative mx-auto max-w-md lg:max-w-none">
              {/* Outer Decorative Border Frame */}
              <div className="relative rounded-3xl overflow-hidden border-2 border-white/15 shadow-2xl bg-[#0B1740]">
                {/* Authentic photograph of African scholars */}
                <img
                  src="/images/hero/african_students_hero.jpg"
                  alt="African university scholars collaborating on campus with books and digital tools"
                  width="600"
                  height="500"
                  loading="eager"
                  className="w-full h-[360px] sm:h-[420px] object-cover object-top filter brightness-[0.95] contrast-[1.05]"
                />
                {/* Subtle gradient overlay to enhance text readability on floating cards */}
                <div className="absolute inset-0 bg-gradient-to-t from-[#050D2B]/90 via-transparent to-transparent pointer-events-none" />

                {/* Floating Bottom Card: Verified Status */}
                <div className="absolute bottom-4 left-4 right-4 p-4 rounded-2xl bg-[#050D2B]/90 backdrop-blur-md border border-white/15 text-left flex items-center justify-between shadow-xl">
                  <div>
                    <span className="text-[11px] font-semibold text-[#FFC928] uppercase tracking-wider block">
                      Active Listings
                    </span>
                    <span className="text-white font-heading font-extrabold text-base">
                      162 Curated Opportunities
                    </span>
                    <p className="text-white/60 text-[11px] mt-0.5">
                      Local Ghanaian &amp; Global Scholarships
                    </p>
                  </div>
                </div>
              </div>

              {/* Floating Top-Left Trust Pill */}
              <div className="hidden sm:flex absolute -top-4 -left-4 items-center gap-2.5 px-4 py-2.5 rounded-xl bg-white text-[#050D2B] shadow-xl border border-slate-200">
                <div className="w-2.5 h-2.5 rounded-full bg-emerald-500 animate-pulse" />
                <span className="text-xs font-bold font-heading">
                  2026/2027 Admissions Open
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
