import React, { useState, useEffect } from 'react';
import { Button } from '../../components/common/Button';
import { Save, CheckCircle2, Shield, Settings2, Database, Bell } from 'lucide-react';

const SETTINGS_KEY = 'ghana_portal_settings';

export default function AdminSettings() {
  const [settings, setSettings] = useState({
    siteName: 'ScholarGhana',
    tagline: 'Empowering Ghanaian Students with Verified Scholarships',
    contactEmail: 'contact@scholarghana.org',
    supportPhone: '+233 30 200 0000',
    maintenanceMode: false,
    autoVerifyWhitelisted: true,
    notifyOnNewSubmission: true,
  });

  const [saved, setSaved] = useState(false);

  useEffect(() => {
    try {
      const stored = localStorage.getItem(SETTINGS_KEY);
      if (stored) {
        setSettings(JSON.parse(stored));
      }
    } catch (e) {
      // use defaults
    }
  }, []);

  function handleChange(e) {
    const { name, value, type, checked } = e.target;
    setSettings((prev) => ({
      ...prev,
      [name]: type === 'checkbox' ? checked : value,
    }));
  }

  function handleSave(e) {
    e.preventDefault();
    localStorage.setItem(SETTINGS_KEY, JSON.stringify(settings));
    setSaved(true);
    setTimeout(() => setSaved(false), 3000);
  }

  return (
    <div className="max-w-3xl space-y-6">
      <div>
        <h1 className="text-2xl font-bold font-heading text-navy-deep">Platform Settings</h1>
        <p className="text-sm text-slate-500 mt-1">Configure site details, contact points, and automation preferences.</p>
      </div>

      {saved && (
        <div className="p-4 bg-emerald-50 border border-emerald-200 rounded-xl flex items-center gap-3 text-emerald-800 text-sm">
          <CheckCircle2 className="w-5 h-5 text-emerald-600 flex-shrink-0" />
          <span>Settings saved successfully!</span>
        </div>
      )}

      <form onSubmit={handleSave} className="bg-white rounded-xl border border-slate-200/80 p-6 md:p-8 space-y-8 shadow-sm">
        {/* Brand identity */}
        <div className="space-y-4">
          <h2 className="text-base font-bold text-navy-deep border-b pb-2 flex items-center gap-2">
            <Settings2 className="w-4 h-4 text-royal" />
            General Information
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Site Name
              </label>
              <input
                type="text"
                name="siteName"
                value={settings.siteName}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
              />
            </div>
            <div>
              <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                Contact Email
              </label>
              <input
                type="email"
                name="contactEmail"
                value={settings.contactEmail}
                onChange={handleChange}
                className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
              />
            </div>
          </div>

          <div>
            <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
              Portal Tagline
            </label>
            <input
              type="text"
              name="tagline"
              value={settings.tagline}
              onChange={handleChange}
              className="w-full px-4 py-2.5 rounded-lg border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
            />
          </div>
        </div>

        {/* System & Maintenance */}
        <div className="space-y-4">
          <h2 className="text-base font-bold text-navy-deep border-b pb-2 flex items-center gap-2">
            <Shield className="w-4 h-4 text-royal" />
            System Controls & Quality
          </h2>

          <div className="space-y-3">
            <label className="flex items-start gap-3 p-3 bg-slate-50 rounded-lg cursor-pointer">
              <input
                type="checkbox"
                name="maintenanceMode"
                checked={settings.maintenanceMode}
                onChange={handleChange}
                className="w-4 h-4 text-royal rounded border-slate-300 focus:ring-royal mt-0.5"
              />
              <div>
                <span className="text-sm font-semibold text-navy-deep block">Maintenance Mode</span>
                <span className="text-xs text-slate-500">
                  Temporarily display a maintenance notice for non-admin visitors.
                </span>
              </div>
            </label>

            <label className="flex items-start gap-3 p-3 bg-slate-50 rounded-lg cursor-pointer">
              <input
                type="checkbox"
                name="autoVerifyWhitelisted"
                checked={settings.autoVerifyWhitelisted}
                onChange={handleChange}
                className="w-4 h-4 text-royal rounded border-slate-300 focus:ring-royal mt-0.5"
              />
              <div>
                <span className="text-sm font-semibold text-navy-deep block">Automatic Whitelist Verification</span>
                <span className="text-xs text-slate-500">
                  Automatically mark opportunities from recognized public universities (UG, KNUST, UCC) as verified upon import.
                </span>
              </div>
            </label>
          </div>
        </div>

        <div className="pt-4 border-t flex justify-end">
          <Button type="submit" variant="primary" className="flex items-center gap-2">
            <Save className="w-4 h-4" />
            Save Preferences
          </Button>
        </div>
      </form>
    </div>
  );
}

export { AdminSettings };
