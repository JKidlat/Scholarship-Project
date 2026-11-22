import React from 'react';
import { cn, statusClass, statusLabel } from '../../utils/formatters';

export function StatusBadge({ status, className, size = 'md' }) {
  return (
    <span
      className={cn(
        'inline-flex items-center font-bold uppercase tracking-wider rounded-full',
        size === 'sm' && 'text-[10px] px-2 py-0.5',
        size === 'md' && 'text-xs px-2.5 py-1',
        size === 'lg' && 'text-sm px-3 py-1.5',
        statusClass(status),
        className
      )}
    >
      {statusLabel(status)}
    </span>
  );
}
