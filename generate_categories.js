const fs = require('fs');

const categories = [
    { id: 'male', title: 'Male Scholarships', icon: 'fa-male', desc: 'Discover dedicated funding opportunities empowering young men to achieve academic excellence.' },
    { id: 'female', title: 'Female Scholarships', icon: 'fa-female', desc: 'Explore scholarships breaking barriers for Ghanaian women pursuing higher education.' },
    { id: 'mixed', title: 'Mixed Scholarships', icon: 'fa-users', desc: 'Browse merit-based open scholarships for all high-achieving Ghanaian students.' },
    { id: 'international', title: 'International Students', icon: 'fa-globe-africa', desc: 'Find support tailored for international students contributing to cultural diversity in Ghana.' },
    { id: 'private', title: 'Private University Scholarships', icon: 'fa-building', desc: 'Access financial assistance for students attending accredited private universities.' },
    { id: 'public', title: 'Public University Scholarships', icon: 'fa-university', desc: 'View funding options recognizing outstanding academic performance in public tertiary institutions.' },
    { id: 'mentorship', title: 'Mentorship Opportunities', icon: 'fa-lightbulb', desc: 'Connect with industry leaders and academic experts to guide your career and educational journey.' }
];

// Reusing this logic within the inline string processing
const get10Cards = () => {
    let result = '';
    for (let i = 1; i <= 10; i++) {
        let statusClass = 'status-open';
        let statusText = 'Open';

        if (i > 8) {
            statusClass = 'status-not-open';
            statusText = 'Not Open Yet';
        } else if (i > 6) {
            statusClass = 'status-closed';
            statusText = 'Closed';
        } else if (i > 4) {
            statusClass = 'status-passed';
            statusText = 'Deadline Passed';
        }

        result += `
                    <!-- ============================================== -->
                    <!-- SCHOLARSHIP ENTRY ${i}                             -->
                    <!-- ============================================== -->
                    <div class="scholarship-entry reveal">
                        <!-- 6. Indicator (Classes: status-open, status-closed, status-passed, status-not-open) -->
                        <span class="status-badge ${statusClass}">${statusText}</span>
                        
                        <!-- 1. Scholarship name -->
                        <h2>${i}. GHANA EDUCATION TRUST FUND (GETFund) - Placeholder</h2>
                        
                        <img src="https://pbs.twimg.com/profile_images/1389845110205071365/msROYi9R_400x400.jpg" width="150" height="150" alt="Sponsor Logo">
                        
                        <!-- 2. Short Description -->
                        <p style="color: var(--text-muted); margin-bottom: 1.5rem; font-size: 0.95rem;">
                            As it implies, this is a fund dedicated to brilliant but needy students in Ghanaian Tertiary institutions. (Lorem ipsum dolor sit amet).
                        </p>
                        
                        <!-- 3. Eligibility Criteria -->
                        <h4>Eligibility Criteria:</h4>
                        <ul style="color: var(--text-color); margin-bottom: 1.5rem; padding-left: 1.25rem; font-size: 0.9rem;" class="list-unstyled">
                            <li style="margin-bottom: 0.5rem;"><i class="fas fa-check" style="color:var(--secondary-color); margin-right: 0.5rem;"></i> Must be a Ghanaian citizen</li>
                            <li style="margin-bottom: 0.5rem;"><i class="fas fa-check" style="color:var(--secondary-color); margin-right: 0.5rem;"></i> Minimum CGPA of 3.0</li>
                        </ul>

                        <!-- 4. Requirements -->
                        <h4>Requirements for Applicants:</h4>
                        <ul style="color: var(--text-color); margin-bottom: 2rem; padding-left: 1.25rem; font-size: 0.9rem;" class="list-unstyled">
                            <li style="margin-bottom: 0.5rem;"><i class="fas fa-file-alt" style="color:var(--primary-color); margin-right: 0.5rem;"></i> Signed application letter</li>
                            <li style="margin-bottom: 0.5rem;"><i class="fas fa-file-alt" style="color:var(--primary-color); margin-right: 0.5rem;"></i> Admission letter clearly stating the programme's duration</li>
                            <li style="margin-bottom: 0.5rem;"><i class="fas fa-file-alt" style="color:var(--primary-color); margin-right: 0.5rem;"></i> Approved fee schedule e.g. 2024/2025 academic year</li>
                            <li style="margin-bottom: 0.5rem;"><i class="fas fa-file-alt" style="color:var(--primary-color); margin-right: 0.5rem;"></i> Secondary School certificate (WASSCE, CTVET...)</li>
                            <li style="margin-bottom: 0.5rem;"><i class="fas fa-file-alt" style="color:var(--primary-color); margin-right: 0.5rem;"></i> Previous academic term transcript</li>
                        </ul>

                        <!-- 5. Link placeholder -->
                        <p style="margin-top: auto;"><a href="https://scholarships.getfund.gov.gh/" target="_blank" class="btn btn-primary">Click here to apply</a></p>
                    </div>
        `;
    }
    return result;
}

