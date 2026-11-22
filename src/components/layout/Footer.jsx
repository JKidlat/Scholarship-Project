import React from 'react';
import { Link } from 'react-router-dom';
import { Mail, Globe, Share2, MessageCircle } from 'lucide-react';

const footerLinks = {
  Scholarships: [
    { label: 'Find Scholarships', href: '/scholarships' },
    { label: 'Undergraduate', href: '/scholarships/undergraduate' },
    { label: 'Postgraduate', href: '/scholarships/postgraduate' },
    { label: 'International', href: '/scholarships/international' },
    { label: 'For Women', href: '/scholarships/for-women' },
    { label: 'By Field of Study', href: '/scholarships' },
  ],
  'Quick Links': [
    { label: 'Home', href: '/' },
    { label: 'About Us', href: '/about' },
    { label: 'Contact', href: '/contact' },
    { label: 'Sign Up', href: '/auth/register' },

  ],
  Legal: [
    { label: 'Privacy Policy', href: '/privacy-policy' },
    { label: 'Terms of Use', href: '/terms-of-use' },
    { label: 'Disclaimer', href: '/disclaimer' },
  ],
};

export function Footer() {
  const year = new Date().getFullYear();

  return (
    <footer className="bg-[#050D2B] text-white">
      {/* Newsletter strip */}
      <div className="bg-[#173A8A] border-y border-white/10">
        <div className="site-container py-10">
          <div className="flex flex-col md:flex-row items-center justify-between gap-6">
            <div>
              <h3 className="font-heading font-bold text-xl text-white mb-1">
                Get scholarship alerts in your inbox
              </h3>
              <p className="text-white/60 text-sm">
                Be notified when new scholarships are added or deadlines approach.
              </p>
            </div>
            <form onSubmit={(e) => { e.preventDefault(); alert('Subscribed to alerts!'); }} className="flex gap-2 w-full md:w-auto">
              <input
                type="email"
                required
                placeholder="Your email address"
                className="flex-1 md:w-72 px-4 py-2.5 rounded-lg bg-white/10 border border-white/20 text-white placeholder-white/40 text-sm focus:outline-none focus:border-[#FFC928] focus:ring-1 focus:ring-[#FFC928]"
              />
              <button
                type="submit"
                className="px-5 py-2.5 bg-[#FFC928] text-[#050D2B] font-semibold text-sm rounded-lg hover:bg-[#FFD84D] transition-colors whitespace-nowrap"
              >
                Subscribe
              </button>
            </form>
          </div>
        </div>
      </div>

      {/* Main footer */}
      <div className="site-container py-14">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-10">
          {/* Brand */}
          <div className="lg:col-span-2">
            <Link to="/" className="flex items-center gap-2.5 mb-4 group">
              <img
                src="/logo.png"
                alt="Ghana Scholarship Portal"
                className="h-11 w-11 object-contain rounded-lg"
              />
              <div className="leading-tight">
                <span className="font-heading font-extrabold text-white text-lg">
                  Ghana<span className="text-[#FFC928]">Scholarship</span>
                </span>
                <div className="text-[10px] text-white/40 tracking-widest uppercase -mt-0.5">Portal</div>
              </div>
            </Link>
            <p className="text-white/50 text-sm leading-relaxed mb-6 max-w-xs">
              Helping Ghanaian students discover and understand scholarship opportunities.
              Applications are always completed through the official provider.
            </p>
            <div className="flex gap-3">
              {[
                { icon: Globe, href: '#', label: 'Website' },
                { icon: MessageCircle, href: '#', label: 'Community' },
                { icon: Share2, href: '#', label: 'Share' },
                { icon: Mail, href: 'mailto:contact@ghanascholars.org', label: 'Email' },
              ].map(({ icon: Icon, href, label }) => (
                <a
                  key={label}
                  href={href}
                  aria-label={label}
                  className="w-9 h-9 rounded-lg bg-white/5 border border-white/10 flex items-center justify-center text-white/50 hover:text-[#FFC928] hover:border-[#FFC928]/30 hover:bg-[#FFC928]/10 transition-all"
                >
                  <Icon className="w-4 h-4" />
                </a>
              ))}
            </div>
          </div>

          {/* Links */}
          {Object.entries(footerLinks).map(([heading, links]) => (
            <div key={heading}>
              <h4 className="font-heading font-bold text-white text-sm uppercase tracking-wider mb-4">
                {heading}
              </h4>
              <ul className="flex flex-col gap-2">
                {links.map((link) => (
                  <li key={link.href}>
                    <Link
                      to={link.href}
                      className="text-white/50 hover:text-[#FFC928] text-sm transition-colors"
                    >
                      {link.label}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </div>

      {/* Bottom bar */}
      <div className="border-t border-white/10">
        <div className="site-container py-6 flex flex-col md:flex-row items-center justify-between gap-4">
          <p className="text-white/40 text-xs">
            &copy; {year} Ghana Scholarship Portal. All rights reserved.
          </p>
          <p className="text-white/30 text-xs text-center md:text-right max-w-lg">
            Disclaimer: Scholarship details and deadlines can change. Always confirm requirements
            with the official scholarship provider. This platform does not award scholarships.
          </p>
        </div>
      </div>
    </footer>
  );
}
