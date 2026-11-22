import React from 'react';

export default function PrivacyPolicyPage() {
  return (
    <div className="bg-[#F5F7FC] min-h-screen pt-24 pb-20">
      <div className="bg-[#050D2B] text-white py-12 mb-10">
        <div className="site-container">
          <h1 className="font-heading font-extrabold text-3xl md:text-4xl text-white mb-2">
            Privacy Policy
          </h1>
          <p className="text-white/60 text-xs">Last updated: November 2026</p>
        </div>
      </div>

      <div className="site-container max-w-4xl bg-white rounded-2xl p-8 sm:p-12 border border-[#E4E7EC] shadow-sm space-y-6 text-sm text-[#101828] leading-relaxed">
        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">1. Introduction</h2>
          <p>
            The Ghana Scholarship Portal (&quot;we&quot;, &quot;us&quot;, &quot;our&quot;) is committed to protecting your privacy.
            This Privacy Policy explains what information we collect when you use our discovery
            directory, how we use it, and how we protect your personal data.
          </p>
          <p>
            You can browse all scholarship listings on our platform completely free without creating an
            account or submitting personal information.
          </p>
        </section>

        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">2. Information We Collect</h2>
          <p>
            If you optionally choose to register for a student profile to save scholarships or track
            applications, we collect:
          </p>
          <ul className="list-disc pl-5 space-y-1 text-[#667085]">
            <li>Full name and email address for account authentication</li>
            <li>Academic preferences (educational level, field of study, preferred study destination)</li>
            <li>Saved scholarships and self-recorded application tracking notes</li>
          </ul>
        </section>

        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">3. How Information is Used</h2>
          <p>We use your information strictly to:</p>
          <ul className="list-disc pl-5 space-y-1 text-[#667085]">
            <li>Provide personalized scholarship recommendations matching your eligibility criteria</li>
            <li>Send requested email notifications regarding new opportunities and deadlines</li>
            <li>Maintain your saved scholarship dashboard</li>
          </ul>
          <p className="font-medium text-[#101828]">
            We never sell, rent, or trade your personal data to third parties.
          </p>
        </section>

        <section className="space-y-3">
          <h2 className="font-heading font-bold text-lg text-[#173A8A]">4. External Links</h2>
          <p>
            Our website contains links to official scholarship sponsor websites. We do not operate
            these external portals and are not responsible for their respective privacy practices.
          </p>
        </section>
      </div>
    </div>
  );
}

export { PrivacyPolicyPage };
