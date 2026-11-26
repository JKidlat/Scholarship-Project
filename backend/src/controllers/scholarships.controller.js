/**
 * @file scholarships.controller.js
 * @description Controller for scholarship listing, retrieval, creation, updates, and deletion.
 *
 * Uses supabaseAdmin (service role key) to ensure reliable database operations,
 * foreign-key mapping (providers and institutions), and join-table synchronization.
 */

import { asyncHandler } from '../utils/asyncHandler.js';
import { AppError } from '../utils/AppError.js';
import { supabaseAdmin } from '../config/supabase.js';
import { LOGO_BUCKET } from './upload.controller.js';

/**
 * Helper: Find or create provider by name to get its UUID
 */
async function resolveProviderId(providerName, logoUrl = null) {
  if (!providerName || !providerName.trim()) return null;
  const cleanName = providerName.trim();

  // Try to find existing provider
  const { data: existing } = await supabaseAdmin
    .from('scholarship_providers')
    .select('id, logo_url')
    .ilike('name', cleanName)
    .maybeSingle();

  if (existing?.id) {
    // If a new logo was uploaded and the provider doesn't have one, update it
    if (logoUrl && !existing.logo_url) {
      await supabaseAdmin
        .from('scholarship_providers')
        .update({ logo_url: logoUrl, updated_at: new Date().toISOString() })
        .eq('id', existing.id);
    }
    return existing.id;
  }

  // Create new provider
  const { data: created, error } = await supabaseAdmin
    .from('scholarship_providers')
    .insert({
      name: cleanName,
      logo_url: logoUrl || null,
    })
    .select('id')
    .single();

  if (!error && created) {
    return created.id;
  }
  return null;
}

/**
 * Helper: Find or create institution by name to get its UUID
 */
async function resolveInstitutionId(institutionName, category = 'public_university') {
  if (!institutionName || !institutionName.trim()) return null;
  const cleanName = institutionName.trim();

  const { data: existing } = await supabaseAdmin
    .from('institutions')
    .select('id')
    .ilike('name', cleanName)
    .maybeSingle();

  if (existing?.id) {
    return existing.id;
  }

  const { data: created, error } = await supabaseAdmin
    .from('institutions')
    .insert({
      name: cleanName,
      category: category || 'public_university',
    })
    .select('id')
    .single();

  if (!error && created) {
    return created.id;
  }
  return null;
}

/**
 * GET /api/scholarships
 * Retrieve paginated or filtered list of scholarships.
 */
