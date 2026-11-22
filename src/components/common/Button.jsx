import React from 'react';
import { Loader2 } from 'lucide-react';
import { cn } from '../../utils/formatters';

export function Button({
  variant = 'primary',
  size = 'md',
  loading = false,
  leftIcon,
  rightIcon,
  children,
  className,
  disabled,
  ...props
}) {
  const base = 'inline-flex items-center justify-center gap-2 font-semibold rounded-xl transition-all focus:outline-none focus:ring-2 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed';

  const variants = {
    primary: 'bg-[#173A8A] text-white hover:bg-[#122d6e] focus:ring-[#173A8A]',
    secondary: 'bg-[#F5F7FC] text-[#101828] hover:bg-[#E4E7EC] focus:ring-[#E4E7EC]',
    outline: 'border-2 border-[#173A8A] text-[#173A8A] hover:bg-[#173A8A] hover:text-white focus:ring-[#173A8A]',
    ghost: 'text-[#101828] hover:bg-[#F5F7FC] focus:ring-[#E4E7EC]',
    gold: 'bg-[#FFC928] text-[#050D2B] hover:bg-[#FFD84D] focus:ring-[#FFC928] shadow-md shadow-[#FFC928]/30',
    danger: 'bg-[#D92D20] text-white hover:bg-[#b82418] focus:ring-[#D92D20]',
  };

  const sizes = {
    sm: 'text-xs px-3 py-1.5 h-8',
    md: 'text-sm px-4 py-2.5 h-10',
    lg: 'text-base px-6 py-3 h-12',
  };

  return (
    <button
      className={cn(base, variants[variant], sizes[size], className)}
      disabled={disabled || loading}
      {...props}
    >
      {loading ? (
        <Loader2 className="w-4 h-4 animate-spin" />
      ) : leftIcon ? (
        <span className="flex-shrink-0">{leftIcon}</span>
      ) : null}
      {children}
      {!loading && rightIcon && <span className="flex-shrink-0">{rightIcon}</span>}
    </button>
  );
}
