#!/bin/bash

# Prompt for the project name
echo "Enter the name of your Vue project:"
read PROJECT_NAME

# Create a new Vue project using Vite
npm create vite@latest "$PROJECT_NAME" -- --template vue

# Change directory into the new project folder
cd "$PROJECT_NAME" || exit

# Install dependencies
npm install

# Install Tailwind CSS, PostCSS, and autoprefixer
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest

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

# Add Tailwind to `main.js`
sed -i "1iimport './index.css';" src/main.js

echo "Tailwind CSS setup is complete. You can now run your Vue project."