export const getScholarships = asyncHandler(async (req, res) => {
  res.set('Cache-Control', 'no-store, no-cache, must-revalidate, proxy-revalidate');

  const {
    all = 'false',
    page = 1,
    limit = 300,
    status,
    scope,
    query,
    featured,
  } = req.query;

  const pageNum = Math.max(1, parseInt(page, 10) || 1);
  const limitNum = Math.min(500, Math.max(1, parseInt(limit, 10) || 50));
  const from = (pageNum - 1) * limitNum;
  const to = from + limitNum - 1;

  let dbQuery = supabaseAdmin
    .from('scholarships')
    .select(
      `
      id,
      slug,
      name,
      short_description,
      full_description,
      geographic_scope,
      funding_type,
      application_status,
      gender_eligibility,
      verification_status,
      is_featured,
      is_published,
      application_deadline,
      application_url,
      information_url,
      logo_url,
      logo_storage_path,
      logo_alt_text,
      logo_updated_at,
      host_country,
      target_countries,
      eligibility_requirements,
      benefits,
      required_documents,
      created_at,
      updated_at,
      provider:scholarship_providers(id, name, logo_url),
      institution:institutions(id, name, category),
      study_levels:scholarship_study_levels(level)
    `,
      { count: 'exact' }
    );

  // If not admin fetching all, only return published scholarships
  if (all !== 'true') {
    dbQuery = dbQuery.eq('is_published', true);
  }

  if (status) {
    dbQuery = dbQuery.eq('application_status', status);
  }
  if (scope && scope !== 'all') {
    dbQuery = dbQuery.eq('geographic_scope', scope);
  }
  if (featured === 'true') {
    dbQuery = dbQuery.eq('is_featured', true);
  }
  if (query && query.trim()) {
    const term = query.trim();
    dbQuery = dbQuery.or(`name.ilike.%${term}%,title.ilike.%${term}%,short_description.ilike.%${term}%`);
  }

  dbQuery = dbQuery.order('created_at', { ascending: false }).range(from, to);

  const { data, count, error } = await dbQuery;

  if (error) {
    console.error('getScholarships error:', error);
    throw new AppError(`Failed to fetch scholarships: ${error.message}`, 500);
  }

  // Format records with flat provider and institution strings for convenience
  const formatted = (data || []).map((row) => ({
    ...row,
    provider: row.provider?.name || '',
    provider_id: row.provider?.id || null,
    provider_logo_url: row.provider?.logo_url || row.logo_url || null,
    institution: row.institution?.name || '',
    institution_id: row.institution?.id || null,
    institution_category: row.institution?.category || row.institution_category_restriction || 'public_university',
    title: row.name || row.title || '',
    status: row.application_status || row.status || 'open',
    scope: row.geographic_scope || row.scope || 'local',
    deadline: row.application_deadline || row.deadline || null,
    is_verified: row.verification_status === 'verified',
    official_url: row.application_url || null,
    description: row.full_description || row.short_description || '',
    study_levels: Array.isArray(row.study_levels) ? row.study_levels.map((l) => l.level || l) : [],
    host_country: row.host_country || 'Ghana',
    target_countries: Array.isArray(row.target_countries) ? row.target_countries : ['Ghana'],
    eligibility_requirements: row.eligibility_requirements || '',
    benefits: Array.isArray(row.benefits) ? row.benefits : (row.benefits ? [row.benefits] : []),
    required_documents: Array.isArray(row.required_documents) ? row.required_documents : (row.required_documents ? [row.required_documents] : []),
  }));

  res.status(200).json({
    success: true,
    data: formatted,
    total: count ?? formatted.length,
    page: pageNum,
    pageSize: limitNum,
    totalPages: Math.ceil((count ?? formatted.length) / limitNum) || 1,
  });
});

/**
 * GET /api/scholarships/:idOrSlug
 * Retrieve single scholarship by UUID or unique slug.
 */
export const getScholarshipByIdOrSlug = asyncHandler(async (req, res) => {
  const { idOrSlug } = req.params;
  if (!idOrSlug) {
    throw new AppError('Scholarship identifier is required.', 400);
  }

  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(idOrSlug);

  let query = supabaseAdmin
    .from('scholarships')
    .select(
      `
      *,
      provider:scholarship_providers(id, name, logo_url, website),
      institution:institutions(id, name, category, website),
      study_levels:scholarship_study_levels(level),
      fields:scholarship_fields(field:fields_of_study(id, name, slug))
    `
    );

  if (isUuid) {
    query = query.eq('id', idOrSlug);
  } else {
    query = query.eq('slug', idOrSlug);
  }

  const { data, error } = await query.maybeSingle();

  if (error) {
    console.error('getScholarshipByIdOrSlug error:', error);
    throw new AppError(`Database error: ${error.message}`, 500);
  }

  if (!data) {
    throw new AppError('Scholarship record not found.', 404);
  }

  const formatted = {
    ...data,
    provider: data.provider?.name || '',
    provider_id: data.provider?.id || data.provider_id || null,
    institution: data.institution?.name || '',
    institution_id: data.institution?.id || data.institution_id || null,
    title: data.title || data.name || '',
    official_url: data.application_url || data.official_url || null,
    study_levels: Array.isArray(data.study_levels)
      ? data.study_levels.map((l) => l.level)
      : [],
    fields_of_study: Array.isArray(data.fields)
      ? data.fields.map((f) => f.field?.name).filter(Boolean)
      : [],
  };

  res.status(200).json({
    success: true,
    data: formatted,
  });
});

/**
 * POST /api/scholarships
 * Create a new scholarship in Supabase.
 */
