import React, { useState, useEffect } from 'react';
import {
  getRegisteredUsers,
  getAdminUsers,
  getStoredAdminUsers,
  createAdminMember,
  changeUserPassword,
  generateSecurePassword,
  PRIMARY_ADMIN_EMAIL,
} from '../../services/auth';
import {
  Users,
  Search,
  ShieldCheck,
  UserPlus,
  KeyRound,
  Copy,
  Check,
  X,
  AlertCircle,
  CheckCircle2,
  Lock,
  Sparkles,
  Shield,
} from 'lucide-react';

export default function AdminUsers() {
  const [activeTab, setActiveTab] = useState('admins'); // 'admins' | 'students'
  const [students, setStudents] = useState([]);
  const [admins, setAdmins] = useState([]);
  const [search, setSearch] = useState('');
  const [loading, setLoading] = useState(true);

  // Add Admin Modal State
  const [addModalOpen, setAddModalOpen] = useState(false);
  const [newAdminName, setNewAdminName] = useState('');
  const [newAdminEmail, setNewAdminEmail] = useState('');
  const [newAdminRole, setNewAdminRole] = useState('admin');
  const [creating, setCreating] = useState(false);
  const [createError, setCreateError] = useState('');
  const [createdResult, setCreatedResult] = useState(null); // { admin, tempPassword }
  const [copied, setCopied] = useState(false);

  // Change Password Modal State
  const [passwordModalOpen, setPasswordModalOpen] = useState(false);
  const [selectedAdmin, setSelectedAdmin] = useState(null);
  const [newPassword, setNewPassword] = useState('');
  const [changingPassword, setChangingPassword] = useState(false);
  const [passwordError, setPasswordError] = useState('');
  const [passwordSuccess, setPasswordSuccess] = useState('');

  async function loadData() {
    setLoading(true);
    try {
      const [studentData, adminData] = await Promise.all([
        getRegisteredUsers(),
        getAdminUsers(),
      ]);
      setStudents(studentData || []);
      setAdmins(adminData || []);
    } catch (err) {
      console.warn('Error loading users:', err);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    loadData();

    const handleSync = () => loadData();
    window.addEventListener('user-registered', handleSync);
    window.addEventListener('admin-users-updated', handleSync);
    window.addEventListener('storage', handleSync);

    return () => {
      window.removeEventListener('user-registered', handleSync);
      window.removeEventListener('admin-users-updated', handleSync);
      window.removeEventListener('storage', handleSync);
    };
  }, []);

  const handleCreateAdmin = async (e) => {
    e.preventDefault();
    setCreateError('');
    setCreating(true);
    try {
      const result = await createAdminMember({
        email: newAdminEmail,
        fullName: newAdminName,
        role: newAdminRole,
      });
      setCreatedResult(result);
      loadData();
    } catch (err) {
      setCreateError(err.message || 'Failed to create administrator.');
    } finally {
      setCreating(false);
    }
  };

  const handleCopyPassword = () => {
    if (createdResult?.tempPassword) {
      navigator.clipboard.writeText(createdResult.tempPassword);
      setCopied(true);
      setTimeout(() => setCopied(false), 3000);
    }
  };

  const handleChangePasswordSubmit = async (e) => {
    e.preventDefault();
    if (!selectedAdmin) return;
    setPasswordError('');
    setPasswordSuccess('');
    setChangingPassword(true);
    try {
      await changeUserPassword(selectedAdmin.user_id || selectedAdmin.id, newPassword);
      setPasswordSuccess('Password successfully updated!');
      setTimeout(() => {
        setPasswordModalOpen(false);
        setPasswordSuccess('');
        setNewPassword('');
      }, 2000);
    } catch (err) {
      setPasswordError(err.message || 'Failed to change password.');
    } finally {
      setChangingPassword(false);
    }
  };

  const filteredAdmins = admins.filter(
    (a) =>
      (a.full_name || '').toLowerCase().includes(search.toLowerCase()) ||
      (a.email || '').toLowerCase().includes(search.toLowerCase())
  );

  const filteredStudents = students.filter(
    (u) =>
      (u.full_name || '').toLowerCase().includes(search.toLowerCase()) ||
      (u.email || '').toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="space-y-6">
      {/* Top Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold font-heading text-navy-deep">User &amp; Access Management</h1>
          <p className="text-sm text-slate-500 mt-1">
            Manage portal administrators with role assignments and view registered students.
          </p>
        </div>

        {activeTab === 'admins' && (
          <button
            type="button"
            onClick={() => {
              setNewAdminName('');
              setNewAdminEmail('');
              setNewAdminRole('admin');
              setCreateError('');
              setCreatedResult(null);
              setCopied(false);
              setAddModalOpen(true);
            }}
            className="inline-flex items-center gap-2 px-4 py-2.5 bg-royal text-white text-xs font-bold rounded-xl hover:bg-navy-dark transition-all shadow-sm"
          >
            <UserPlus className="w-4 h-4" />
            <span>Add Administrator</span>
          </button>
        )}
      </div>

      {/* Tabs Row & Search Input */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 border-b border-slate-200 pb-3">
        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={() => setActiveTab('admins')}
            className={`px-4 py-2 rounded-xl text-xs font-bold transition-all ${
              activeTab === 'admins'
                ? 'bg-royal text-white shadow-xs'
                : 'bg-white text-slate-600 hover:text-slate-900 border border-slate-200'
            }`}
          >
            Administrators ({admins.length})
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('students')}
            className={`px-4 py-2 rounded-xl text-xs font-bold transition-all ${
              activeTab === 'students'
                ? 'bg-royal text-white shadow-xs'
                : 'bg-white text-slate-600 hover:text-slate-900 border border-slate-200'
            }`}
          >
            Registered Students ({students.length})
          </button>
        </div>

        <div className="relative w-full sm:w-72">
          <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            placeholder={`Search ${activeTab === 'admins' ? 'administrators' : 'students'}...`}
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full pl-9 pr-4 py-2 bg-white rounded-xl border border-slate-200 text-xs text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
          />
        </div>
      </div>

      {/* Content Area */}
      {loading ? (
        <div className="bg-white rounded-2xl border border-slate-200 p-8 space-y-4">
          {[...Array(3)].map((_, i) => (
            <div key={i} className="h-10 bg-slate-100 rounded-xl animate-pulse" />
          ))}
        </div>
      ) : activeTab === 'admins' ? (
        // Administrators Tab
        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
          <table className="w-full text-left text-xs">
            <thead className="bg-slate-50 border-b border-slate-200 text-slate-500 font-semibold uppercase tracking-wider">
              <tr>
                <th className="py-3.5 px-4">Administrator</th>
                <th className="py-3.5 px-4">Email Address</th>
                <th className="py-3.5 px-4">Assigned Role</th>
                <th className="py-3.5 px-4">Added Date</th>
                <th className="py-3.5 px-4 text-right">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {filteredAdmins.map((admin) => {
                const isPrimary = admin.email.toLowerCase() === PRIMARY_ADMIN_EMAIL.toLowerCase();

                return (
                  <tr key={admin.id || admin.user_id} className="hover:bg-slate-50/70 transition-colors">
                    <td className="py-3.5 px-4 font-semibold text-slate-900 flex items-center gap-2.5">
                      <div className="w-7 h-7 rounded-lg bg-navy-deep text-gold flex items-center justify-center font-bold text-xs shrink-0">
                        {(admin.full_name || 'A').charAt(0).toUpperCase()}
                      </div>
                      <div>
                        <span>{admin.full_name}</span>
                        {isPrimary && (
                          <span className="block text-[10px] text-amber-600 font-bold">Primary Lead Admin</span>
                        )}
                      </div>
                    </td>
                    <td className="py-3.5 px-4 text-slate-600 font-mono text-[11px]">{admin.email}</td>
                    <td className="py-3.5 px-4">
                      <span
                        className={`px-2.5 py-1 rounded-full text-[10px] font-bold uppercase tracking-wider ${
                          admin.role === 'super_admin'
                            ? 'bg-amber-100 text-amber-800'
                            : admin.role === 'editor'
                            ? 'bg-slate-100 text-slate-700'
                            : 'bg-royal/10 text-royal'
                        }`}
                      >
                        {admin.role ? admin.role.replace('_', ' ') : 'admin'}
                      </span>
                    </td>
                    <td className="py-3.5 px-4 text-slate-500 text-[11px]">
                      {admin.created_at ? new Date(admin.created_at).toLocaleDateString() : 'Active'}
                    </td>
                    <td className="py-3.5 px-4 text-right">
                      <button
                        type="button"
                        onClick={() => {
                          setSelectedAdmin(admin);
                          setNewPassword('');
                          setPasswordError('');
                          setPasswordSuccess('');
                          setPasswordModalOpen(true);
                        }}
                        className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-slate-600 hover:text-royal hover:bg-royal/5 border border-slate-200 text-xs font-semibold transition-colors"
                        title="Change administrator password"
                      >
                        <KeyRound className="w-3.5 h-3.5" />
                        <span>Change Password</span>
                      </button>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      ) : (
        // Students Tab
        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
          {filteredStudents.length === 0 ? (
            <div className="p-12 text-center text-slate-500 text-xs">
              No registered student accounts matching your search query.
            </div>
          ) : (
            <table className="w-full text-left text-xs">
              <thead className="bg-slate-50 border-b border-slate-200 text-slate-500 font-semibold uppercase tracking-wider">
                <tr>
                  <th className="py-3.5 px-4">Student</th>
                  <th className="py-3.5 px-4">Email</th>
                  <th className="py-3.5 px-4">Study Level</th>
                  <th className="py-3.5 px-4">Registered Date</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {filteredStudents.map((u, idx) => (
                  <tr key={idx} className="hover:bg-slate-50/70 transition-colors">
                    <td className="py-3.5 px-4 font-semibold text-slate-900">
                      {u.full_name || 'Anonymous Student'}
                    </td>
                    <td className="py-3.5 px-4 text-slate-600 font-mono text-[11px]">{u.email}</td>
                    <td className="py-3.5 px-4 text-slate-600 capitalize">
                      {u.current_level || u.education_level || 'Undergraduate'}
                    </td>
                    <td className="py-3.5 px-4 text-slate-500 text-[11px]">
                      {u.created_at ? new Date(u.created_at).toLocaleDateString() : 'Recent'}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      )}

      {/* Add Administrator Modal */}
      {addModalOpen && (
        <div className="fixed inset-0 z-50 bg-black/60 backdrop-blur-xs flex items-center justify-center p-4">
          <div className="bg-white rounded-3xl max-w-md w-full shadow-2xl border border-slate-200 overflow-hidden animate-in fade-in zoom-in-95 duration-200">
            <div className="p-5 border-b border-slate-100 flex items-center justify-between">
              <div className="flex items-center gap-2.5">
                <div className="w-8 h-8 rounded-xl bg-royal/10 text-royal flex items-center justify-center">
                  <ShieldCheck className="w-4 h-4" />
                </div>
                <div>
                  <h3 className="font-heading font-bold text-base text-slate-900">
                    Add Administrator
                  </h3>
                  <p className="text-[11px] text-slate-500">
                    Generates a secure password for instant team provisioning.
                  </p>
                </div>
              </div>
              <button
                type="button"
                onClick={() => setAddModalOpen(false)}
                className="p-1 rounded-lg text-slate-400 hover:text-slate-600 hover:bg-slate-50"
              >
                <X className="w-4 h-4" />
              </button>
            </div>

            {createdResult ? (
              // Success Screen with Autogenerated Password
              <div className="p-6 space-y-4">
                <div className="p-4 bg-emerald-50 border border-emerald-200 rounded-2xl flex items-start gap-3">
                  <CheckCircle2 className="w-5 h-5 text-emerald-600 shrink-0 mt-0.5" />
                  <div className="text-xs">
                    <p className="font-bold text-emerald-900">Administrator Created Successfully!</p>
                    <p className="text-emerald-700 mt-0.5">
                      The administrator account for <strong>{createdResult.admin.email}</strong> is ready.
                    </p>
                  </div>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                    System Autogenerated Password:
                  </label>
                  <div className="flex items-center gap-2">
                    <div className="flex-1 px-4 py-2.5 bg-slate-100 rounded-xl font-mono text-sm font-bold text-slate-900 border border-slate-200 tracking-wider">
                      {createdResult.tempPassword}
                    </div>
                    <button
                      type="button"
                      onClick={handleCopyPassword}
                      className="px-4 py-2.5 bg-royal text-white rounded-xl text-xs font-bold hover:bg-navy-dark transition-colors inline-flex items-center gap-1.5 shadow-xs"
                    >
                      {copied ? <Check className="w-4 h-4 text-gold" /> : <Copy className="w-4 h-4" />}
                      <span>{copied ? 'Copied!' : 'Copy'}</span>
                    </button>
                  </div>
                  <p className="text-[11px] text-slate-500 mt-2 leading-relaxed">
                    Please share these credentials securely with the administrator. They can sign in at <strong>/auth/login</strong> and update their password at any time.
                  </p>
                </div>

                <div className="pt-2 flex justify-end">
                  <button
                    type="button"
                    onClick={() => setAddModalOpen(false)}
                    className="px-5 py-2.5 bg-slate-900 text-white rounded-xl text-xs font-bold hover:bg-black transition-colors"
                  >
                    Done
                  </button>
                </div>
              </div>
            ) : (
              // Create Admin Form
              <form onSubmit={handleCreateAdmin} className="p-6 space-y-4">
                {createError && (
                  <div className="p-3 bg-rose-50 border border-rose-200 rounded-xl text-xs text-rose-700 flex items-center gap-2">
                    <AlertCircle className="w-4 h-4 shrink-0" />
                    <span>{createError}</span>
                  </div>
                )}

                <div>
                  <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1">
                    Full Legal Name
                  </label>
                  <input
                    type="text"
                    required
                    value={newAdminName}
                    onChange={(e) => setNewAdminName(e.target.value)}
                    placeholder="e.g. Ama Osei"
                    className="w-full px-3.5 py-2 bg-slate-50 border border-slate-200 rounded-xl text-xs text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1">
                    Email Address
                  </label>
                  <input
                    type="email"
                    required
                    value={newAdminEmail}
                    onChange={(e) => setNewAdminEmail(e.target.value)}
                    placeholder="e.g. aosei@ghanascholarships.gov.gh"
                    className="w-full px-3.5 py-2 bg-slate-50 border border-slate-200 rounded-xl text-xs text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1">
                    Role &amp; Permissions
                  </label>
                  <select
                    value={newAdminRole}
                    onChange={(e) => setNewAdminRole(e.target.value)}
                    className="w-full px-3.5 py-2 bg-slate-50 border border-slate-200 rounded-xl text-xs text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal"
                  >
                    <option value="admin">Administrator (Full scholarship &amp; import access)</option>
                    <option value="super_admin">Super Administrator (Full system privileges)</option>
                    <option value="editor">Editor (Scholarship content creation and review)</option>
                  </select>
                </div>

                <div className="p-3 bg-blue-50/70 border border-blue-100 rounded-xl text-[11px] text-blue-800 flex items-start gap-2">
                  <Sparkles className="w-4 h-4 text-royal shrink-0 mt-0.5" />
                  <span>
                    A secure 12-character password will be autogenerated automatically upon submission.
                  </span>
                </div>

                <div className="pt-2 flex items-center justify-end gap-2.5">
                  <button
                    type="button"
                    onClick={() => setAddModalOpen(false)}
                    className="px-4 py-2 border border-slate-200 text-xs font-semibold text-slate-700 rounded-xl hover:bg-slate-50"
                  >
                    Cancel
                  </button>
                  <button
                    type="submit"
                    disabled={creating}
                    className="px-5 py-2 bg-royal text-white text-xs font-bold rounded-xl hover:bg-navy-dark transition-colors shadow-xs"
                  >
                    {creating ? 'Provisioning...' : 'Create &amp; Generate Password'}
                  </button>
                </div>
              </form>
            )}
          </div>
        </div>
      )}

      {/* Change Password Modal */}
      {passwordModalOpen && selectedAdmin && (
        <div className="fixed inset-0 z-50 bg-black/60 backdrop-blur-xs flex items-center justify-center p-4">
          <div className="bg-white rounded-3xl max-w-md w-full shadow-2xl border border-slate-200 overflow-hidden animate-in fade-in zoom-in-95 duration-200">
            <div className="p-5 border-b border-slate-100 flex items-center justify-between">
              <div className="flex items-center gap-2.5">
                <div className="w-8 h-8 rounded-xl bg-amber-50 text-amber-700 flex items-center justify-center">
                  <Lock className="w-4 h-4" />
                </div>
                <div>
                  <h3 className="font-heading font-bold text-base text-slate-900">
                    Change Password
                  </h3>
                  <p className="text-[11px] text-slate-500">
                    Updating credentials for {selectedAdmin.email}
                  </p>
                </div>
              </div>
              <button
                type="button"
                onClick={() => setPasswordModalOpen(false)}
                className="p-1 rounded-lg text-slate-400 hover:text-slate-600 hover:bg-slate-50"
              >
                <X className="w-4 h-4" />
              </button>
            </div>

            <form onSubmit={handleChangePasswordSubmit} className="p-6 space-y-4">
              {passwordSuccess && (
                <div className="p-3 bg-emerald-50 border border-emerald-200 rounded-xl text-xs text-emerald-700 flex items-center gap-2">
                  <CheckCircle2 className="w-4 h-4 shrink-0" />
                  <span>{passwordSuccess}</span>
                </div>
              )}

              {passwordError && (
                <div className="p-3 bg-rose-50 border border-rose-200 rounded-xl text-xs text-rose-700 flex items-center gap-2">
                  <AlertCircle className="w-4 h-4 shrink-0" />
                  <span>{passwordError}</span>
                </div>
              )}

              <div>
                <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1">
                  New Password
                </label>
                <div className="flex items-center gap-2">
                  <input
                    type="text"
                    required
                    value={newPassword}
                    onChange={(e) => setNewPassword(e.target.value)}
                    placeholder="Enter or generate password"
                    className="flex-1 px-3.5 py-2 bg-slate-50 border border-slate-200 rounded-xl text-xs text-slate-900 focus:outline-none focus:ring-2 focus:ring-royal/20 focus:border-royal font-mono"
                  />
                  <button
                    type="button"
                    onClick={() => setNewPassword(generateSecurePassword(12))}
                    className="px-3 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl text-xs font-semibold transition-colors shrink-0"
                    title="Generate Random Password"
                  >
                    Generate
                  </button>
                </div>
                <p className="text-[11px] text-slate-400 mt-1">Must be at least 6 characters in length.</p>
              </div>

              <div className="pt-2 flex items-center justify-end gap-2.5">
                <button
                  type="button"
                  onClick={() => setPasswordModalOpen(false)}
                  className="px-4 py-2 border border-slate-200 text-xs font-semibold text-slate-700 rounded-xl hover:bg-slate-50"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  disabled={changingPassword || !newPassword}
                  className="px-5 py-2 bg-royal text-white text-xs font-bold rounded-xl hover:bg-navy-dark transition-colors shadow-xs"
                >
                  {changingPassword ? 'Updating...' : 'Update Password'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}

export { AdminUsers };
