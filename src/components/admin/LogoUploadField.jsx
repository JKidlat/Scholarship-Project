/**
 * @file LogoUploadField.jsx
 * @description Provider logo upload, replacement, and preview interface.
 *
 * Capabilities:
 * - Drag-and-drop or file picker for PNG, JPEG, WebP, SVG logos
 * - Instant in-browser preview with live dimensions
 * - One-click logo removal (setting logo_url to null)
 * - Directly integrates with Supabase Storage via storage.js
 */

import React, { useState, useRef } from 'react';
import {
  UploadCloud,
  Image as ImageIcon,
  Trash2,
  RefreshCw,
  CheckCircle2,
  AlertCircle,
  Eye,
  Info,
} from 'lucide-react';
import { uploadScholarshipLogo, deleteScholarshipLogo, validateLogoFile, ALLOWED_MIME_TYPES } from '../../services/storage';

export function LogoUploadField({
  logoUrl,
  storagePath,
  onChange,
  providerName = 'Provider',
  scholarshipId = null,
}) {
  const [uploading, setUploading] = useState(false);
  const [dragActive, setDragActive] = useState(false);
  const [error, setError] = useState(null);
  const [successMsg, setSuccessMsg] = useState(null);
  const fileInputRef = useRef(null);

  async function handleFileProcess(file) {
    if (!file) return;

    const validation = validateLogoFile(file);
    if (!validation.valid) {
      setError(validation.error);
      return;
    }

    setError(null);
    setUploading(true);

    try {
      const result = await uploadScholarshipLogo(file, storagePath, scholarshipId, providerName);
      onChange({
        logo_url: result.url,
        logo_storage_path: result.storagePath,
        logo_alt_text: `${providerName} official logo`,
      });
      setSuccessMsg('Logo uploaded to Supabase Storage successfully!');
      setTimeout(() => setSuccessMsg(null), 4000);
    } catch (err) {
      setError(err.message || 'Failed to upload logo image.');
    } finally {
      setUploading(false);
    }
  }

  function handleDrag(e) {
    e.preventDefault();
    e.stopPropagation();
    if (e.type === 'dragenter' || e.type === 'dragover') {
      setDragActive(true);
    } else if (e.type === 'dragleave') {
      setDragActive(false);
    }
  }

  function handleDrop(e) {
    e.preventDefault();
    e.stopPropagation();
    setDragActive(false);
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      handleFileProcess(e.dataTransfer.files[0]);
    }
  }

  function handleInputChange(e) {
    if (e.target.files && e.target.files[0]) {
      handleFileProcess(e.target.files[0]);
    }
  }

  async function handleRemove() {
    if (window.confirm('Remove this scholarship logo? The default initials placeholder will be displayed.')) {
      if (storagePath) {
        deleteScholarshipLogo(storagePath, scholarshipId).catch(() => {});
      }
      onChange({
        logo_url: null,
        logo_storage_path: null,
        logo_alt_text: null,
      });
      setSuccessMsg('Logo removed.');
      setTimeout(() => setSuccessMsg(null), 2500);
    }
  }

  return (
    <div className="space-y-4">
      <div className="border-b pb-2 flex items-center justify-between">
        <div>
          <h2 className="text-sm font-bold text-navy-deep uppercase tracking-wider flex items-center gap-2">
            <ImageIcon className="w-4 h-4 text-royal" />
            Scholarship Logo / Provider Image
          </h2>
          <p className="text-xs text-slate-500 mt-0.5">
            Supports circular, square, rectangular, wide horizontal, and transparent PNG logos.
          </p>
        </div>
        {logoUrl && (
          <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-emerald-100 text-emerald-800 flex items-center gap-1">
            <CheckCircle2 className="w-3 h-3" />
            Logo Active
          </span>
        )}
      </div>

      {error && (
        <div className="p-3 bg-rose-50 border border-rose-200 rounded-lg flex items-center gap-2 text-rose-800 text-xs">
          <AlertCircle className="w-4 h-4 flex-shrink-0 text-rose-500" />
          <span>{error}</span>
        </div>
      )}

      {successMsg && (
        <div className="p-3 bg-emerald-50 border border-emerald-200 rounded-lg flex items-center gap-2 text-emerald-800 text-xs">
          <CheckCircle2 className="w-4 h-4 flex-shrink-0 text-emerald-600" />
          <span>{successMsg}</span>
        </div>
      )}

      {logoUrl ? (
        /* Active Logo Preview & Controls */
        <div className="bg-slate-50/80 rounded-xl border border-slate-200 p-5 space-y-4">
          <div className="flex flex-col sm:flex-row items-center gap-6">
            {/* Real-time Card Simulator Container */}
            <div className="space-y-1.5 text-center sm:text-left">
              <span className="text-[11px] font-bold text-slate-400 uppercase tracking-wider block">
                Public Card Display Preview
              </span>
              <div className="w-20 h-16 rounded-xl border border-slate-200/90 bg-white p-1.5 flex items-center justify-center shadow-xs overflow-hidden">
                <img
                  src={logoUrl}
                  alt={providerName}
                  className="max-w-full max-h-full object-contain"
                />
              </div>
            </div>

            {/* Large Detail Simulator Container */}
            <div className="space-y-1.5 text-center sm:text-left">
              <span className="text-[11px] font-bold text-slate-400 uppercase tracking-wider block">
                Detail Page Banner Preview
              </span>
              <div className="w-32 h-16 rounded-xl border border-slate-200/90 bg-white p-2 flex items-center justify-center shadow-xs overflow-hidden">
                <img
                  src={logoUrl}
                  alt={providerName}
                  className="max-w-full max-h-full object-contain"
                />
              </div>
            </div>

            {/* Actions */}
            <div className="flex-1 flex flex-wrap items-center justify-end gap-2.5 pt-2 sm:pt-0">
              <button
                type="button"
                onClick={() => fileInputRef.current?.click()}
                disabled={uploading}
                className="px-3.5 py-2 text-xs font-semibold rounded-lg bg-white border border-slate-200 text-slate-700 hover:bg-slate-100 hover:text-navy-deep transition-all flex items-center gap-1.5 shadow-2xs"
              >
                <RefreshCw className={`w-3.5 h-3.5 ${uploading ? 'animate-spin' : ''}`} />
                <span>{uploading ? 'Uploading...' : 'Replace Logo'}</span>
              </button>

              <button
                type="button"
                onClick={handleRemove}
                disabled={uploading}
                className="px-3.5 py-2 text-xs font-semibold rounded-lg bg-rose-50 border border-rose-200 text-rose-700 hover:bg-rose-100 transition-all flex items-center gap-1.5"
              >
                <Trash2 className="w-3.5 h-3.5" />
                <span>Remove Logo</span>
              </button>
            </div>
          </div>

          <div className="text-[11px] text-slate-500 bg-white/80 p-2.5 rounded-lg border border-slate-100 flex items-center gap-2">
            <Info className="w-3.5 h-3.5 text-royal shrink-0" />
            <span>
              Configured with <code className="bg-slate-100 px-1 py-0.5 rounded font-mono text-[10px]">object-fit: contain</code> on a neutral background to display circular, rectangular, and wide logos without distortion.
            </span>
          </div>
        </div>
      ) : (
        /* Drag & Drop Upload Zone */
        <div
          onDragEnter={handleDrag}
          onDragLeave={handleDrag}
          onDragOver={handleDrag}
          onDrop={handleDrop}
          onClick={() => fileInputRef.current?.click()}
          className={`border-2 border-dashed rounded-xl p-6 text-center cursor-pointer transition-all ${
            dragActive
              ? 'border-royal bg-royal/5'
              : 'border-slate-300 hover:border-royal/50 hover:bg-slate-50/60'
          }`}
        >
          <div className="w-12 h-12 rounded-xl bg-royal/10 text-royal flex items-center justify-center mx-auto mb-3">
            <UploadCloud className="w-6 h-6" />
          </div>

          <div className="space-y-1">
            <p className="text-sm font-semibold text-navy-deep">
              {uploading ? 'Uploading and optimizing...' : 'Click or drag provider logo here'}
            </p>
            <p className="text-xs text-slate-500">
              Supports PNG, JPG, JPEG, WebP, or SVG (Max 5 MB)
            </p>
          </div>

          <div className="mt-3 flex items-center justify-center gap-2 text-[11px] text-slate-400">
            <span>• Circular & Square</span>
            <span>• Wide Horizontal</span>
            <span>• Transparent PNG</span>
          </div>
        </div>
      )}

      {/* Hidden File Input */}
      <input
        ref={fileInputRef}
        type="file"
        accept={ALLOWED_MIME_TYPES.join(',')}
        onChange={handleInputChange}
        className="hidden"
      />
    </div>
  );
}

export default LogoUploadField;
