import React from 'react';
import { CuratedCategoryView } from '../../components/scholarship/CuratedCategoryView';

export default function ForWomenPage() {
  return (
    <CuratedCategoryView
      title="Scholarships for Women"
      badge="Empowering Female Leaders"
      description="Opportunities designated specifically for women or prioritizing female applicants in STEM, leadership, and higher education."
      filterFn={(s) =>
        s.gender_eligibility === 'women' || s.gender_eligibility === 'women_priority'
      }
    />
  );
}

export { ForWomenPage };
