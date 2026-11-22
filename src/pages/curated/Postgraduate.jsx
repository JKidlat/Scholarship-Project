import React from 'react';
import { CuratedCategoryView } from '../../components/scholarship/CuratedCategoryView';

export default function PostgraduatePage() {
  return (
    <CuratedCategoryView
      title="Postgraduate Scholarships"
      badge="Master's & PhD Funding"
      description="Financial support, fellowships, and research grants for Ghanaian students pursuing Master's, PhD, and Postdoctoral studies locally and abroad."
      filterFn={(s) =>
        s.study_levels?.some((lvl) =>
          ['postgraduate', 'masters', 'phd', 'postdoctoral'].includes(lvl)
        )
      }
    />
  );
}

export { PostgraduatePage };
