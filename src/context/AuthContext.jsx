import React, { createContext, useContext, useState, useEffect } from 'react';
import {
  registerUser,
  loginUser,
  logoutUser,
  getActiveSession,
  getStoredStudentProfiles,
} from '../services/auth';
import { supabase, isSupabaseConfigured } from '../services/supabase';

const AuthContext = createContext({
  user: null,
  profile: null,
  loading: true,
  login: async () => {},
  register: async () => {},
  logout: async () => {},
  updateProfileState: () => {},
});

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [profile, setProfile] = useState(null);
  const [loading, setLoading] = useState(true);

  // Initialize session from persistent database auth store or Supabase
  useEffect(() => {
    async function initSession() {
      // 1. Check local database session store
      const localSession = getActiveSession();
      if (localSession?.user) {
        setUser(localSession.user);
        const storedProfiles = getStoredStudentProfiles();
        const matched = storedProfiles.find((p) => p.user_id === localSession.user.id || p.email === localSession.user.email);
        setProfile(matched || localSession.profile || {
          id: localSession.user.id,
          email: localSession.user.email,
          full_name: localSession.user.user_metadata?.full_name || localSession.user.email?.split('@')[0],
          current_level: localSession.user.user_metadata?.current_level || 'undergraduate',
        });
        setLoading(false);
        return;
      }

      // 2. Check Supabase session if configured
      if (isSupabaseConfigured()) {
        try {
          const { data: { session } } = await supabase.auth.getSession();
          if (session?.user) {
            setUser(session.user);
            const storedProfiles = getStoredStudentProfiles();
            const matched = storedProfiles.find((p) => p.user_id === session.user.id || p.email === session.user.email);
            setProfile(matched || {
              id: session.user.id,
              email: session.user.email,
              full_name: session.user.user_metadata?.full_name || session.user.email?.split('@')[0],
              current_level: session.user.user_metadata?.current_level || 'undergraduate',
            });
          }
        } catch (err) {
          console.warn('Initial session check fallback:', err);
        }
      }

      setLoading(false);
    }

    initSession();

    // Listen for custom auth state change events
    const handleAuthEvent = (e) => {
      const session = e.detail?.session;
      if (session?.user) {
        setUser(session.user);
        setProfile(session.profile);
      } else {
        setUser(null);
        setProfile(null);
      }
    };

    // Listen for real-time profile updates (e.g. avatar uploads, profile edits)
    const handleProfileEvent = (e) => {
      if (e.detail?.profile) {
        setProfile((prev) => ({
          ...prev,
          ...e.detail.profile,
        }));
      }
    };

    window.addEventListener('auth-state-changed', handleAuthEvent);
    window.addEventListener('user-profile-updated', handleProfileEvent);

    // Listen for Supabase auth state changes if configured
    let subscription = null;
    if (isSupabaseConfigured()) {
      const { data } = supabase.auth.onAuthStateChange((_event, session) => {
        if (session?.user) {
          setUser(session.user);
          const storedProfiles = getStoredStudentProfiles();
          const matched = storedProfiles.find((p) => p.user_id === session.user.id || p.email === session.user.email);
          setProfile(matched || {
            id: session.user.id,
            email: session.user.email,
            full_name: session.user.user_metadata?.full_name || session.user.email?.split('@')[0],
            current_level: session.user.user_metadata?.current_level || 'undergraduate',
          });
        }
      });
      subscription = data?.subscription;
    }

    return () => {
      window.removeEventListener('auth-state-changed', handleAuthEvent);
      window.removeEventListener('user-profile-updated', handleProfileEvent);
      if (subscription) subscription.unsubscribe();
    };
  }, []);

  const updateProfileState = (updatedProfile) => {
    setProfile((prev) => ({
      ...prev,
      ...updatedProfile,
    }));
  };

  const login = async (email, password) => {
    const session = await loginUser({ email, password });
    setUser(session.user);
    setProfile(session.profile);
    return session;
  };

  const register = async (email, password, fullName, level) => {
    const session = await registerUser({ email, password, fullName, level });
    setUser(session.user);
    setProfile(session.profile);
    return session;
  };

  const logout = async () => {
    await logoutUser();
    setUser(null);
    setProfile(null);
  };

  return (
    <AuthContext.Provider value={{ user, profile, loading, login, register, logout, updateProfileState }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  return useContext(AuthContext);
}
