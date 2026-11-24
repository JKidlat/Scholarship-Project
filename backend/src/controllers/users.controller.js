/**
 * @file users.controller.js
 * @description Administrative and user management controller.
 *
 * Uses supabaseAdmin (service role key) to:
 * 1. Retrieve all registered Supabase Auth users, student profiles, and admin accounts.
 * 2. Manage administrator team invitations and role allocations.
 * 3. Update passwords securely without exposing service credentials to the client.
 */

import { asyncHandler } from '../utils/asyncHandler.js';
import { AppError } from '../utils/AppError.js';
import { supabaseAdmin } from '../config/supabase.js';

/**
 * GET /api/users
 * Returns list of registered students and administrators.
 * Security: Accessible by backend, never returns sensitive hash/salts.
 */
export const getUsers = asyncHandler(async (_req, res) => {
  res.set('Cache-Control', 'no-store, no-cache, must-revalidate, proxy-revalidate');

  // 1. Fetch Supabase Auth users
  let authUsers = [];
  try {
    const { data, error } = await supabaseAdmin.auth.admin.listUsers({
      page: 1,
      perPage: 1000,
    });
    if (!error && data?.users) {
      authUsers = data.users;
    }
  } catch (err) {
    console.warn('Auth listUsers notice:', err.message);
  }

  // 2. Fetch student profiles from application database
  let studentProfiles = [];
  try {
    const { data, error } = await supabaseAdmin
      .from('student_profiles')
      .select('*')
      .order('created_at', { ascending: false });
    if (!error && data) {
      studentProfiles = data;
    }
  } catch (err) {
    console.warn('student_profiles query notice:', err.message);
  }

  // 3. Fetch admin users from application database
  let adminRecords = [];
  try {
    const { data, error } = await supabaseAdmin
      .from('admin_users')
      .select('*')
      .order('created_at', { ascending: false });
    if (!error && data) {
      adminRecords = data;
    }
  } catch (err) {
    console.warn('admin_users query notice:', err.message);
  }

  // Build admin lookup map by user_id
  const adminMap = new Map();
  adminRecords.forEach((a) => {
    adminMap.set(a.user_id, a.role);
  });

  // Build profile lookup map by user_id
  const profileMap = new Map();
  studentProfiles.forEach((p) => {
    profileMap.set(p.user_id, p);
  });

  const students = [];
  const admins = [];

  // Cross-reference auth users
  authUsers.forEach((u) => {
    const email = u.email || '';
    const metadata = u.user_metadata || {};
    const profile = profileMap.get(u.id);
    const adminRole = adminMap.get(u.id);
    const isSuperAdminEmail = email.toLowerCase() === 'jansah.klintaps@gmail.com';

    const fullName = profile?.full_name || metadata.full_name || email.split('@')[0] || 'User';

    if (adminRole || isSuperAdminEmail || metadata.role === 'super_admin' || metadata.role === 'admin') {
      admins.push({
        id: u.id,
        user_id: u.id,
        email,
        full_name: fullName,
        role: adminRole || (isSuperAdminEmail ? 'super_admin' : (metadata.role || 'editor')),
        created_at: u.created_at,
        last_sign_in_at: u.last_sign_in_at,
      });
    } else {
      students.push({
        id: u.id,
        user_id: u.id,
        email,
        full_name: fullName,
        current_level: profile?.current_level || metadata.current_level || 'undergraduate',
        nationality: profile?.nationality || 'Ghanaian',
        country_of_residence: profile?.country_of_residence || 'Ghana',
        created_at: profile?.created_at || u.created_at,
        last_sign_in_at: u.last_sign_in_at,
      });
    }
  });

  // If there are student profiles not yet in authUsers (e.g. mock or manual inserts), include them
  studentProfiles.forEach((p) => {
    const alreadyListed = students.some((s) => s.user_id === p.user_id || s.id === p.id);
    if (!alreadyListed && !adminMap.has(p.user_id)) {
      students.push({
        id: p.id || p.user_id,
        user_id: p.user_id,
        email: p.email || 'student@ghanascholarships.gov.gh',
        full_name: p.full_name || 'Registered Student',
        current_level: p.current_level || 'undergraduate',
        nationality: p.nationality || 'Ghanaian',
        country_of_residence: p.country_of_residence || 'Ghana',
        created_at: p.created_at,
      });
    }
  });

  // Ensure primary admin is always included
  const hasPrimaryAdmin = admins.some((a) => a.email.toLowerCase() === 'jansah.klintaps@gmail.com');
  if (!hasPrimaryAdmin) {
    admins.unshift({
      id: 'admin_primary_seed',
      user_id: 'admin_primary_seed',
      email: 'jansah.klintaps@gmail.com',
      full_name: 'Lead Portal Administrator',
      role: 'super_admin',
      created_at: new Date().toISOString(),
    });
  }

  res.status(200).json({
    success: true,
    data: {
      students,
      admins,
      totalStudents: students.length,
      totalAdmins: admins.length,
    },
  });
});

