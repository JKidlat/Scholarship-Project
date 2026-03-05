# Ghana Scholarship Portal

A modern, mobile-first, production-ready scholarship portal built exclusively with HTML, Vanilla CSS, and pure JavaScript. Designed and implemented for Ghanaian students seeking financial aid opportunities.

## Features
- **Client-Side Search:** Instant debounce-backed search by title or eligibility via a globally accessible search bar and intelligent dropdown.
- **Dynamic Content:** A master `data-placeholders.js` file driving 60+ scholarship instances across multiple templated views (index, categories, and detailed views).
- **Responsive Design:** Custom grid system adjusting to mobile, tablet, and desktop viewports, with a mobile-hamburger menu explicitly crafted without heavy CSS frameworks.
- **3D Tilt & Animations:** Implementation of Intersection Observer API for scroll reveals, coupled with pure vanilla javascript 3D tilt effects on scholarship cards.
- **Dark Mode:** A native CSS-variable based dark mode toggle leveraging localStorage for persistence across pages.
- **Contact Forms:** Foundation layout and UI mock for an EmailJS or custom API backend footer contact.

## Project Structure

```
/ghana-scholarship-portal
├── index.html                  # Main Landing Page
├── about.html                  # About Us
├── scholarship.html            # Dynamic detail template (reads ?id=SCH-XXXX)
├── categories/                 # Categorized Listing Views
│   ├── female.html
│   ├── international.html
│   ├── male.html
│   ├── mixed.html
│   ├── private.html
│   └── public.html
├── css/
│   └── style.css               # Core styling, variables, resets
├── js/
│   ├── animations.js           # Tilt & scroll reveals
│   ├── contact.js              # Mock footer form handling
│   ├── data-placeholders.js    # The singular data source 
│   ├── filters.js              # Renders grids and details from data source
│   ├── main.js                 # Dark mode & sticky header
│   └── search.js               # Search debouncing and dropdown inject
```

## How to Manage Data

All scholarship data is isolated in `js/data-placeholders.js`.

To add a new scholarship:
1. Open `data-placeholders.js`.
2. Append a new object to the `window.scholarshipsData` array following the strict schema.
3. Reload the site; it will automatically be searchable and renderable.

Schema example:
```json
{
    "id": "SCH-UNIQUE-01",
    "name": "Full Ride Template Name",
    "shortDescription": "Quick excerpt...",
    "eligibility": ["Must be X", "Must have Y"],
    "requirements": ["Form A", "Form B"],
    "applicationDeadline": "2026-12-01",
    "scholarshipType": "Full Funding",
    "institutionLevel": "Undergraduate",
    "category": "public", // maps to data-category attributes
    "applicationLink": "https://external-application.com",
    "detailPageLink": "scholarship.html?id=SCH-UNIQUE-01"
}
```

## Setup & Deployment
This portal requires absolutely no build tools (`npm`, `webpack`, etc.). 

**To Run Locally:**
Simply open `index.html` in your browser. (Note: standard browsers handle local relative paths properly, but running a simple dev server like `npx serve .` or Live Server ensures the best experience routing logic).

**To Deploy:**
Drag and drop the entire `/ghana-scholarship-portal` directory into **Vercel**, **Netlify**, or **GitHub Pages**. All assets are relatively linked and instantly ready for production hosting.
