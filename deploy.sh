#!/bin/bash

set -e  # Exit on any error

echo "🚀 GitHub Pages Deployment"
echo "==========================="
echo ""

# Step 1: Clean and build
echo "📦 Step 1: Building project..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"
echo ""

# Step 2: Verify dist folder
echo "🔍 Step 2: Verifying dist folder..."
cd dist

# Remove any existing git folder to start fresh
if [ -d ".git" ]; then
    echo "   Removing existing .git folder..."
    rm -rf .git
fi

# Verify required files exist
if [ ! -f "index.html" ]; then
    echo "❌ index.html not found!"
    exit 1
fi

if [ ! -d "assets" ]; then
    echo "❌ assets folder not found!"
    exit 1
fi

if [ ! -f ".nojekyll" ]; then
    echo "   Creating .nojekyll file..."
    echo '' > .nojekyll
fi

echo "✅ All required files present"
echo ""

# Step 3: Verify HTML paths
echo "🔍 Step 3: Verifying HTML paths..."
if grep -q "/private-temp/assets/" index.html; then
    echo "✅ HTML has correct asset paths"
else
    echo "❌ HTML paths are incorrect!"
    echo "   Current paths:"
    grep -E "(src=|href=)" index.html
    exit 1
fi
echo ""

# Step 4: Initialize git
echo "📝 Step 4: Setting up git repository..."
git init
git checkout -b gh-pages 2>/dev/null || git checkout -b gh-pages

# Step 5: Add files
echo "📝 Step 5: Adding files..."
git add .
git commit -m "Deploy to GitHub Pages - $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null || git commit --amend -m "Deploy to GitHub Pages - $(date '+%Y-%m-%d %H:%M:%S')" --no-edit

echo ""
echo "==========================="
echo "✅ READY TO DEPLOY!"
echo "==========================="
echo ""
echo "Files ready in dist folder:"
echo "  ✓ index.html"
echo "  ✓ assets/ (JS and CSS)"
echo "  ✓ .nojekyll"
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
echo "   https://github.com/saurabh701/private-temp/settings/pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: gh-pages"
echo "   - Folder: / (root)"
echo ""
echo "4. Wait 1-2 minutes, then visit:"
echo "   https://saurabh701.github.io/private-temp/"
echo ""
