document.addEventListener('DOMContentLoaded', () => {
    const contactForm = document.getElementById('footer-contact-form');

    if (contactForm) {
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();

            const btn = contactForm.querySelector('button[type="submit"]');
            const originalText = btn.innerHTML;

            // Collect mock data
            const formData = new FormData(contactForm);
            const data = Object.fromEntries(formData);

            // Console log to verify we are catching it (Developer debug)
            console.log('Sending message to API...', data);

            /*
            TODO: Implement real backend handler
            Example:
            fetch('https://api.emailjs.com/api/v1.0/email/send', {
                method: 'POST', body: ...
            })
            */

            // UI Feedback
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Sending...';
            btn.style.opacity = '0.7';
            btn.disabled = true;

            // Mock network request delay
            setTimeout(() => {
                btn.innerHTML = '<i class="fas fa-check"></i> Sent!';
                btn.style.backgroundColor = '#10B981'; // Success Green
                btn.style.color = '#ffffff';
                contactForm.reset();

                setTimeout(() => {
                    btn.innerHTML = originalText;
                    btn.style.backgroundColor = '';
                    btn.style.color = '';
                    btn.style.opacity = '1';
                    btn.disabled = false;
                }, 3000);

            }, 1000);
        });
    }
});
