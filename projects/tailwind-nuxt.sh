# install nuxt in workspace root
npx nuxi init
git add .
git commit -m "install nuxt"

# TODO: move all nuxt-app files out of sub-folder back into root

# install tailwind
npm i -D tailwindcss postcss autoprefixer
npx tailwindcss init
git add .
git commit -m "install tailwind"

# add tailwind to postcss config
cat <<EOT > nuxt.config.ts
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
})
EOT
git add .
git commit -m "add tailwind to postcss config"

# configure template paths
cat <<EOT > tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./components/**/*.{js,vue,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./app.vue",
    "./error.vue",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOT
git add .
git commit -m "configure template paths"

# add tailwind directives to css
mkdir assets
mkdir assets/css
cat <<EOT > ./assets/css/main.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOT
git add .
git commit -m "add tailwind directives to css"

# add the css file globally
cat <<EOT > nuxt.config.js
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  css: ['~/assets/css/main.css'],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
})
EOT
git add .
git commit -m "add the css file globally"

# install tailwindui
npm install @headlessui/vue @heroicons/vue
git add .
git commit -m "install tailwindui"

# make sure all dependencies are installed
npm i
