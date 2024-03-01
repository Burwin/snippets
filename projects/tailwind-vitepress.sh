# gitignore vitepress
echo "# vitepress" >> .gitignore
echo "**/.vitepress/dist" >> .gitignore
echo "**/.vitepress/cache" >> .gitignore

# install vitepress
npm add -D vitepress

# setup vitepress
npx vitepress init

# add vue as dev dependency
npm i -D vue

# Install Tailwind CSS, PostCSS, and autoprefixer
npm i -D tailwindcss postcss autoprefixer

# Create Tailwind config and PostCSS config files
npx tailwindcss init -p

# add sources to tailwind config
cat > tailwind.config.js <<EOF
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js,vue,ts,md}", "./.vitepress/theme/**/*.vue"],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

# add tailwind imports to theme css
cat > .vitepress/theme/style.css <<EOF
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

# install dependencies for TailwindUI
npm install @headlessui/vue @heroicons/vue



# Create a new Vue project using Vite
npm create vite@latest my-project -- --template vue
cd my-project





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





# setup vitepress
npx vitepress init

