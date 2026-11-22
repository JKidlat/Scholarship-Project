import React from 'react';

export default function TermsOfUsePage() {
  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-24 pb-20">
      <div className="bg-[#050D2B] text-white py-12 mb-10">
        <div className="site-container">
          <h1 className="font-heading font-extrabold text-3xl md:text-4xl text-white mb-2">
            Terms of Use
          </h1>
          <p className="text-white/60 text-xs">Last updated: November 2026</p>
        </div>
      </div>

      <div className="site-container max-w-4xl bg-white rounded-2xl p-8 sm:p-12 border border-[#E4E7EC] shadow-sm space-y-6 text-sm text-[#101828] leading-relaxed">
        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">1. Directory Scope</h2>
          <p>
            The Ghana Scholarship Portal operates exclusively as an informational scholarship discovery
            directory. We do not award, judge, manage, or fund scholarships.
          </p>
        </section>

        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">2. User Applications</h2>
          <p>
            Students do not apply for scholarships through our platform. All applications must be
            submitted directly to the respective scholarship foundation, university, or governmental
            awarding body through their official application portals.
          </p>
        </section>

        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">3. Accuracy of Listings</h2>
          <p>
            While we make every effort to verify details against official sources, scholarship
            requirements, funding quotas, and deadlines are determined solely by the granting
            organizations and are subject to change without notice. Users are required to confirm
            all criteria with the provider before applying.
          </p>
        </section>

        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">4. No Fees Warning</h2>
          <p className="font-semibold text-[#D92D20]">
            The Ghana Scholarship Portal is completely free to use. Beware of fraudulent actors
            demanding payment or processing fees in exchange for guaranteed scholarships.
          </p>
        </section>
      </div>
    </div>
  );
}

export { TermsOfUsePage };
