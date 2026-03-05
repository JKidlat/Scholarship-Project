document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('global-search');
    const searchDropdown = document.getElementById('search-results');

    if (!searchInput || !searchDropdown) return;

    // Relative path correction for detail links based on current folder
    const inCategoryFolder = window.location.pathname.includes('/categories/');
    const pfx = inCategoryFolder ? '../' : '';

    const renderResults = (results, query) => {
        searchDropdown.innerHTML = '';

        if (results.length === 0) {
            searchDropdown.innerHTML = `<div class="no-results">No scholarships found matching "${query}"</div>`;
        } else {
            results.slice(0, 5).forEach(res => {
                const titleMatch = res.name.replace(new RegExp(query, 'gi'), match => `<span class="highlight">${match}</span>`);

                const item = document.createElement('a');
                item.href = pfx + res.detailPageLink;
                item.className = 'search-result-item';
                item.innerHTML = `
                    <div class="search-result-title">${titleMatch}</div>
                    <div class="search-result-meta">
                        <span><i class="fas fa-graduation-cap"></i> ${res.institutionLevel}</span>
                        <span><i class="fas fa-tag"></i> ${res.scholarshipType}</span>
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

    // Debounce to improve performance typing
    let debounceTimer;

    searchInput.addEventListener('input', (e) => {
        clearTimeout(debounceTimer);
        const query = e.target.value.toLowerCase().trim();

        if (!query) {
            searchDropdown.classList.remove('active');
            return;
        }

        debounceTimer = setTimeout(() => {
            const data = window.scholarshipsData || [];

            const results = data.filter(s => {
                const nameMatch = s.name.toLowerCase().includes(query);
                const elibMatch = s.eligibility.some(req => req.toLowerCase().includes(query));
                const catMatch = s.category.toLowerCase().includes(query);
                return nameMatch || elibMatch || catMatch;
            });

            renderResults(results, query);
        }, 300);
    });

    // Close dropdown on outside click
    document.addEventListener('click', (e) => {
        if (!searchInput.contains(e.target) && !searchDropdown.contains(e.target)) {
            searchDropdown.classList.remove('active');
        }
    });

    // Re-open on focus if it has value
    searchInput.addEventListener('focus', () => {
        if (searchInput.value.trim() && searchDropdown.children.length > 0) {
            searchDropdown.classList.add('active');
        }
    });
});
