document.addEventListener('DOMContentLoaded', () => {
    // Reveal Observer for scroll animations
    const revealOptions = {
        threshold: 0.15,
        rootMargin: "0px 0px -50px 0px"
    };

    const revealOnScroll = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
                observer.unobserve(entry.target);
            }
        });
    }, revealOptions);

    // Initial setup of statically rendered .reveal elements
    document.querySelectorAll('.reveal').forEach(el => revealOnScroll.observe(el));

    // Expose dynamically so we can observe newly generated cards
    window.observeNewElements = () => {
        document.querySelectorAll('.reveal:not(.active)').forEach(el => revealOnScroll.observe(el));
    };

    // 3D Tilt Logic
    const initTilt = () => {
        const cards = document.querySelectorAll('.scholarship-card');

        cards.forEach(card => {
            // Unbind to prevent duplicates on re-render
            const newCard = card.cloneNode(true);
            card.parentNode.replaceChild(newCard, card);

            newCard.addEventListener('mousemove', (e) => {
                const rect = newCard.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;

                const centerX = rect.width / 2;
                const centerY = rect.height / 2;

                // Max 5deg tilt, reverse inverted Y perspective
                const rotateX = ((y - centerY) / centerY) * -5;
                const rotateY = ((x - centerX) / centerX) * 5;

                newCard.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.02, 1.02, 1.02)`;
            });

            newCard.addEventListener('mouseleave', () => {
                newCard.style.transform = `perspective(1000px) rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)`;
            });
        });
    };

    // Global exposure so filters.js can init it after rendering templates
    window.initTilt = initTilt;

    // Initial call
    setTimeout(initTilt, 500);
});
