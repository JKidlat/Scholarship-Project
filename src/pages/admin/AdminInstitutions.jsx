import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { getAllScholarships } from '../../services/scholarships';
import { Building2, Search, ExternalLink, GraduationCap } from 'lucide-react';

export default function AdminInstitutions() {
  const [institutions, setInstitutions] = useState([]);
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadInstitutions() {
      setLoading(true);
      try {
        const scholarships = await getAllScholarships();
        const map = {};

        scholarships.forEach((s) => {
          const instName = s.institution || (typeof s.institution === 'object' ? s.institution?.name : null) || 'General / Non-Specific';
          if (!map[instName]) {
            map[instName] = {
              name: instName,
              count: 0,
              openCount: 0,
              category: s.institution_category || (s.is_public_institution ? 'Public Institution' : 'Partner Body'),
              isPublic: s.is_public_institution,
            };
          }
          map[instName].count += 1;
          if (s.application_status === 'open' || s.status === 'open') {
            map[instName].openCount += 1;
          }
        });

        const list = Object.values(map).sort((a, b) => b.count - a.count);
        setInstitutions(list);
      } catch (err) {
        console.error('Error loading institutions:', err);
      } finally {
        setLoading(false);
      }
    }
    loadInstitutions();
  }, []);

  const filtered = institutions.filter((inst) =>
    inst.name.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold font-heading text-navy-deep">Institutions & Providers</h1>
          <p className="text-sm text-slate-500 mt-1">
            Universities, government agencies, corporate foundations, and NGO partners.
          </p>
        </div>
        <div className="text-sm text-slate-500 bg-white px-3.5 py-1.5 rounded-lg border border-slate-200">
          Total Organizations: <span className="font-bold text-navy-deep">{institutions.length}</span>
        </div>
      </div>

      {/* Search Bar */}
      <div className="relative max-w-md">
        <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
        <input
          type="text"
          placeholder="Search institution or provider..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full pl-9 pr-4 py-2 bg-white rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
        />
      </div>

      {/* Table */}
      <div className="bg-white rounded-xl border border-slate-200/80 shadow-sm overflow-hidden">
        {loading ? (
          <div className="p-8 space-y-4">
            {[...Array(5)].map((_, i) => (
              <div key={i} className="h-10 bg-slate-100 rounded animate-pulse"></div>
            ))}
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left text-sm">
              <thead className="bg-slate-50/75 border-b border-slate-200 text-slate-500 font-medium text-xs uppercase tracking-wider">
                <tr>
                  <th className="py-3 px-4">Institution / Provider Name</th>
                  <th className="py-3 px-4">Classification</th>
                  <th className="py-3 px-4 text-center">Open Opportunities</th>
                  <th className="py-3 px-4 text-center">Total Listings</th>
                  <th className="py-3 px-4 text-right">Directory Link</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {filtered.map((inst, idx) => (
                  <tr key={idx} className="hover:bg-slate-50/60 transition-colors">
                    <td className="py-3 px-4">
                      <div className="flex items-center gap-2.5">
                        <div className="w-8 h-8 rounded-lg bg-royal/10 text-royal flex items-center justify-center font-bold text-xs flex-shrink-0">
                          {inst.name.charAt(0)}
                        </div>
                        <span className="font-medium text-navy-deep">{inst.name}</span>
                      </div>
                    </td>
                    <td className="py-3 px-4 text-slate-600">
                      <span className="text-xs bg-slate-100 px-2 py-0.5 rounded text-slate-700 capitalize">
                        {String(inst.category || 'General').replace(/_/g, ' ')}
                      </span>
                    </td>
                    <td className="py-3 px-4 text-center">
                      <span className={`inline-block px-2 py-0.5 rounded-full text-xs font-semibold ${
                        inst.openCount > 0 ? 'bg-emerald-100 text-emerald-800' : 'bg-slate-100 text-slate-500'
                      }`}>
                        {inst.openCount}
                      </span>
                    </td>
                    <td className="py-3 px-4 text-center font-bold text-navy-deep">
                      {inst.count}
                    </td>
                    <td className="py-3 px-4 text-right">
                      <Link
                        to={`/scholarships?q=${encodeURIComponent(inst.name)}`}
                        className="text-royal hover:text-royal/80 inline-flex items-center gap-1 text-xs font-medium"
                      >
                        Explore <ExternalLink className="w-3 h-3" />
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  );
}

export { AdminInstitutions };
