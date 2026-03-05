const fs = require('fs');

const categories = ['male', 'female', 'mixed', 'international', 'private', 'public'];
const levels = ['Undergraduate', 'Postgraduate', 'PhD', 'Diploma', 'Certificate', 'High School'];
const types = ['Full Funding', 'Partial Funding', 'Tuition Only', 'Living Stipend'];

const categoryTitles = {
    male: "Male Scholar Initiative",
    female: "Women in STEM Leadership",
    mixed: "National Excellence Award",
    international: "Global Perspective Grant",
    private: "Private Tertiary Innovators Fund",
    public: "Public University Merit Scholarship"
};

const categoryDescriptions = {
    male: "Empowering young men to achieve academic excellence and community leadership in Ghana.",
    female: "Breaking barriers for Ghanaian women pursuing higher education in competitive fields.",
    mixed: "A merit-based open scholarship for all high-achieving Ghanaian students.",
    international: "Supporting international students contributing to cultural diversity in Ghana.",
    private: "Financial assistance for brilliant students attending accredited private universities.",
    public: "Recognizing outstanding academic performance in Ghana's public tertiary institutions."
};

const scholarships = [];
let idCounter = 1;

categories.forEach(cat => {
    for (let i = 1; i <= 10; i++) {
        const idStr = `SCH-${idCounter.toString().padStart(4, '0')}`;
        scholarships.push({
            id: idStr,
            name: `${categoryTitles[cat]} - Cohort ${i} (2026)`,
            shortDescription: categoryDescriptions[cat],
            eligibility: [
                "Must be a registered full-time student",
                "Minimum CGPA of 3.0 or equivalent",
                "Demonstrated financial need",
                "Active in community service or extracurriculars"
            ],
            requirements: [
                "Completed online application form",
                "Two academic letters of recommendation",
                "Official academic transcripts",
                "Personal statement essay (500 words)"
            ],
            applicationDeadline: `2026-${(i % 12 + 1).toString().padStart(2, '0')}-30`,
            scholarshipType: types[i % types.length],
            institutionLevel: levels[i % levels.length],
            category: cat,
            applicationLink: "#apply",
            detailPageLink: `scholarship.html?id=${idStr}`
        });
        idCounter++;
    }
});

const content = `// Auto-generated 60 scholarship placeholders
window.scholarshipsData = ${JSON.stringify(scholarships, null, 4)};\n`;

fs.writeFileSync('ghana-scholarship-portal/js/data-placeholders.js', content);
console.log("data-placeholders.js successfully generated with 60 entries.");
