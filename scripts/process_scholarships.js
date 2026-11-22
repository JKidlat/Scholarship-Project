import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Helper to generate URL slugs
function generateSlug(title) {
  return title
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

// Custom CSV row parser handling quotes and commas
function parseCSV(text) {
  const lines = [];
  let row = [];
  let inQuotes = false;
  let currentField = '';

  for (let i = 0; i < text.length; i++) {
    const char = text[i];
    const nextChar = text[i + 1];

    if (char === '"') {
      if (inQuotes && nextChar === '"') {
        currentField += '"';
        i++; // skip escaped quote
      } else {
        inQuotes = !inQuotes;
      }
    } else if (char === ',' && !inQuotes) {
      row.push(currentField);
      currentField = '';
    } else if ((char === '\r' || char === '\n') && !inQuotes) {
      if (char === '\r' && nextChar === '\n') {
        i++;
      }
      row.push(currentField);
      if (row.some(cell => cell.trim().length > 0)) {
        lines.push(row);
      }
      row = [];
      currentField = '';
    } else {
      currentField += char;
    }
  }

  if (currentField.length > 0 || row.length > 0) {
    row.push(currentField);
    lines.push(row);
  }

  return lines;
}

// Read raw CSV
const csvPath = path.join(__dirname, '../data/local_scholarships_ghana.csv');
const rawCSV = fs.readFileSync(csvPath, 'utf8');

const allRows = parseCSV(rawCSV);
const header = allRows[0].map(h => h.trim());

// Identify rows belonging to scholarship opportunities (rows starting with GH001... or NEW)
const dataRows = [];
for (let i = 1; i < allRows.length; i++) {
  const row = allRows[i];
  if (!row || row.length < 5) continue;
  
  // Find record ID (usually in last column or row[19])
  const title = row[0]?.trim();
  const provider = row[1]?.trim();
  const sourceId = row[19]?.trim() || (row[0].startsWith('GH') ? row[0] : `ROW_${i}`);

  // Skip metadata lines or empty lines
  if (!title || title === 'Field' || title === 'ID' || title === 'Source' || title.startsWith('Research date')) {
    continue;
  }

  dataRows.push({
    title: row[0]?.trim(),
    provider: row[1]?.trim(),
    official_url: row[2]?.trim(),
    scope: row[3]?.trim(),
    funding_type_raw: row[4]?.trim(),
    institution_raw: row[5]?.trim(),
    institution_category_raw: row[6]?.trim(),
    host_country: row[7]?.trim() || 'Ghana',
    deadline_raw: row[8]?.trim(),
    study_levels_raw: row[9]?.trim(),
    fields_raw: row[10]?.trim(),
    gender_raw: row[11]?.trim(),
    description_raw: row[12]?.trim(),
    eligibility_raw: row[13]?.trim(),
    benefits_raw: row[14]?.trim(),
    documents_raw: row[15]?.trim(),
    verification_raw: row[16]?.trim(),
    evidence_raw: row[17]?.trim(),
    notes_raw: row[18]?.trim(),
    source_id: sourceId,
  });
}

console.log(`Parsed ${dataRows.length} scholarship data rows from CSV.`);

// Categorisation & Normalisation engine
const scholarships = dataRows.map((r, index) => {
  const title = r.title;
  const slugBase = generateSlug(title);
  const slug = `${slugBase}-${r.source_id.toLowerCase().replace(/[^a-z0-9]/g, '')}`;

  // 1. Study Levels mapping
  const levels = [];
  const levelText = `${r.study_levels_raw || ''} ${r.title} ${r.eligibility_raw || ''}`.toLowerCase();
  if (levelText.includes('shs') || levelText.includes('secondary') || levelText.includes('pre-university')) levels.push('shs');
  if (levelText.includes('diploma') || levelText.includes('hnd')) levels.push('diploma');
  if (levelText.includes('vocational') || levelText.includes('tvet') || levelText.includes('technical')) levels.push('vocational');
  if (levelText.includes('undergraduate') || levelText.includes('bachelor') || levelText.includes('degree') || levelText.includes('tertiary')) levels.push('undergraduate');
  if (levelText.includes('postgraduate') || levelText.includes('graduate')) levels.push('postgraduate');
  if (levelText.includes('master') || levelText.includes('mphil')) levels.push('masters');
  if (levelText.includes('phd') || levelText.includes('doctor')) levels.push('phd');
  if (levelText.includes('postdoctoral')) levels.push('postdoctoral');
  if (levels.length === 0) levels.push('undergraduate');

  // 2. Funding Type mapping
  let funding_type = 'partially_funded';
  const fundingText = `${r.funding_type_raw || ''} ${r.benefits_raw || ''} ${r.title}`.toLowerCase();
  if (fundingText.includes('loan') || title.toLowerCase().includes('loan')) {
    funding_type = 'loan';
  } else if (fundingText.includes('full') || fundingText.includes('comprehensive') || fundingText.includes('fully funded')) {
    funding_type = 'fully_funded';
  } else if (fundingText.includes('bursary') || title.toLowerCase().includes('bursary')) {
    funding_type = 'bursary';
  } else if (fundingText.includes('grant') || title.toLowerCase().includes('grant')) {
    funding_type = 'grant';
  } else if (fundingText.includes('tuition only') || fundingText.includes('tuition fees')) {
    funding_type = 'tuition_only';
  } else if (fundingText.includes('fellowship') || title.toLowerCase().includes('fellowship')) {
    funding_type = 'fellowship';
  } else if (fundingText.includes('research')) {
    funding_type = 'research';
  }

  // 3. Institution-specific detection
  let institution_specific = false;
  let institution_name = null;
  const instText = `${r.institution_raw || ''} ${title}`.toLowerCase();
  if (instText.includes('university of ghana') || instText.includes('ugbs') || instText.includes(' ug ') || instText.endsWith(' ug')) {
    institution_specific = true;
    institution_name = 'University of Ghana';
  } else if (instText.includes('knust') || instText.includes('kwame nkrumah')) {
    institution_specific = true;
    institution_name = 'Kwame Nkrumah University of Science and Technology';
  } else if (instText.includes('ucc') || instText.includes('cape coast')) {
    institution_specific = true;
    institution_name = 'University of Cape Coast';
  } else if (instText.includes('uew') || instText.includes('winneba')) {
    institution_specific = true;
    institution_name = 'University of Education, Winneba';
  } else if (instText.includes('uhas') || instText.includes('health and allied')) {
    institution_specific = true;
    institution_name = 'University of Health and Allied Sciences';
  } else if (instText.includes('uds') || instText.includes('development studies')) {
    institution_specific = true;
    institution_name = 'University for Development Studies';
  } else if (instText.includes('umat') || instText.includes('mines and technology')) {
    institution_specific = true;
    institution_name = 'University of Mines and Technology';
  } else if (instText.includes('ashesi')) {
    institution_specific = true;
    institution_name = 'Ashesi University';
  } else if (instText.includes('upsa') || instText.includes('professional studies')) {
    institution_specific = true;
    institution_name = 'University of Professional Studies, Accra';
  } else if (instText.includes('lancaster')) {
    institution_specific = true;
    institution_name = 'Lancaster University Ghana';
  } else if (instText.includes('ttu') || instText.includes('takoradi technical')) {
    institution_specific = true;
    institution_name = 'Takoradi Technical University';
  } else if (instText.includes('gctu') || instText.includes('communication technology')) {
    institution_specific = true;
    institution_name = 'Ghana Communication Technology University';
  }

  // 4. Gender eligibility
  let gender_eligibility = 'all';
  const genderText = `${r.gender_raw || ''} ${r.title} ${r.eligibility_raw || ''}`.toLowerCase();
  if (genderText.includes('female only') || genderText.includes('female applicants only') || genderText.includes('women only') || genderText.includes('girls') || genderText.includes('women in stem') || genderText.includes('african female')) {
    gender_eligibility = 'women';
  } else if (genderText.includes('priority stem, women') || genderText.includes('women priority')) {
    gender_eligibility = 'women_priority';
  }

  // 5. Public / Private school specificity
  let public_school_specific = false;
  const pubText = `${r.institution_category_raw || ''} ${r.eligibility_raw || ''} ${r.notes_raw || ''}`.toLowerCase();
  if (pubText.includes('public tertiary') || pubText.includes('public-school') || pubText.includes('less-endowed') || pubText.includes('government shs')) {
    public_school_specific = true;
  }

  // 6. Application status
  let application_status = 'unannounced';
  const statusText = `${r.verification_raw || ''} ${r.deadline_raw || ''}`.toLowerCase();
  let deadline = null;

  if (statusText.includes('open; deadline 27 nov 2026') || r.deadline_raw?.includes('27 Nov 2026')) {
    application_status = 'open';
    deadline = '2026-11-27';
  } else if (statusText.includes('closed') || statusText.includes('passed')) {
    application_status = 'closed';
    if (r.deadline_raw?.includes('19 Oct 2026')) deadline = '2026-10-19';
    if (r.deadline_raw?.includes('29 Jul 2026')) deadline = '2026-07-29';
  } else if (statusText.includes('recurring') || statusText.includes('not stated') || statusText.includes('ongoing')) {
    application_status = 'rolling';
  } else if (statusText.includes('historical') || statusText.includes('suspended')) {
    application_status = 'archived';
  }

  // 7. Verification Status
  let verification_status = 'needs_verification';
  const verText = `${r.verification_raw || ''} ${r.evidence_raw || ''}`.toLowerCase();
  if (verText.includes('official') || verText.includes('open; deadline') || verText.includes('confirmed')) {
    verification_status = 'verified';
  } else if (verText.includes('lead only') || verText.includes('broken/incorrect')) {
    verification_status = 'under_review';
  }

  // 8. Fields of study
  const fields = [];
  const fieldText = `${r.fields_raw || ''} ${r.title} ${r.eligibility_raw || ''}`.toLowerCase();
  if (fieldText.includes('stem') || fieldText.includes('engineering') || fieldText.includes('mathematics') || fieldText.includes('technology') || fieldText.includes('science')) {
    fields.push('Engineering', 'Science', 'Computer Science and IT');
  }
  if (fieldText.includes('business') || fieldText.includes('ugbs') || fieldText.includes('administration') || fieldText.includes('accounting')) {
    fields.push('Business and Management');
  }
  if (fieldText.includes('medicine') || fieldText.includes('health') || fieldText.includes('nursing') || fieldText.includes('pharmacy')) {
    fields.push('Medicine and Health Sciences');
  }
  if (fieldText.includes('law')) {
    fields.push('Law');
  }
  if (fieldText.includes('agriculture')) {
    fields.push('Agriculture');
  }
  if (fields.length === 0) {
    fields.push('All Fields');
  }

  // 9. Required documents array
  const documents = [];
  if (r.documents_raw && !r.documents_raw.includes('Not specified')) {
    r.documents_raw.split(',').forEach(d => {
      const clean = d.trim();
      if (clean) documents.push(clean);
    });
  }
  if (documents.length === 0) {
    documents.push('Admission Letter', 'Academic Transcript / WASSCE Results', 'Proof of Ghanaian Citizenship');
  }

  // 10. Benefits array
  const benefits = [];
  if (r.benefits_raw && !r.benefits_raw.includes('Not specified')) {
    r.benefits_raw.split(',').forEach(b => {
      const clean = b.trim();
      if (clean) benefits.push(clean);
    });
  } else {
    benefits.push('Tuition fee support');
  }

  // 11. Publishing status
  // Genuine, actionable opportunities are published; raw duplicates or leads flagged as broken are kept in admin queue
  let is_published = true;
  if (r.notes_raw?.includes('broken/incorrect') || r.notes_raw?.includes('suspended historically') || r.notes_raw?.includes('Do not publish as active')) {
    is_published = false;
  }

  // 12. Featured opportunities (prominent flagship scholarships)
  const is_featured = [
    'GH001', 'GH003', 'GH004', 'GH005', 'GH006', 'GH009', 'GH016', 'GH017', 'GH040', 'GH047', 'GH053'
  ].includes(r.source_id);

  return {
    id: `sch_${r.source_id.toLowerCase().replace(/[^a-z0-9]/g, '_')}`,
    source_id: r.source_id,
    slug,
    title: r.title,
    provider: r.provider,
    official_url: r.official_url && r.official_url.startsWith('http') ? r.official_url : null,
    geographic_scope: 'local',
    funding_type,
    institution: institution_name || (institution_specific ? r.institution_raw : null),
    institution_category: r.institution_category_raw?.toLowerCase().includes('university') ? 'public_university' : 'other',
    institution_specific,
    public_school_specific,
    host_country: 'Ghana',
    study_levels: Array.from(new Set(levels)),
    fields_of_study: Array.from(new Set(fields)),
    gender_eligibility,
    application_status,
    application_deadline: deadline,
    deadline_text: r.deadline_raw,
    description: r.description_raw || `Scholarship opportunity offered by ${r.provider} for Ghanaian students pursuing academic studies.`,
    eligibility_requirements: r.eligibility_raw || 'Ghanaian citizen enrolled or admitted to an accredited tertiary institution.',
    benefits,
    required_documents: documents,
    verification_status,
    evidence_strength: r.evidence_raw,
    research_notes: r.notes_raw,
    is_published,
    is_featured,
    created_at: new Date('2026-11-18T12:00:00Z').toISOString(),
    updated_at: new Date('2026-11-18T12:00:00Z').toISOString(),
  };
});

// Output summary
console.log(`Successfully generated ${scholarships.length} categorised scholarships.`);
const openCount = scholarships.filter(s => s.application_status === 'open').length;
const closedCount = scholarships.filter(s => s.application_status === 'closed').length;
const rollingCount = scholarships.filter(s => s.application_status === 'rolling').length;
const womenCount = scholarships.filter(s => s.gender_eligibility === 'women' || s.gender_eligibility === 'women_priority').length;
const instCount = scholarships.filter(s => s.institution_specific).length;
const verifiedCount = scholarships.filter(s => s.verification_status === 'verified').length;

console.log(`Statistics:
- Open: ${openCount}
- Closed: ${closedCount}
- Rolling/Recurring: ${rollingCount}
- For Women: ${womenCount}
- Institution-specific: ${instCount}
- Verified: ${verifiedCount}`);

// Save to src/data/scholarships_seed.json
const outDir = path.join(__dirname, '../src/data');
if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

const seedPath = path.join(outDir, 'scholarships_seed.json');
fs.writeFileSync(seedPath, JSON.stringify(scholarships, null, 2), 'utf8');
console.log(`Seed data saved to ${seedPath}`);
