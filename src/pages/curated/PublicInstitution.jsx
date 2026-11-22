import React from 'react';
import { CuratedCategoryView } from '../../components/scholarship/CuratedCategoryView';

export default function PublicInstitutionPage() {
  return (
    <CuratedCategoryView
      title="Public Institution Scholarships"
      badge="Public Sector Eligibility"
      description="Opportunities designated for students enrolled in Ghana's public universities or originating from public senior high schools."
      filterFn={(s) =>
        s.public_school_specific === true ||
        s.institution?.category === 'public_university' ||
        s.institution?.category === 'public_tertiary'
      }
    />
  );
}

export { PublicInstitutionPage };
