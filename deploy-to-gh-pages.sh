#!/bin/bash

set -e  # Exit on error

echo "🚀 GitHub Pages Deployment Script"
echo "=================================="
echo ""

# Step 1: Build the project
echo "📦 Step 1: Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"
echo ""

# Step 2: Verify dist folder contents
echo "📋 Step 2: Verifying static files..."
cd dist

if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found in dist folder!"
    exit 1
fi

if [ ! -d "assets" ]; then
    echo "❌ Error: assets folder not found in dist folder!"
    exit 1
fi

echo "✅ Static files verified:"
echo "   - index.html"
echo "   - assets/ (JS and CSS files)"
echo "   - .nojekyll"
echo ""

# Step 3: Check HTML content
echo "🔍 Step 3: Verifying HTML paths..."
if grep -q "/private-temp/assets/" index.html; then
    echo "✅ HTML has correct asset paths (/private-temp/assets/)"
else
    echo "⚠️  Warning: HTML might not have correct base path!"
    echo "   Current paths in index.html:"
    grep -E "(src=|href=)" index.html | head -3
fi
echo ""

# Step 4: Initialize git repository
echo "📝 Step 4: Setting up git repository..."
if [ -d ".git" ]; then
    echo "   Git repository already exists, reinitializing..."
    rm -rf .git
fi

git init
git checkout -b gh-pages 2>/dev/null || git checkout -b gh-pages

# Step 5: Add and commit files
echo "📝 Step 5: Adding files to git..."
git add .
git commit -m "Deploy to GitHub Pages - $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null || git commit --amend -m "Deploy to GitHub Pages - $(date '+%Y-%m-%d %H:%M:%S')" --no-edit

echo ""
echo "✅ Git repository ready!"
echo ""

# Step 6: Show deployment instructions
echo "=================================="
echo "📤 READY TO DEPLOY!"
echo "=================================="
echo ""
echo "The dist folder is now ready with:"
echo "  ✓ index.html (with correct /private-temp/ paths)"
echo "  ✓ assets/ folder (JS and CSS bundles)"
echo "  ✓ .nojekyll file"
echo ""
echo "Next steps:"
echo ""
echo "1. Add remote (if not already added):"
echo "   git remote add origin https://github.com/saurabh701/private-temp.git"
echo ""
echo "2. Push to gh-pages branch:"
echo "   git push -f origin gh-pages"
echo ""
echo "3. Configure GitHub Pages:"
echo "   - Go to: https://github.com/saurabh701/private-temp/settings/pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: gh-pages"
echo "   - Folder: / (root)"
echo "   - Click Save"
echo ""
echo "4. Wait 1-2 minutes for GitHub Pages to update"
echo ""
echo "5. Visit your site:"
echo "   https://saurabh701.github.io/private-temp/"
echo ""
echo "=================================="
