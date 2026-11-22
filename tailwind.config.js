/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        navy: {
          deep: '#050D2B',
          dark: '#0B1740',
        },
        royal: '#173A8A',
        gold: {
          DEFAULT: '#FFC928',
          bright: '#FFD84D',
        },
        surface: {
          light: '#F5F7FC',
        },
        content: {
          main: '#101828',
          muted: '#667085',
        },
        border: {
          DEFAULT: '#E4E7EC',
        },
        status: {
          success: '#12A36D',
          warning: '#E9A23B',
          error: '#D92D20',
        },
      },
      fontFamily: {
        heading: ['Montserrat', 'sans-serif'],
        body: ['Inter', 'sans-serif'],
      },
    },
  },
  plugins: [],
};
