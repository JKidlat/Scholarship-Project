/**
 * @file EmptyState.jsx
 * @description Standardized empty state component for search results, filtered views,
 * user bookmarks, and database error states.
 *
 * Design Guidelines:
 * - Uses clean, minimalist functional icons rather than large generic SVG cartoons
 * - Offers clear next-step actions (e.g. clear filters, browse directory, retry)
 */

import React from 'react';
import { SearchX, BookOpen, AlertCircle, RefreshCw } from 'lucide-react';
import { Link } from 'react-router-dom';
import { cn } from '../../utils/formatters';

export function EmptyState({
  variant = 'empty',
  title,
  description,
  action,
  className,
}) {
  const defaults = {
    search: {
      icon: SearchX,
      title: 'No Matching Scholarships Found',
      description: 'We could not find opportunities matching your search or filters. Try adjusting filters or searching by a broader keyword.',
    },
    empty: {
      icon: BookOpen,
      title: 'No Scholarships Listed Yet',
      description: 'Scholarship entries will appear here once imported and verified through the administration dashboard.',
    },
    error: {
      icon: AlertCircle,
      title: 'Unable to Load Opportunities',
      description: 'A network or database connection issue occurred. Please check your connection and try again.',
    },
  };

  const config = defaults[variant] || defaults.empty;
  const Icon = config.icon;
  const displayTitle = title || config.title;
  const displayDesc = description || config.description;

  return (
    <div className={cn('flex flex-col items-center justify-center py-16 px-4 text-center', className)}>
      <div className="w-16 h-16 rounded-2xl bg-slate-100 border border-slate-200/80 flex items-center justify-center mb-4 text-[#173A8A] shadow-2xs">
        <Icon className="w-7 h-7" />
      </div>
      <h3 className="font-heading font-bold text-[#101828] text-lg sm:text-xl mb-2">
        {displayTitle}
      </h3>
      <p className="text-[#667085] text-xs sm:text-sm max-w-md leading-relaxed mb-6">
        {displayDesc}
      </p>

      {action && (
        action.href ? (
          <Link
            to={action.href}
            className="inline-flex items-center gap-2 px-5 py-2.5 bg-[#173A8A] text-white text-xs sm:text-sm font-bold rounded-xl hover:bg-[#050D2B] transition-colors shadow-sm"
          >
            {action.label}
          </Link>
        ) : (
          <button
            onClick={action.onClick}
            type="button"
            className="inline-flex items-center gap-2 px-5 py-2.5 bg-[#173A8A] text-white text-xs sm:text-sm font-bold rounded-xl hover:bg-[#050D2B] transition-colors shadow-sm"
          >
            <RefreshCw className="w-3.5 h-3.5" />
            <span>{action.label}</span>
          </button>
        )
      )}
    </div>
  );
}
