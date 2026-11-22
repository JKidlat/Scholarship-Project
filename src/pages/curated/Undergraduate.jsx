import React from 'react';
import { CuratedCategoryView } from '../../components/scholarship/CuratedCategoryView';

export default function UndergraduatePage() {
  return (
    <CuratedCategoryView
      title="Undergraduate Scholarships"
      badge="First Degree Opportunities"
      description="Funding options, bursaries, and merit awards available for Ghanaian students pursuing bachelor degrees and undergraduate studies."
      filterFn={(s) => s.study_levels?.includes('undergraduate')}
    />
  );
}

export { UndergraduatePage };
