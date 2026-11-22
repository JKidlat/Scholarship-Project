import React, { useState, useEffect, useRef } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Menu, X, ChevronDown, Search, User, LogIn } from 'lucide-react';
import { cn } from '../../utils/formatters';
import { useAuth } from '../../context/AuthContext';

const navLinks = [
  { label: 'Home', href: '/' },
  {
    label: 'Find Scholarships',
    href: '/scholarships',
    children: [
      { label: 'All Scholarships', href: '/scholarships' },
      { label: 'Undergraduate', href: '/scholarships/undergraduate' },
      { label: 'Postgraduate', href: '/scholarships/postgraduate' },
      { label: 'International', href: '/scholarships/international' },
      { label: 'For Women', href: '/scholarships/for-women' },
      { label: 'Institution-Specific', href: '/scholarships/institution-specific' },
      { label: 'Public Institution', href: '/scholarships/public-institution' },
    ],
  },
  { label: 'About Us', href: '/about' },
  { label: 'Contact', href: '/contact' },
];

export function Navbar() {
  const navigate = useNavigate();
  const { user, profile } = useAuth();
  const [mobileOpen, setMobileOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const [openDropdown, setOpenDropdown] = useState(null);
  const [searchOpen, setSearchOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const dropdownRef = useRef(null);

  useEffect(() => {
    const handleScroll = () => setScrolled(window.scrollY > 20);
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  useEffect(() => {
    const handleClickOutside = (e) => {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target)) {
        setOpenDropdown(null);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const handleSearch = (e) => {
    e.preventDefault();
    if (searchQuery.trim()) {
      navigate(`/scholarships?query=${encodeURIComponent(searchQuery.trim())}`);
      setSearchOpen(false);
    }
  };

  return (
    <header
      className={cn(
        'fixed top-0 left-0 right-0 z-50 transition-all duration-300',
        scrolled
          ? 'bg-[#050D2B]/95 backdrop-blur-md shadow-lg shadow-black/20'
          : 'bg-[#050D2B]'
      )}
    >
      <div className="site-container">
        <div className="flex items-center justify-between h-16 md:h-20">
          {/* Logo */}
          <Link to="/" className="flex items-center gap-2.5 group">
            <img
              src="/logo.png"
              alt="Ghana Scholarship Portal"
              className="h-10 w-10 object-contain rounded-lg"
            />
            <div className="leading-tight">
              <span className="font-heading font-extrabold text-white text-lg tracking-tight">
                Ghana<span className="text-[#FFC928]">Scholarship</span>
              </span>
              <div className="text-[10px] text-white/50 tracking-widest uppercase -mt-0.5">Portal</div>
            </div>
          </Link>

          {/* Desktop Nav */}
          <nav ref={dropdownRef} className="hidden lg:flex items-center gap-1">
            {navLinks.map((link) =>
              link.children ? (
                <div key={link.label} className="relative">
                  <button
                    onClick={() => setOpenDropdown(openDropdown === link.label ? null : link.label)}
                    className="flex items-center gap-1 px-4 py-2 text-white/80 hover:text-[#FFC928] font-medium text-sm transition-colors rounded-lg hover:bg-white/5"
                  >
                    {link.label}
                    <ChevronDown className={cn('w-3.5 h-3.5 transition-transform', openDropdown === link.label && 'rotate-180')} />
                  </button>
                  {openDropdown === link.label && (
                    <div className="absolute top-full left-0 mt-1 w-56 bg-[#0B1740] border border-white/10 rounded-xl shadow-xl shadow-black/40 overflow-hidden z-50">
                      {link.children.map((child) => (
                        <Link
                          key={child.href}
                          to={child.href}
                          onClick={() => setOpenDropdown(null)}
                          className="block px-4 py-3 text-sm text-white/70 hover:text-[#FFC928] hover:bg-white/5 transition-colors"
                        >
                          {child.label}
                        </Link>
                      ))}
                    </div>
                  )}
                </div>
              ) : (
                <Link
                  key={link.href}
                  to={link.href}
                  className="px-4 py-2 text-white/80 hover:text-[#FFC928] font-medium text-sm transition-colors rounded-lg hover:bg-white/5"
                >
                  {link.label}
                </Link>
              )
            )}
          </nav>

          {/* Desktop Actions */}
          <div className="hidden lg:flex items-center gap-2">
            {/* Search toggle */}
            <button
              onClick={() => setSearchOpen(!searchOpen)}
              className="w-9 h-9 flex items-center justify-center rounded-lg text-white/70 hover:text-[#FFC928] hover:bg-white/5 transition-colors"
              aria-label="Search"
            >
              <Search className="w-4.5 h-4.5" />
            </button>

            {/* Auth links or Dashboard link */}
            {user ? (
              <Link
                to="/dashboard"
                className="flex items-center gap-2 px-3.5 py-1.5 text-sm font-semibold bg-[#FFC928] text-[#050D2B] rounded-xl hover:bg-[#FFD84D] transition-colors shadow-2xs group"
              >
                {profile?.avatar_url ? (
                  <img
                    src={profile.avatar_url}
                    alt={profile.full_name || 'Profile'}
                    className="w-6 h-6 rounded-full object-cover border border-[#050D2B]/30"
                  />
                ) : (
                  <div className="w-6 h-6 rounded-full bg-[#050D2B] text-[#FFC928] flex items-center justify-center text-xs font-bold font-heading">
                    {(profile?.full_name || user?.email || 'S').trim().charAt(0).toUpperCase()}
                  </div>
                )}
                <span>Student Portal</span>
              </Link>
            ) : (
              <>
                <Link
                  to="/auth/login"
                  className="flex items-center gap-1.5 px-4 py-2 text-sm font-medium text-white/80 hover:text-[#FFC928] transition-colors"
                >
                  <LogIn className="w-4 h-4" />
                  Login
                </Link>
                <Link
                  to="/auth/register"
                  className="flex items-center gap-1.5 px-4 py-2 text-sm font-semibold bg-[#FFC928] text-[#050D2B] rounded-lg hover:bg-[#FFD84D] transition-colors"
                >
                  <User className="w-4 h-4" />
                  Sign Up
                </Link>
              </>
            )}
          </div>

          {/* Mobile hamburger */}
          <button
            className="lg:hidden w-10 h-10 flex items-center justify-center rounded-lg text-white hover:bg-white/10 transition-colors"
            onClick={() => setMobileOpen(!mobileOpen)}
            aria-label="Toggle menu"
          >
            {mobileOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
          </button>
        </div>

        {/* Search bar dropdown */}
        {searchOpen && (
          <div className="hidden lg:block border-t border-white/10 py-3">
            <form onSubmit={handleSearch} className="flex gap-2">
              <input
                type="search"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Search scholarships by name, institution, field…"
                className="flex-1 bg-white/10 border border-white/20 rounded-lg px-4 py-2 text-white placeholder-white/40 text-sm focus:outline-none focus:border-[#FFC928] focus:ring-1 focus:ring-[#FFC928]"
                autoFocus
              />
              <button
                type="submit"
                className="px-5 py-2 bg-[#FFC928] text-[#050D2B] font-semibold text-sm rounded-lg hover:bg-[#FFD84D] transition-colors whitespace-nowrap"
              >
                Search
              </button>
            </form>
          </div>
        )}
      </div>

      {/* Mobile menu */}
      {mobileOpen && (
        <div className="lg:hidden bg-[#0B1740] border-t border-white/10">
          <div className="site-container py-4 flex flex-col gap-1">
            <form onSubmit={handleSearch} className="flex gap-2 mb-3">
              <input
                type="search"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Search scholarships…"
                className="flex-1 bg-white/10 border border-white/20 rounded-lg px-3 py-2 text-white placeholder-white/40 text-sm focus:outline-none focus:border-[#FFC928]"
              />
              <button type="submit" className="px-4 py-2 bg-[#FFC928] text-[#050D2B] font-semibold text-sm rounded-lg">
                Go
              </button>
            </form>

            {navLinks.map((link) =>
              link.children ? (
                <div key={link.label}>
                  <button
                    onClick={() => setOpenDropdown(openDropdown === link.label ? null : link.label)}
                    className="w-full flex items-center justify-between px-3 py-2.5 text-white/80 hover:text-[#FFC928] font-medium text-sm rounded-lg hover:bg-white/5"
                  >
                    {link.label}
                    <ChevronDown className={cn('w-4 h-4 transition-transform', openDropdown === link.label && 'rotate-180')} />
                  </button>
                  {openDropdown === link.label && (
                    <div className="ml-4 mt-1 flex flex-col gap-0.5">
                      {link.children.map((child) => (
                        <Link
                          key={child.href}
                          to={child.href}
                          onClick={() => setMobileOpen(false)}
                          className="px-3 py-2 text-sm text-white/60 hover:text-[#FFC928] rounded-lg hover:bg-white/5"
                        >
                          {child.label}
                        </Link>
                      ))}
                    </div>
                  )}
                </div>
              ) : (
                <Link
                  key={link.href}
                  to={link.href}
                  onClick={() => setMobileOpen(false)}
                  className="px-3 py-2.5 text-white/80 hover:text-[#FFC928] font-medium text-sm rounded-lg hover:bg-white/5"
                >
                  {link.label}
                </Link>
              )
            )}

            <div className="mt-3 pt-3 border-t border-white/10 flex flex-col gap-2">
              {user ? (
                <Link
                  to="/dashboard"
                  onClick={() => setMobileOpen(false)}
                  className="px-3 py-2.5 text-sm font-semibold bg-[#FFC928] text-[#050D2B] rounded-lg flex items-center justify-center gap-2 hover:bg-[#FFD84D]"
                >
                  {profile?.avatar_url ? (
                    <img
                      src={profile.avatar_url}
                      alt={profile.full_name || 'Profile'}
                      className="w-5 h-5 rounded-full object-cover border border-[#050D2B]/30"
                    />
                  ) : (
                    <div className="w-5 h-5 rounded-full bg-[#050D2B] text-[#FFC928] flex items-center justify-center text-[10px] font-bold font-heading">
                      {(profile?.full_name || user?.email || 'S').trim().charAt(0).toUpperCase()}
                    </div>
                  )}
                  <span>Student Dashboard</span>
                </Link>
              ) : (
                <>
                  <Link
                    to="/auth/login"
                    onClick={() => setMobileOpen(false)}
                    className="px-3 py-2.5 text-white/80 hover:text-[#FFC928] font-medium text-sm rounded-lg hover:bg-white/5"
                  >
                    Login
                  </Link>
                  <Link
                    to="/auth/register"
                    onClick={() => setMobileOpen(false)}
                    className="px-3 py-2.5 text-sm font-semibold bg-[#FFC928] text-[#050D2B] rounded-lg text-center hover:bg-[#FFD84D]"
                  >
                    Sign Up Free
                  </Link>
                </>
              )}
            </div>
          </div>
        </div>
      )}
    </header>
  );
}
