import React, { useState, useEffect } from 'react';
import { getAllScholarships } from '../../services/scholarships';
import { BookOpen, Layers, Search, Filter } from 'lucide-react';

export default function AdminCategories() {
  const [categories, setCategories] = useState([]);
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(true);

  const defaultFields = [
    { name: 'General / All Disciplines', icon: '🎓', description: 'Open to all academic backgrounds and study programs.' },
    { name: 'Engineering & Technology', icon: '⚙️', description: 'Computer Science, Mechanical, Civil, Electrical, Software, AI.' },
    { name: 'Medicine & Health Sciences', icon: '🩺', description: 'Nursing, Pharmacy, Public Health, Surgery, Biomedical.' },
    { name: 'Agriculture & Food Science', icon: '🌱', description: 'Agribusiness, Crop Science, Animal Science, Food Technology.' },
    { name: 'Business & Economics', icon: '📊', description: 'Accounting, Finance, Marketing, Management, Supply Chain.' },
    { name: 'Law & Legal Studies', icon: '⚖️', description: 'Jurisprudence, Commercial Law, Human Rights, International Law.' },
    { name: 'Education & Teaching', icon: '📚', description: 'Early Childhood, Secondary Education, Special Needs, STEM Pedagogy.' },
    { name: 'Science & Mathematics', icon: '🔬', description: 'Physics, Chemistry, Biology, Pure & Applied Mathematics, Statistics.' },
    { name: 'Arts & Humanities', icon: '🎨', description: 'Literature, History, Philosophy, Linguistics, Performing Arts.' },
    { name: 'Social Sciences', icon: '🌍', description: 'Sociology, Psychology, Political Science, International Relations.' },
    { name: 'Architecture & Built Environment', icon: '🏛️', description: 'Urban Planning, Quantity Surveying, Construction Management.' },
    { name: 'Environmental Studies & Renewable Energy', icon: '♻️', description: 'Climate Science, Forestry, Sustainability, Clean Tech.' },
  ];

  useEffect(() => {
    async function countPerCategory() {
      setLoading(true);
      try {
        const scholarships = await getAllScholarships();
        const mapped = defaultFields.map((field) => {
          const count = scholarships.filter((s) => {
            const list = Array.isArray(s.fields_of_study) ? s.fields_of_study : [s.fields_of_study || ''];
            return list.some((f) =>
              String(f).toLowerCase().includes(field.name.toLowerCase().split(' ')[0]) ||
              String(f).toLowerCase() === 'all' ||
              String(f).toLowerCase() === 'all fields'
            );
          }).length;
          return { ...field, count };
        });
        setCategories(mapped);
      } catch (err) {
        console.error('Error counting category scholarships:', err);
      } finally {
        setLoading(false);
      }
    }
    countPerCategory();
  }, []);

  const filtered = categories.filter((c) =>
    c.name.toLowerCase().includes(search.toLowerCase()) ||
    c.description.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold font-heading text-navy-deep">Fields & Disciplines</h1>
          <p className="text-sm text-slate-500 mt-1">
            Standard taxonomy applied across all scholarship search and filtering algorithms.
          </p>
        </div>
      </div>

      {/* Search Bar */}
      <div className="relative max-w-md">
        <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
        <input
          type="text"
          placeholder="Filter disciplines..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full pl-9 pr-4 py-2 bg-white rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
        />
      </div>

      {/* Grid of Categories */}
      {loading ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {[...Array(6)].map((_, i) => (
            <div key={i} className="h-32 bg-slate-100 rounded-xl animate-pulse"></div>
          ))}
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
          {filtered.map((cat, idx) => (
            <div
              key={idx}
              className="bg-white p-5 rounded-xl border border-slate-200/80 shadow-sm hover:border-royal/40 transition-all flex flex-col justify-between"
            >
              <div>
                <div className="flex items-center justify-between mb-3">
                  <span className="text-2xl">{cat.icon}</span>
                  <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-slate-100 text-slate-700">
                    {cat.count} listings
                  </span>
                </div>
                <h3 className="font-bold text-navy-deep text-base mb-1">{cat.name}</h3>
                <p className="text-xs text-slate-500 leading-relaxed">{cat.description}</p>
              </div>

              <div className="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between text-xs text-slate-400">
                <span>System standard</span>
                <span className="text-royal font-medium hover:underline cursor-pointer">View scholarships →</span>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

export { AdminCategories };
