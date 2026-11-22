import React from 'react';
import { HeroSection } from '../components/home/HeroSection';
import { StatsSection } from '../components/home/StatsSection';
import { FeaturedScholarships } from '../components/home/FeaturedScholarships';
import { CategoryGrid } from '../components/home/CategoryGrid';
import { FieldsSection } from '../components/home/FieldsSection';
import { DestinationsSection } from '../components/home/DestinationsSection';

export default function HomePage() {
  return (
    <>
      <HeroSection />
      <StatsSection />
      <FeaturedScholarships />
      <CategoryGrid />
      <FieldsSection />
      <DestinationsSection />
    </>
  );
}

export { HomePage };
