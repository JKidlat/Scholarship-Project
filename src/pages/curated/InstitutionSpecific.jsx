import React from 'react';
import { CuratedCategoryView } from '../../components/scholarship/CuratedCategoryView';

export default function InstitutionSpecificPage() {
  return (
    <CuratedCategoryView
      title="Institution-Specific Scholarships"
      badge="University & College Restricted"
      description="Opportunities designated exclusively for students attending specific universities, colleges, or training institutes."
      filterFn={(s) => s.institution_specific === true}
    />
  );
}

export { InstitutionSpecificPage };
