# GitHub Pages Static Deployment - CORRECT STEPS

## The Problem:
You're seeing the source HTML file instead of the built files. You need to deploy the `dist` folder, NOT the root directory.

## Correct Deployment Steps:

### Step 1: Build the project
```bash
npm run build
```

### Step 2: Go into the dist folder
```bash
cd dist
```

### Step 3: Initialize git (if not already done)
```bash
git init
git checkout -b gh-pages
```

### Step 4: Add and commit files
```bash
git add .
git commit -m "Deploy to GitHub Pages"
```

### Step 5: Add remote (if not already added)
```bash
git remote add origin https://github.com/saurabh701/private-temp.git
```

### Step 6: Push to gh-pages branch
```bash
git push -f origin gh-pages
```

### Step 7: Configure GitHub Pages
1. Go to: https://github.com/saurabh701/private-temp/settings/pages
2. **Source**: Select "Deploy from a branch"
3. **Branch**: Select `gh-pages`
4. **Folder**: Select `/ (root)` 
5. Click **Save**

## Important Notes:

⚠️ **CRITICAL**: You MUST deploy from inside the `dist` folder, NOT from the root directory!

The `dist/index.html` file has the correct paths:
- `/private-temp/assets/index-XXXXX.js`
- `/private-temp/assets/index-XXXXX.css`

The root `index.html` file has wrong paths:
- `/src/main.jsx` ❌ (this is for development only)

## Quick One-Liner (from project root):

```bash
npm run build && cd dist && git init && git checkout -b gh-pages && git add . && git commit -m "Deploy" && git remote add origin https://github.com/saurabh701/private-temp.git 2>/dev/null; git push -f origin gh-pages
```

## Verify Deployment:

After pushing, check that:
1. The `gh-pages` branch contains only files from `dist/`
2. The `index.html` in `gh-pages` has paths like `/private-temp/assets/...`
3. Wait 1-2 minutes for GitHub Pages to update
4. Visit: https://saurabh701.github.io/private-temp/
