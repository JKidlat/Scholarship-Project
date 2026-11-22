import React from 'react';
import { CuratedCategoryView } from '../../components/scholarship/CuratedCategoryView';

export default function InternationalPage() {
  return (
    <CuratedCategoryView
      title="International Scholarships"
      badge="Study Abroad Opportunities"
      description="Opportunities for Ghanaian scholars to study abroad in prestigious global institutions across the United Kingdom, United States, Canada, Europe, and Asia."
      filterFn={(s) =>
        s.geographic_scope === 'international' ||
        s.geographic_scope === 'both' ||
        s.scope === 'international'
      }
    />
  );
}

export { InternationalPage };