export const createScholarship = asyncHandler(async (req, res) => {
  const body = req.body;

  const title = (body.title || body.name || '').trim();
  const providerName = (body.provider || '').trim();
  const officialUrl = (body.official_url || body.application_url || '').trim();

  if (!title) throw new AppError('Scholarship title is required.', 400);
  if (!providerName) throw new AppError('Scholarship provider is required.', 400);
  if (!officialUrl) throw new AppError('Application URL is required.', 400);

  // Generate unique slug if not provided
  let slug = (body.slug || '')
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
  if (!slug) {
    slug = `${title.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '')}-${Math.random().toString(36).substring(2, 6)}`;
  }

  // Resolve foreign keys
  const providerId = await resolveProviderId(providerName, body.logo_url);
  const institutionId = body.institution
    ? await resolveInstitutionId(body.institution, body.institution_category)
    : null;

  const now = new Date().toISOString();

  // Parse application_deadline safely for DATE column
  let deadline = null;
  if (body.application_deadline && /^\d{4}-\d{2}-\d{2}/.test(body.application_deadline)) {
    deadline = body.application_deadline.substring(0, 10);
  }

  const scholarshipRow = {
    slug,
    name: title,
    title,
    short_description: body.short_description || (body.description ? body.description.substring(0, 160) : null),
    full_description: body.description || body.full_description || null,
    geographic_scope: body.geographic_scope || body.scope || 'local',
    scope: body.geographic_scope || body.scope || 'local',
    funding_type: body.funding_type || 'other',
    application_status: body.application_status || body.status || 'open',
    status: body.application_status || body.status || 'open',
    gender_eligibility: body.gender_eligibility || 'all',
    verification_status: body.is_verified ? 'verified' : (body.verification_status || 'needs_verification'),
    is_verified: !!body.is_verified,
    is_featured: !!body.is_featured,
    is_published: body.is_published !== false,
    provider_id: providerId,
    institution_id: institutionId,
    institution_specific: !!institutionId,
    institution_category_restriction: body.institution_category || 'other',
    application_deadline: deadline,
    deadline,
    deadline_text: body.deadline_text || (body.application_deadline && !deadline ? body.application_deadline : null),
    application_url: officialUrl,
    information_url: body.information_url || null,
    eligibility_requirements: Array.isArray(body.eligibility_criteria)
      ? body.eligibility_criteria.join('\n')
      : (body.eligibility_requirements || body.eligibility_criteria || null),
    benefits: Array.isArray(body.benefits) ? body.benefits : (body.benefits ? [body.benefits] : null),
    required_documents: Array.isArray(body.required_documents) ? body.required_documents : (body.required_documents ? [body.required_documents] : null),
    application_process: Array.isArray(body.application_process) ? body.application_process : (body.application_process ? [body.application_process] : null),
    host_country: body.host_country || 'Ghana',
    target_countries: Array.isArray(body.target_countries) ? body.target_countries : ['Ghana'],
    logo_url: body.logo_url || null,
    logo_storage_path: body.logo_storage_path || null,
    logo_alt_text: body.logo_alt_text || `${providerName} official logo`,
    logo_updated_at: body.logo_url ? now : null,
    created_at: now,
    updated_at: now,
  };

  const { data: created, error } = await supabaseAdmin
    .from('scholarships')
    .insert([scholarshipRow])
    .select()
    .single();

  if (error || !created) {
    console.error('createScholarship error:', error);
    throw new AppError(`Failed to create scholarship in database: ${error?.message}`, 500);
  }

  // Handle study levels join table if provided
  if (Array.isArray(body.study_levels) && body.study_levels.length > 0) {
    const studyLevelRows = body.study_levels.map((lvl) => ({
      scholarship_id: created.id,
      level: lvl,
    }));
    await supabaseAdmin
      .from('scholarship_study_levels')
      .insert(studyLevelRows)
      .catch((err) => console.warn('Study levels join insert notice:', err.message));
  }

  res.status(201).json({
    success: true,
    message: 'Scholarship created successfully.',
    data: {
      ...created,
      provider: providerName,
      institution: body.institution || '',
    },
  });
});

/**
 * PATCH /api/scholarships/:idOrSlug
 * Update an existing scholarship in Supabase.
 * Preserves the previous logo if no new logo was uploaded.
 * Replaces the previous logo in storage if a new logo was uploaded.
 */