/**
 * POST /api/users/admin
 * Invite/create a new administrator in Supabase Auth & admin_users table.
 */
export const createAdmin = asyncHandler(async (req, res) => {
  const { email, fullName, role = 'admin' } = req.body;

  const cleanEmail = (email || '').trim().toLowerCase();
  const cleanName = (fullName || '').trim();

  if (!cleanEmail || !cleanEmail.includes('@')) {
    throw new AppError('Valid administrator email address is required.', 400);
  }
  if (!cleanName || cleanName.length < 2) {
    throw new AppError('Full legal name is required.', 400);
  }

  // Generate strong temporary password
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789!@#$%&*';
  let tempPassword = '';
  for (let i = 0; i < 12; i++) {
    tempPassword += chars.charAt(Math.floor(Math.random() * chars.length));
  }

  // 1. Create user in Supabase Auth
  const { data: authData, error: authError } = await supabaseAdmin.auth.admin.createUser({
    email: cleanEmail,
    password: tempPassword,
    email_confirm: true,
    user_metadata: {
      full_name: cleanName,
      role,
      is_admin: true,
    },
  });

  if (authError || !authData?.user) {
    // If user already exists in Auth, try retrieving them
    if (authError?.message?.includes('already registered') || authError?.message?.includes('already been registered')) {
      throw new AppError('An account with this email address already exists.', 409);
    }
    console.error('Supabase createUser error:', authError);
    throw new AppError(`Failed to create administrator account: ${authError?.message}`, 500);
  }

  const userId = authData.user.id;
  const now = new Date().toISOString();

  // 2. Insert into admin_users table
  const { error: adminError } = await supabaseAdmin
    .from('admin_users')
    .upsert({
      user_id: userId,
      role: role === 'super_admin' ? 'super_admin' : 'editor',
    }, { onConflict: 'user_id' });

  if (adminError) {
    console.warn('admin_users upsert warning:', adminError.message);
  }

  const adminEntry = {
    id: userId,
    user_id: userId,
    email: cleanEmail,
    full_name: cleanName,
    role,
    created_at: now,
  };

  res.status(201).json({
    success: true,
    message: 'Administrator account created successfully.',
    data: {
      admin: adminEntry,
      tempPassword,
    },
  });
});

/**
 * POST /api/users/change-password
 * Change password for a specific user ID via Supabase Admin API.
 */
export const changePassword = asyncHandler(async (req, res) => {
  const { userId, newPassword } = req.body;

  if (!userId) throw new AppError('User ID is required.', 400);
  if (!newPassword || newPassword.length < 6) {
    throw new AppError('Password must be at least 6 characters in length.', 400);
  }

  const { error } = await supabaseAdmin.auth.admin.updateUserById(userId, {
    password: newPassword,
  });

  if (error) {
    console.error('changePassword error:', error);
    throw new AppError(`Failed to update password: ${error.message}`, 500);
  }

  res.status(200).json({
    success: true,
    message: 'Password updated successfully.',
  });
});
