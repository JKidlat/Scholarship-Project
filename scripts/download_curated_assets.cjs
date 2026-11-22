const https = require('https');
const fs = require('fs');
const path = require('path');

const ASSETS = [
  // Hero section image: African students collaborating on campus with books and digital tools
  {
    url: 'https://images.unsplash.com/photo-1531482615713-2afd69097998?auto=format&fit=crop&w=1200&q=80',
    dest: 'public/images/hero/african_students_hero.jpg',
    description: 'African university students collaborating in academic workspace'
  },
  {
    url: 'https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=800&q=80',
    dest: 'public/images/hero/students_study_group.jpg',
    description: 'University scholars discussing academic research on campus'
  },

  // Category Thumbnails: High-quality photographic representations
  {
    url: 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=600&q=80',
    dest: 'public/images/categories/undergraduate.jpg',
    description: 'Undergraduate student graduate in academic gown holding degree'
  },
  {
    url: 'https://images.unsplash.com/photo-1532619675605-1ede6c2ed2b0?auto=format&fit=crop&w=600&q=80',
    dest: 'public/images/categories/postgraduate.jpg',
    description: 'Postgraduate researcher reviewing academic literature in university library'
  },
  {
    url: 'https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?auto=format&fit=crop&w=600&q=80',
    dest: 'public/images/categories/international.jpg',
    description: 'Global study abroad destinations and passport to international scholarship'
  },
  {
    url: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=600&q=80',
    dest: 'public/images/categories/women_in_education.jpg',
    description: 'African female scholar and academic leader in lecture setting'
  },
  {
    url: 'https://images.unsplash.com/photo-1562774053-701939374585?auto=format&fit=crop&w=600&q=80',
    dest: 'public/images/categories/institution_specific.jpg',
    description: 'Historic university campus faculty quadrangle and lecture halls'
  },
  {
    url: 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=600&q=80',
    dest: 'public/images/categories/public_institution.jpg',
    description: 'Public university main campus building with students walking'
  },
  {
    url: 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?auto=format&fit=crop&w=600&q=80',
    dest: 'public/images/categories/science_engineering.jpg',
    description: 'Laboratory research equipment and scientific discovery'
  },
  {
    url: 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?auto=format&fit=crop&w=600&q=80',
    dest: 'public/images/categories/law_social_sciences.jpg',
    description: 'Law and social sciences library reference archive'
  },

  // About and Mission imagery
  {
    url: 'https://images.unsplash.com/photo-1498243691581-b145c3f54a5a?auto=format&fit=crop&w=1000&q=80',
    dest: 'public/images/about/university_library_hall.jpg',
    description: 'Expansive historic university research library'
  },
  {
    url: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1000&q=80',
    dest: 'public/images/about/students_mentorship.jpg',
    description: 'Student academic mentorship and study team collaborating'
  },

  // Contact support imagery
  {
    url: 'https://images.unsplash.com/photo-1534536281715-e28d76689b4d?auto=format&fit=crop&w=800&q=80',
    dest: 'public/images/contact/advising_helpdesk.jpg',
    description: 'Academic advisor and student services consultation desk'
  }
];

function download(url, dest) {
  return new Promise((resolve, reject) => {
    const dir = path.dirname(dest);
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }

    const file = fs.createWriteStream(dest);
    https.get(url, (response) => {
      if (response.statusCode >= 300 && response.statusCode < 400 && response.headers.location) {
        // Handle redirect
        https.get(response.headers.location, (redirectRes) => {
          redirectRes.pipe(file);
          file.on('finish', () => {
            file.close(resolve);
          });
        }).on('error', (err) => {
          fs.unlink(dest, () => {});
          reject(err);
        });
      } else if (response.statusCode === 200) {
        response.pipe(file);
        file.on('finish', () => {
          file.close(resolve);
        });
      } else {
        fs.unlink(dest, () => {});
        reject(new Error(`Failed to download ${url}: status code ${response.statusCode}`));
      }
    }).on('error', (err) => {
      fs.unlink(dest, () => {});
      reject(err);
    });
  });
}

async function main() {
  console.log(`Starting download of ${ASSETS.length} curated educational assets...`);
  for (const asset of ASSETS) {
    try {
      console.log(`Downloading: ${asset.dest}`);
      await download(asset.url, asset.dest);
      const stats = fs.statSync(asset.dest);
      console.log(`✓ Saved ${asset.dest} (${Math.round(stats.size / 1024)} KB)`);
    } catch (err) {
      console.error(`✗ Error downloading ${asset.dest}:`, err.message);
    }
  }
  console.log('All curated assets processed successfully!');
}

main();