export const updateScholarship = asyncHandler(async (req, res) => {
  const { idOrSlug } = req.params;
  const fields = req.body;

  if (!idOrSlug) {
    throw new AppError('Scholarship identifier is required.', 400);
  }

  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(idOrSlug);

  // 1. Fetch current scholarship record to preserve existing logo if not changed
  let fetchQuery = supabaseAdmin.from('scholarships').select('*');
  if (isUuid) {
    fetchQuery = fetchQuery.eq('id', idOrSlug);
  } else {
    fetchQuery = fetchQuery.eq('slug', idOrSlug);
  }
  const { data: current, error: fetchError } = await fetchQuery.maybeSingle();

  if (fetchError || !current) {
    throw new AppError('Scholarship not found to update.', 404);
  }

  const now = new Date().toISOString();

  // 2. Resolve provider and institution if names were provided
  let providerId = current.provider_id;
  if (fields.provider && fields.provider.trim()) {
    providerId = await resolveProviderId(fields.provider.trim(), fields.logo_url || current.logo_url);
  }

  let institutionId = current.institution_id;
  if (fields.institution !== undefined) {
    institutionId = fields.institution ? await resolveInstitutionId(fields.institution, fields.institution_category) : null;
  }

  // 3. Logo replacement and cleanup logic
  let finalLogoUrl = current.logo_url;
  let finalStoragePath = current.logo_storage_path;
  let finalAltText = current.logo_alt_text;

  // If new logo provided and differs from current
  if (fields.logo_url !== undefined) {
    finalLogoUrl = fields.logo_url;
    finalStoragePath = fields.logo_storage_path !== undefined ? fields.logo_storage_path : finalStoragePath;
    finalAltText = fields.logo_alt_text || `${fields.provider || current.name} official logo`;

    // If logo was replaced and old storage path exists, clean up old file from storage
    if (
      current.logo_storage_path &&
      fields.logo_storage_path &&
      current.logo_storage_path !== fields.logo_storage_path &&
      !current.logo_storage_path.startsWith('local_')
    ) {
      try {
        await supabaseAdmin.storage.from(LOGO_BUCKET).remove([current.logo_storage_path]);
      } catch (cleanupErr) {
        console.warn('Old logo cleanup notice:', cleanupErr.message);
      }
    }
  }

  // Safe format for DATE column: only set if valid YYYY-MM-DD
  let deadline = current.application_deadline;
  if (fields.application_deadline !== undefined) {
    if (fields.application_deadline && /^\d{4}-\d{2}-\d{2}/.test(fields.application_deadline)) {
      deadline = fields.application_deadline.substring(0, 10);
    } else {
      deadline = null;
    }
  }

  const updatePayload = {
    updated_at: now,
  };

  if (fields.title || fields.name) {
    updatePayload.name = (fields.title || fields.name).trim();
  }
  if (fields.slug) updatePayload.slug = fields.slug.trim().toLowerCase();
  if (providerId !== undefined) updatePayload.provider_id = providerId;
  if (institutionId !== undefined) {
    updatePayload.institution_id = institutionId;
    updatePayload.institution_specific = !!institutionId;
  }
  if (fields.institution_category) updatePayload.institution_category_restriction = fields.institution_category;
  if (fields.scope || fields.geographic_scope) {
    updatePayload.geographic_scope = fields.scope || fields.geographic_scope;
  }
  if (fields.funding_type) updatePayload.funding_type = fields.funding_type;
  if (fields.status || fields.application_status) {
    updatePayload.application_status = fields.status || fields.application_status;
  }
  if (fields.gender_eligibility) updatePayload.gender_eligibility = fields.gender_eligibility;
  if (fields.is_verified !== undefined) {
    updatePayload.verification_status = fields.is_verified ? 'verified' : 'needs_verification';
  }
  if (fields.is_featured !== undefined) updatePayload.is_featured = !!fields.is_featured;
  if (fields.is_published !== undefined) updatePayload.is_published = fields.is_published;
  if (fields.official_url || fields.application_url) {
    updatePayload.application_url = (fields.official_url || fields.application_url).trim();
  }
  if (fields.information_url !== undefined) updatePayload.information_url = fields.information_url;
  if (fields.description || fields.full_description) {
    updatePayload.full_description = fields.description || fields.full_description;
    updatePayload.short_description = (fields.description || fields.full_description).substring(0, 160);
  }
  if (fields.short_description) updatePayload.short_description = fields.short_description;
  if (fields.eligibility_criteria !== undefined || fields.eligibility_requirements !== undefined) {
    updatePayload.eligibility_requirements = Array.isArray(fields.eligibility_criteria)
      ? fields.eligibility_criteria.join('\n')
      : (fields.eligibility_requirements || fields.eligibility_criteria || null);
  }
  if (fields.host_country !== undefined) {
    updatePayload.host_country = fields.host_country || 'Ghana';
  }
  if (fields.target_countries !== undefined) {
    updatePayload.target_countries = Array.isArray(fields.target_countries)
      ? fields.target_countries
      : [fields.target_countries || 'Ghana'];
  }
  if (fields.benefits !== undefined) {
    updatePayload.benefits = Array.isArray(fields.benefits) ? fields.benefits : (fields.benefits ? [fields.benefits] : null);
  }
  if (fields.required_documents !== undefined) {
    updatePayload.required_documents = Array.isArray(fields.required_documents) ? fields.required_documents : (fields.required_documents ? [fields.required_documents] : null);
  }
  if (fields.application_process !== undefined) {
    updatePayload.application_process = Array.isArray(fields.application_process) ? fields.application_process : (fields.application_process ? [fields.application_process] : null);
  }
  if (fields.deadline_text !== undefined) updatePayload.deadline_text = fields.deadline_text;
  if (deadline !== undefined) {
    updatePayload.application_deadline = deadline;
  }

  // Apply logo changes
  updatePayload.logo_url = finalLogoUrl;
  updatePayload.logo_storage_path = finalStoragePath;
  updatePayload.logo_alt_text = finalAltText;
  if (fields.logo_url !== undefined) {
    updatePayload.logo_updated_at = now;
  }

  // 4. Execute database update
  let updateQuery = supabaseAdmin.from('scholarships').update(updatePayload);
  if (isUuid) {
    updateQuery = updateQuery.eq('id', current.id);
  } else {
    updateQuery = updateQuery.eq('slug', current.slug);
  }

  const { data: updated, error: updateError } = await updateQuery.select().single();

  if (updateError || !updated) {
    console.error('updateScholarship error:', updateError);
    throw new AppError(`Failed to update scholarship: ${updateError?.message}`, 500);
  }

  // Handle study levels join table if provided
  if (Array.isArray(fields.study_levels)) {
    try {
      await supabaseAdmin.from('scholarship_study_levels').delete().eq('scholarship_id', current.id);
      if (fields.study_levels.length > 0) {
        const rows = fields.study_levels.map((lvl) => ({
          scholarship_id: current.id,
          level: lvl,
        }));
        await supabaseAdmin.from('scholarship_study_levels').insert(rows);
      }
    } catch (lvlErr) {
      console.warn('Study levels update notice:', lvlErr.message);
    }
  }

  res.status(200).json({
    success: true,
    message: 'Scholarship updated successfully.',
    data: {
      ...updated,
      provider: fields.provider || current.name,
      institution: fields.institution || '',
    },
  });
});