const template = (cat) => `<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${cat.title} | Ghana Scholarship Portal</title>
    <!-- Fonts && Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

    <!-- Header & Navigation -->
    <header class="header">
        <div class="container nav-container">
            <a href="../index.html" class="logo">
                <i class="fas fa-graduation-cap"></i> GSP<span>.</span>
            </a>

            <nav class="nav-links">
                <a href="../index.html" class="nav-link">Home</a>
                <div class="dropdown">
                    <a href="#" class="nav-link dropdown-toggle active">Categories <i class="fas fa-chevron-down" style="font-size: 0.8em; margin-left: 5px;"></i></a>
                    <div class="dropdown-menu">
                        <a href="public.html" class="dropdown-item ${cat.id === 'public' ? 'active' : ''}">Public Univ.</a>
                        <a href="private.html" class="dropdown-item ${cat.id === 'private' ? 'active' : ''}">Private Univ.</a>
                        <a href="mentorship.html" class="dropdown-item ${cat.id === 'mentorship' ? 'active' : ''}">Mentorship</a>
                        <a href="male.html" class="dropdown-item ${cat.id === 'male' ? 'active' : ''}">Male Scholarships</a>
                        <a href="female.html" class="dropdown-item ${cat.id === 'female' ? 'active' : ''}">Female Scholarships</a>
                        <a href="mixed.html" class="dropdown-item ${cat.id === 'mixed' ? 'active' : ''}">Mixed Scholarships</a>
                        <a href="international.html" class="dropdown-item ${cat.id === 'international' ? 'active' : ''}">International Students</a>
                    </div>
                </div>
                <a href="../about.html" class="nav-link">About Us</a>
            </nav>

            <div class="header-actions">
                <div class="search-wrapper">
                    <div class="search-input-group">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" id="global-search" class="search-input" placeholder="Search scholarships...">
                    </div>
                    <!-- Search Results Dropdown -->
                    <div id="search-results" class="search-results-dropdown"></div>
                </div>

                <button id="theme-toggle" class="theme-toggle" aria-label="Toggle dark mode">
                    <i class="fas fa-moon"></i>
                </button>
                <button class="mobile-menu-btn" aria-label="Open mobile menu">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <section class="detail-header">
            <div class="container text-center reveal">
                <div class="category-icon" style="margin: 0 auto 1.5rem; background: rgba(255,255,255,0.1); color: #fff; width: 80px; height: 80px; font-size: 2rem;"><i class="fas \${cat.icon}"></i></div>
                <h1 style="font-size: 3rem; margin-bottom: 1rem;">\${cat.title}</h1>
                <p style="font-size: 1.25rem; max-width: 600px; margin: 0 auto;">\${cat.desc}</p>
            </div>
        </section>

        <section style="padding: 5rem 0;">
            <div class="container">
                <div class="text-center reveal mb-5" style="margin-bottom: 3rem;">
                    <h2 class="section-title">Available Opportunities</h2>
                </div>
                
                <!-- Notice: Edit the HTML structure directly below for each scholarship entry -->
                <div class="scholarship-grid">
\${get10Cards()}
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="../index.html" class="logo">
                        <i class="fas fa-graduation-cap"></i> GSP<span>.</span>
                    </a>
                    <p>Committed to democratizing access to higher education in Ghana through transparent scholarship listings.</p>
                </div>
                <div class="footer-links">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="../index.html">Home</a></li>
                        <li><a href="../about.html">About Us</a></li>
                        <li><a href="mentorship.html">Mentorship</a></li>
                    </ul>
                </div>
                <div class="footer-contact">
                    <h4>Contact Us</h4>
                    <form id="footer-contact-form" class="contact-form">
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" placeholder="Quick Message Email" required>
                        </div>
                        <button type="submit" class="btn btn-primary" style="width: 100%; border-radius: var(--border-radius-sm)">Send</button>
                    </form>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="../js/data-placeholders.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/animations.js"></script>
    <script src="../js/search.js"></script>
    <script src="../js/contact.js"></script>
</body>
</html>`;

categories.forEach(cat => {
    let resultHTML = template(cat);
    // Replace the literal string with the actual evaluated function result
    resultHTML = resultHTML.replace('${get10Cards()}', get10Cards());
    fs.writeFileSync(`ghana-scholarship-portal/categories/${cat.id}.html`, resultHTML);
});
