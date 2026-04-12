document.addEventListener('DOMContentLoaded', async () => {
    const searchInput = document.getElementById('global-search');
    const searchDropdown = document.getElementById('search-results');

    // Relative path correction
    const inCategoryFolder = window.location.pathname.includes('/categories/');
    const pfx = inCategoryFolder ? '../' : '';

    // If the data is already fetched, we'll use it
    let liveScholarships = [];

    // Categories to scrape
    const categoriesToScrape = [
        'public', 'private', 'mentorship', 'female', 'general', 'international', 'postgraduate'
    ];

    const fetchAllScholarships = async () => {
        let allEntries = [];

        for (const cat of categoriesToScrape) {
            try {
                const response = await fetch(`${pfx}categories/${cat}.html`);
                if (!response.ok) continue;

                const htmlString = await response.text();
                // Parse the HTML string into a DOM element
                const parser = new DOMParser();
                const doc = parser.parseFromString(htmlString, 'text/html');

                // Query the exact structures the user is using
                const entries = doc.querySelectorAll('.scholarship-entry');

                entries.forEach((entry, index) => {
                    // Extract Title (h2 text)
                    const titleEl = entry.querySelector('h2');
                    let title = titleEl ? titleEl.innerText.trim() : `Unknown Scholarship`;
                    // Remove the leading "1. " or "2. " from the title
                    title = title.replace(/^\d+\.\s*/, '');

                    // Extract Status
                    const badgeEl = entry.querySelector('.status-badge');
                    let badgeClass = badgeEl ? badgeEl.className : '';
                    let badgeText = badgeEl ? badgeEl.innerText.trim() : 'Unknown';

                    // Description (p tag follows img)
                    const descEl = entry.querySelector('p');
                    let desc = descEl ? descEl.innerText.trim() : '';

                    // Get Eligibility items
                    const eligItems = [];
                    const h4s = entry.querySelectorAll('h4');
                    h4s.forEach(h4 => {
                        if (h4.innerText.toLowerCase().includes('eligibility')) {
                            const ul = h4.nextElementSibling;
                            if (ul && ul.tagName === 'UL') {
                                ul.querySelectorAll('li').forEach(li => eligItems.push(li.innerText.trim()));
                            }
                        }
                    });

                    // Build object
                    allEntries.push({
                        id: `${cat}-${index}`,
                        name: title,
                        category: cat,
                        shortDescription: desc,
                        badges: badgeText, // Keep status as badge text
                        badgeClass: badgeClass,
                        eligibility: eligItems,
                        // Detail page link points exactly to the anchor inside the category
                        link: `${pfx}categories/${cat}.html` // If we had hash tags we'd link them, but we link to parent page
                    });
                });
            } catch (err) {
                console.error(`Failed to fetch category ${cat}:`, err);
            }
        }
        return allEntries;
    };

    if (searchInput && searchDropdown) {

        // Let's preemptively fetch so search is fast
        fetchPromise = fetchAllScholarships().then(data => {
            liveScholarships = data;
            // Also expose it globally for the filters.js script (the featured grid)
            window.liveScholarshipsScraped = data;
            // dispatch an event in case filters is waiting
            document.dispatchEvent(new Event('scholarshipsLoaded'));
        });

        const renderResults = (results, query) => {
            searchDropdown.innerHTML = '';

            if (results.length === 0) {
                searchDropdown.innerHTML = `<div class="no-results">No scholarships found matching "${query}"</div>`;
            } else {
                results.slice(0, 5).forEach(res => {
                    const titleMatch = res.name.replace(new RegExp(query, 'gi'), match => `<span class="highlight">${match}</span>`);

                    const item = document.createElement('a');
                    item.href = res.link;
                    item.className = 'search-result-item';
                    item.innerHTML = `
                        <div class="search-result-title">${titleMatch}</div>
                        <div class="search-result-meta">
                            <span><i class="fas fa-folder"></i> ${res.category.toUpperCase()}</span>
                            <span><span class="status-badge-mini ${res.badgeClass}" style="font-size:0.7em; padding:2px 5px; border-radius:3px;">${res.badges}</span></span>
                        </div>
                    `;
                    searchDropdown.appendChild(item);
                });

                if (results.length > 5) {
                    const more = document.createElement('div');
                    more.className = 'search-result-item text-center';
                    more.style.color = 'var(--text-muted)';
                    more.innerText = `+${results.length - 5} more results.`;
                    searchDropdown.appendChild(more);
                }
            }

            searchDropdown.classList.add('active');
        };

        // Debounce logic
        let debounceTimer;

        searchInput.addEventListener('input', (e) => {
            clearTimeout(debounceTimer);
            const query = e.target.value.toLowerCase().trim();

            if (!query) {
                searchDropdown.classList.remove('active');
                return;
            }

            searchDropdown.innerHTML = '<div class="search-result-item text-center"><i class="fas fa-spinner fa-spin"></i> Searching...</div>';
            searchDropdown.classList.add('active');

            debounceTimer = setTimeout(() => {
                const results = liveScholarships.filter(s => {
                    const nameMatch = s.name.toLowerCase().includes(query);
                    const descMatch = s.shortDescription.toLowerCase().includes(query);
                    const elibMatch = s.eligibility.some(req => req.toLowerCase().includes(query));
                    return nameMatch || elibMatch || descMatch;
                });

                renderResults(results, query);
            }, 300);
        });

        document.addEventListener('click', (e) => {
            if (!searchInput.contains(e.target) && !searchDropdown.contains(e.target)) {
                searchDropdown.classList.remove('active');
            }
        });

        searchInput.addEventListener('focus', () => {
            if (searchInput.value.trim() && searchDropdown.children.length > 0) {
                searchDropdown.classList.add('active');
            }
        });
    }
});
