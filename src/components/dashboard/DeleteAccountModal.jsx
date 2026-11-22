import React, { useState } from 'react';
import { AlertTriangle, Trash2, X, Loader2 } from 'lucide-react';

/**
 * DeleteAccountModal
 * Confirmation dialog requiring explicit confirmation before irreversible account destruction.
 */
export function DeleteAccountModal({ isOpen, onClose, onConfirm, isDeleting, userEmail }) {
  const [confirmText, setConfirmText] = useState('');
  const [errorMsg, setErrorMsg] = useState('');

  if (!isOpen) return null;

  const isConfirmed = confirmText.trim().toUpperCase() === 'DELETE';

  const handleDelete = async (e) => {
    e.preventDefault();
    if (!isConfirmed) return;
    setErrorMsg('');
    try {
      await onConfirm();
    } catch (err) {
      setErrorMsg(err.message || 'Failed to delete account. Please try again or contact support.');
    }
  };

  return (
    <div className="fixed inset-0 z-50 overflow-y-auto bg-black/60 backdrop-blur-xs flex items-center justify-center p-4">
      <div
        className="bg-white rounded-3xl max-w-md w-full shadow-2xl border border-red-100 overflow-hidden animate-in fade-in zoom-in-95 duration-200"
        role="dialog"
        aria-modal="true"
      >
        {/* Header Alert */}
        <div className="p-6 pb-4 bg-rose-50/70 border-b border-rose-100 flex items-start gap-3.5">
          <div className="w-10 h-10 rounded-2xl bg-rose-100 text-rose-600 flex items-center justify-center shrink-0">
            <AlertTriangle className="w-5 h-5" />
          </div>
          <div className="flex-1 min-w-0">
            <h3 className="font-heading font-extrabold text-lg text-slate-900 leading-tight">
              Delete Account Permanently
            </h3>
            <p className="text-xs text-rose-800 font-medium mt-1">
              This action is immediate and completely irreversible.
            </p>
          </div>
          <button
            type="button"
            onClick={onClose}
            disabled={isDeleting}
            className="p-1 rounded-lg text-slate-400 hover:text-slate-600 hover:bg-white/50 transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Form Body */}
        <form onSubmit={handleDelete} className="p-6 space-y-4">
          <div className="text-xs text-slate-600 leading-relaxed space-y-2">
            <p>
              You are about to delete the account for <strong className="text-slate-900">{userEmail}</strong>.
            </p>
            <p>
              Deleting your account will permanently remove:
            </p>
            <ul className="list-disc pl-5 space-y-1 text-slate-700">
              <li>All saved scholarship bookmarks</li>
              <li>Your complete application tracker history and milestone timeline</li>
              <li>Your academic and eligibility profile details</li>
              <li>Your uploaded profile photo from storage</li>
            </ul>
          </div>

          {errorMsg && (
            <div className="p-3 bg-red-50 border border-red-200 rounded-xl text-xs text-red-700">
              {errorMsg}
            </div>
          )}

          <div>
            <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
              Type <strong className="text-rose-600">DELETE</strong> to confirm:
            </label>
            <input
              type="text"
              value={confirmText}
              onChange={(e) => setConfirmText(e.target.value)}
              placeholder="DELETE"
              disabled={isDeleting}
              autoFocus
              className="w-full px-3.5 py-2.5 bg-slate-50 border border-slate-300 rounded-xl text-sm font-semibold tracking-wider text-slate-900 focus:outline-none focus:ring-2 focus:ring-rose-500/30 focus:border-rose-500"
            />
          </div>

          <div className="pt-2 flex items-center justify-end gap-3">
            <button
              type="button"
              onClick={onClose}
              disabled={isDeleting}
              className="px-4 py-2.5 rounded-xl border border-slate-200 text-xs font-semibold text-slate-700 hover:bg-slate-50 transition-colors"
            >
              Cancel
            </button>
            <button
              type="submit"
              disabled={!isConfirmed || isDeleting}
              className={`px-5 py-2.5 rounded-xl text-xs font-bold text-white transition-all inline-flex items-center gap-2 ${
                isConfirmed && !isDeleting
                  ? 'bg-rose-600 hover:bg-rose-700 shadow-md shadow-rose-600/20 cursor-pointer'
                  : 'bg-slate-300 text-slate-500 cursor-not-allowed'
              }`}
            >
              {isDeleting ? (
                <>
                  <Loader2 className="w-4 h-4 animate-spin" />
                  <span>Deleting Account...</span>
                </>
              ) : (
                <>
                  <Trash2 className="w-4 h-4" />
                  <span>Permanently Delete</span>
                </>
              )}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