/**
 * DELETE /api/scholarships/:idOrSlug
 * Delete a scholarship from Supabase and clean up its logo from Storage.
 */
export const deleteScholarship = asyncHandler(async (req, res) => {
  const { idOrSlug } = req.params;
  if (!idOrSlug) throw new AppError('Scholarship identifier is required.', 400);

  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(idOrSlug);

  // Fetch record first to get logo_storage_path for cleanup
  let query = supabaseAdmin.from('scholarships').select('id, slug, logo_storage_path');
  if (isUuid) {
    query = query.eq('id', idOrSlug);
  } else {
    query = query.eq('slug', idOrSlug);
  }
  const { data: record } = await query.maybeSingle();

  if (record) {
    // Clean up logo from storage if present
    if (record.logo_storage_path && !record.logo_storage_path.startsWith('local_')) {
      try {
        await supabaseAdmin.storage.from(LOGO_BUCKET).remove([record.logo_storage_path]);
      } catch (e) {
        console.warn('Logo cleanup warning during delete:', e.message);
      }
    }

    // Delete record from Supabase
    let delQuery = supabaseAdmin.from('scholarships').delete();
    if (isUuid) {
      delQuery = delQuery.eq('id', record.id);
    } else {
      delQuery = delQuery.eq('slug', record.slug);
    }
    const { error: delError } = await delQuery;
    if (delError) {
      throw new AppError(`Failed to delete scholarship: ${delError.message}`, 500);
    }
  }

  res.status(200).json({
    success: true,
    message: 'Scholarship deleted successfully.',
  });
});
