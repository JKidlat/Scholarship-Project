document.addEventListener('DOMContentLoaded', () => {

    // Relative path helper
    const inCategoryFolder = window.location.pathname.includes('/categories/');
    const pfx = inCategoryFolder ? '../' : '';

    // 1. Grid Rendering Strategy (for index.js featured or category pages)
    const gridEl = document.getElementById('scholarship-grid');

    const renderGrid = (sourceData) => {
        if (!gridEl || !sourceData) return;
        gridEl.innerHTML = '';

        const limitCount = gridEl.getAttribute('data-limit') ? parseInt(gridEl.getAttribute('data-limit')) : null;
        let catFilter = gridEl.getAttribute('data-category');

        let targetData = sourceData;
        if (catFilter) {
            targetData = targetData.filter(d => d.category === catFilter);
            if (limitCount && targetData.length > limitCount) {
                targetData = targetData.slice(0, limitCount);
            }
        } else {
            // Featured grid logic: 2 open scholarships per category
            const openScholarships = sourceData.filter(s => s.badgeClass && s.badgeClass.includes('status-open'));
            const byCategory = {};
            openScholarships.forEach(s => {
                if (!byCategory[s.category]) byCategory[s.category] = [];
                byCategory[s.category].push(s);
            });

            let selected = [];
            for (const cat in byCategory) {
                const categoryItems = byCategory[cat].sort(() => 0.5 - Math.random());
                selected = selected.concat(categoryItems.slice(0, 2));
            }
            
            // Random arrangement of the final selection
            targetData = selected.sort(() => 0.5 - Math.random());
            
            if (limitCount && targetData.length > limitCount) {
                targetData = targetData.slice(0, limitCount);
            }
        }

        targetData.forEach(s => {
            gridEl.innerHTML += `
                <div class="scholarship-card reveal" data-category="${s.category}">
                    <div class="card-badge">${s.badges}</div>
                    <div class="card-category-dot">${s.category.toUpperCase()}</div>
                    <h3>${s.name}</h3>
                    <div class="card-meta">
                        <div class="meta-item">
                            <i class="far fa-folder"></i> Category: ${s.category}
                        </div>
                    </div>
                    <p style="color: var(--text-muted); margin-bottom: 2rem; font-size: 0.95rem;">
                        ${s.shortDescription}
                    </p>
                    <a href="${s.link}" class="btn btn-primary mt-auto">View Category</a>
                </div>
            `;
        });

        // Re-init observer and tilt
        if (window.observeNewElements) window.observeNewElements();
        if (window.initTilt) setTimeout(window.initTilt, 100);
    };

    if (window.liveScholarshipsScraped) {
        renderGrid(window.liveScholarshipsScraped);
    } else {
        document.addEventListener('scholarshipsLoaded', () => {
            renderGrid(window.liveScholarshipsScraped);
        });
    }


    // 2. Detail Page Payload Strategy
    const detailContainer = document.getElementById('scholarship-detail');
    if (detailContainer && window.scholarshipsData) {
        const urlParams = new URLSearchParams(window.location.search);
        const sid = urlParams.get('id');

        if (sid) {
            const dataEntry = window.scholarshipsData.find(d => d.id === sid);
            if (dataEntry) {
                // Populate the detail HTML Template
                document.title = `${dataEntry.name} - Ghana Scholarship Portal`;

                document.getElementById('det-title').innerText = dataEntry.name;
                document.getElementById('det-category').innerText = dataEntry.category.toUpperCase();
                document.getElementById('det-type').innerText = dataEntry.scholarshipType;
                document.getElementById('det-level').innerText = dataEntry.institutionLevel;
                document.getElementById('det-deadline').innerText = dataEntry.applicationDeadline;
                document.getElementById('det-desc').innerText = dataEntry.shortDescription;

                const reqUl = document.getElementById('det-reqs');
                reqUl.innerHTML = '';
                dataEntry.requirements.forEach(r => {
                    reqUl.innerHTML += `<li><i class="fas fa-check-circle" style="color:var(--secondary-color);"></i> ${r}</li>`;
                });

                const eligUl = document.getElementById('det-elig');
                eligUl.innerHTML = '';
                dataEntry.eligibility.forEach(e => {
                    eligUl.innerHTML += `<li><i class="fas fa-user-check" style="color:var(--primary-color);"></i> ${e}</li>`;
                });

                document.getElementById('det-apply-btn').href = dataEntry.applicationLink;
            } else {
                detailContainer.innerHTML = `<div class="text-center" style="padding: 10rem 0"><h2>Scholarship Not Found</h2><a href="index.html" class="btn btn-primary mt-4">Return Home</a></div>`;
            }
        } else {
            detailContainer.innerHTML = `<div class="text-center" style="padding: 10rem 0"><h2>Invalid Scholarship ID</h2><a href="index.html" class="btn btn-primary mt-4">Return Home</a></div>`;
        }
    }
});
