# Create a new Vue project using Vite
npm create vite@latest my-project -- --template vue
cd my-project

# Install Tailwind CSS, PostCSS, and autoprefixer
npm i -D tailwindcss postcss autoprefixer

# Create Tailwind config and PostCSS config files
npx tailwindcss init -p

# Replace the content of `tailwind.config.js` with the recommended configuration
cat <<EOT > tailwind.config.js
module.exports = {
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOT

# Replace the content of `src/index.css` with the Tailwind base styles
cat <<EOT > src/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOT

# install tailwind-ui
npm install @headlessui/vue @heroicons/vue

# install vitepress
npm add -D vitepress

# gitignore vitepress
echo "# vitepress" >> .gitignore
echo "**/.vitepress/dist" >> .gitignore
echo "**/.vitepress/cache" >> .gitignore

# setup vitepress
npx vitepress init

