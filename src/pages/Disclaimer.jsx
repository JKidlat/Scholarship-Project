import React from 'react';

export default function DisclaimerPage() {
  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-24 pb-20">
      <div className="bg-[#050D2B] text-white py-12 mb-10">
        <div className="site-container">
          <h1 className="font-heading font-extrabold text-3xl md:text-4xl text-white mb-2">
            Disclaimer
          </h1>
          <p className="text-white/60 text-xs">Official Portal Information Notice</p>
        </div>
      </div>

      <div className="site-container max-w-4xl bg-white rounded-2xl p-8 sm:p-12 border border-[#E4E7EC] shadow-sm space-y-6 text-sm text-[#101828] leading-relaxed">
        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">Non-Affiliation Notice</h2>
          <p>
            The Ghana Scholarship Portal is an independent informational discovery service. Unless
            explicitly stated, we are not affiliated with, endorsed by, or partnered with any of the
            universities, government institutions, embassies, or private foundations listed on this
            platform.
          </p>
        </section>

        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">No Warranty</h2>
          <p>
            All information provided on this website is for general informational and educational
            purposes only. We strive to provide up-to-date and verified information, but we make no
            warranties, express or implied, regarding the completeness, accuracy, reliability, or
            availability of any scholarship opportunity.
          </p>
        </section>

        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">Applicant Responsibility</h2>
          <p>
            Applicants are solely responsible for independently verifying all deadlines, eligibility
            restrictions, and required documentation directly with the official scholarship provider
            prior to submitting any application.
          </p>
        </section>
      </div>
    </div>
  );
}

export { DisclaimerPage };
