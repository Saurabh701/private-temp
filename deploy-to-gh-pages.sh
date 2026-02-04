#!/bin/bash

echo "🚀 Deploying to GitHub Pages..."
echo ""

# Build the project
echo "📦 Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"
echo ""

# Navigate to dist folder
cd dist

echo "📝 Setting up git in dist folder..."
git init
git checkout -b gh-pages 2>/dev/null || git checkout gh-pages

# Add all files
git add .
git commit -m "Deploy to GitHub Pages" 2>/dev/null || git commit --amend -m "Deploy to GitHub Pages" --no-edit

echo ""
echo "✅ Files ready in dist folder!"
echo ""
echo "⚠️  IMPORTANT: Make sure you're deploying the DIST folder, not the root!"
echo ""
echo "Next steps:"
echo "1. Add remote (if not already added):"
echo "   git remote add origin https://github.com/saurabh701/private-temp.git"
echo ""
echo "2. Push to gh-pages branch:"
echo "   git push -f origin gh-pages"
echo ""
echo "3. Enable GitHub Pages:"
echo "   https://github.com/saurabh701/private-temp/settings/pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: gh-pages"
echo "   - Folder: / (root)"
echo ""
echo "Your site will be at: https://saurabh701.github.io/private-temp/"
