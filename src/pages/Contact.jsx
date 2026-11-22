/**
 * @file Contact.jsx
 * @description Official contact and listing submission page for the Ghana Scholarship Portal.
 * Provides direct channels for students, university administrators, and scholarship donors.
 *
 * Includes:
 * - Direct contact details (Email, Headquarters, Operating Hours)
 * - Academic advising photo showcase (/images/contact/advising_helpdesk.jpg)
 * - Structured inquiry submission form with subject taxonomy
 */

import React, { useState } from 'react';
import { Mail, MapPin, Send, CheckCircle2, Clock, ShieldCheck, Sparkles, Building2 } from 'lucide-react';

export default function ContactPage() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    subject: 'general',
    message: '',
  });

  const [status, setStatus] = useState('idle');

  const handleSubmit = (e) => {
    e.preventDefault();
    setStatus('loading');
    setTimeout(() => {
      setStatus('success');
      setFormData({ name: '', email: '', subject: 'general', message: '' });
    }, 800);
  };

  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-20 pb-20">
      {/* Header Banner */}
      <div className="bg-[#050D2B] text-white py-14 mb-12 border-b border-white/10">
        <div className="site-container text-center max-w-2xl mx-auto">
          <h1 className="font-heading font-black text-3xl sm:text-4xl text-white mb-3 tracking-tight">
            Contact Our Administrative Team
          </h1>
          <p className="text-white/70 text-sm md:text-base leading-relaxed">
            Have a question about a scholarship entry, want to submit a new funding scheme,
            or report an updated deadline? Send us a message.
          </p>
        </div>
      </div>

      <div className="site-container max-w-5xl">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
          {/* LEFT SIDEBAR: Institutional Information & Photographic Anchor */}
          <div className="lg:col-span-5 space-y-6">
            {/* Photographic Card */}
            <div className="rounded-3xl overflow-hidden border border-[#E4E7EC] shadow-sm relative bg-slate-900">
              <img
                src="/images/contact/advising_helpdesk.jpg"
                alt="Ghana scholarship directory academic advisor consultation"
                width="600"
                height="320"
                loading="lazy"
                className="w-full h-52 object-cover filter brightness-[0.9]"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-[#050D2B] via-transparent to-transparent opacity-85" />
              <div className="absolute bottom-4 left-4 right-4 text-white">
                <span className="text-[10px] font-bold uppercase tracking-wider text-[#FFC928] block">
                  Student Services Desk
                </span>
                <p className="text-xs text-white/80 mt-0.5">
                  Supporting Ghanaian learners in securing verified higher education aid.
                </p>
              </div>
            </div>

            {/* Direct Channel Details */}
            <div className="bg-[#0B1740] rounded-3xl p-6 sm:p-7 text-white space-y-5 border border-white/10 shadow-sm">
              <h2 className="font-heading font-bold text-lg text-[#FFC928]">
                Direct Contact Channels
              </h2>

              <div className="space-y-4 text-xs sm:text-sm">
                <div className="flex items-start gap-3">
                  <Mail className="w-5 h-5 text-[#FFC928] mt-0.5 shrink-0" />
                  <div>
                    <span className="block text-white/50 text-[11px] uppercase tracking-wider">
                      Official Inquiries
                    </span>
                    <a
                      href="mailto:contact@ghanascholarship.org"
                      className="text-white font-medium hover:text-[#FFC928] transition-colors"
                    >
                      contact@ghanascholarship.org
                    </a>
                  </div>
                </div>

                <div className="flex items-start gap-3">
                  <MapPin className="w-5 h-5 text-[#FFC928] mt-0.5 shrink-0" />
                  <div>
                    <span className="block text-white/50 text-[11px] uppercase tracking-wider">
                      Directory Operations
                    </span>
                    <span className="text-white font-medium">
                      Accra, Greater Accra Region, Ghana
                    </span>
                  </div>
                </div>

                <div className="flex items-start gap-3">
                  <Clock className="w-5 h-5 text-[#FFC928] mt-0.5 shrink-0" />
                  <div>
                    <span className="block text-white/50 text-[11px] uppercase tracking-wider">
                      Response Window
                    </span>
                    <span className="text-white font-medium">
                      Monday – Friday: 8:30 AM – 5:00 PM GMT
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* RIGHT COLUMN: Contact Form */}
          <div className="lg:col-span-7 bg-white rounded-3xl p-7 sm:p-9 border border-[#E4E7EC] shadow-sm">
            {status === 'success' ? (
              <div className="py-12 text-center space-y-4">
                <div className="w-16 h-16 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto shadow-xs">
                  <CheckCircle2 className="w-9 h-9" />
                </div>
                <h3 className="font-heading font-black text-2xl text-[#101828]">
                  Message Successfully Sent!
                </h3>
                <p className="text-sm text-[#667085] max-w-md mx-auto leading-relaxed">
                  Thank you for reaching out to the Ghana Scholarship Portal team.
                  Our administrative editors will review your inquiry promptly.
                </p>
                <div className="pt-4">
                  <button
                    onClick={() => setStatus('idle')}
                    className="px-6 py-3 bg-[#173A8A] text-white text-xs font-bold rounded-xl hover:bg-[#050D2B] transition-colors shadow-sm"
                  >
                    Send Another Message
                  </button>
                </div>
              </div>
            ) : (
              <form onSubmit={handleSubmit} className="space-y-5">
                <div className="border-b border-slate-100 pb-4">
                  <h2 className="font-heading font-extrabold text-xl text-[#101828]">
                    Send a Message
                  </h2>
                  <p className="text-xs text-[#667085] mt-1">
                    Fill out the form below and our team will get back to you within 1-2 business days.
                  </p>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                      Your Full Name *
                    </label>
                    <input
                      type="text"
                      required
                      value={formData.name}
                      onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                      placeholder="e.g. Kwame Mensah"
                      className="w-full px-4 py-2.5 rounded-xl border border-[#E4E7EC] bg-[#F5F7FC] text-sm text-[#101828] focus:bg-white focus:outline-none focus:ring-2 focus:ring-[#173A8A]/20 focus:border-[#173A8A] transition-all"
                    />
                  </div>

                  <div>
                    <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                      Email Address *
                    </label>
                    <input
                      type="email"
                      required
                      value={formData.email}
                      onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                      placeholder="kwame.mensah@example.com"
                      className="w-full px-4 py-2.5 rounded-xl border border-[#E4E7EC] bg-[#F5F7FC] text-sm text-[#101828] focus:bg-white focus:outline-none focus:ring-2 focus:ring-[#173A8A]/20 focus:border-[#173A8A] transition-all"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                    Inquiry Subject *
                  </label>
                  <select
                    value={formData.subject}
                    onChange={(e) => setFormData({ ...formData, subject: e.target.value })}
                    className="w-full px-4 py-2.5 rounded-xl border border-[#E4E7EC] bg-[#F5F7FC] text-sm text-[#101828] focus:bg-white focus:outline-none focus:ring-2 focus:ring-[#173A8A]/20 focus:border-[#173A8A] transition-all"
                  >
                    <option value="general">General Inquiry</option>
                    <option value="submit_scholarship">Suggest a New Scholarship to List</option>
                    <option value="deadline_update">Report an Expired or Updated Deadline</option>
                    <option value="sponsor_partnership">Scholarship Provider / Donor Partnership</option>
                    <option value="technical_feedback">Technical Issue or Website Feedback</option>
                  </select>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-slate-700 uppercase tracking-wider mb-1.5">
                    Your Message *
                  </label>
                  <textarea
                    rows={5}
                    required
                    value={formData.message}
                    onChange={(e) => setFormData({ ...formData, message: e.target.value })}
                    placeholder="Provide detailed information regarding your inquiry, scholarship links, or question…"
                    className="w-full px-4 py-3 rounded-xl border border-[#E4E7EC] bg-[#F5F7FC] text-sm text-[#101828] focus:bg-white focus:outline-none focus:ring-2 focus:ring-[#173A8A]/20 focus:border-[#173A8A] transition-all resize-none"
                  />
                </div>

                <div className="pt-2">
                  <button
                    type="submit"
                    disabled={status === 'loading'}
                    className="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-8 py-3.5 bg-[#FFC928] text-[#050D2B] font-bold text-sm rounded-xl hover:bg-[#FFD84D] transition-colors shadow-md disabled:opacity-50"
                  >
                    <Send className="w-4 h-4" />
                    <span>{status === 'loading' ? 'Sending Message…' : 'Submit Message'}</span>
                  </button>
                </div>
              </form>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

export { ContactPage };
