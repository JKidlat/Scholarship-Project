import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta?.env?.VITE_SUPABASE_URL || 'https://placeholder.supabase.co';
const supabaseAnonKey = import.meta?.env?.VITE_SUPABASE_ANON_KEY || 'placeholder_anon_key';

export const isSupabaseConfigured = () => {
  const url = import.meta?.env?.VITE_SUPABASE_URL || '';
  const key = import.meta?.env?.VITE_SUPABASE_ANON_KEY || '';
  return !!(
    url &&
    !url.includes('placeholder') &&
    !url.includes('example.com') &&
    key &&
    !key.includes('placeholder')
  );
};

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
