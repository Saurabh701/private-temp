# Valentine Proposal App 💕

A fun and romantic single-page React app to ask someone to be your Valentine!

## Features

- Beautiful gradient background
- "Yes" button that shows a success message when clicked
- "No" button that jumps to random positions when hovered over
- Smooth animations and transitions
- Responsive design

## Getting Started

1. Install dependencies:
```bash
npm install
```

2. Start the development server:
```bash
npm run dev
```

3. Open your browser and navigate to the URL shown in the terminal (usually http://localhost:5173)

## Build for Production

```bash
npm run build
```

The built files will be in the `dist` directory.

## Deploy to GitHub Pages

The app is configured to deploy automatically to GitHub Pages using GitHub Actions.

### Setup Instructions:

1. **Push your code to GitHub** (if you haven't already):
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Enable GitHub Pages in your repository**:
   - Go to your repository on GitHub
   - Click on **Settings** → **Pages**
   - Under **Source**, select **GitHub Actions**
   - Save the settings

3. **The deployment will happen automatically** when you push to the `main` branch

4. **Your app will be available at**: `https://saurabh701.github.io/private-temp/`

### Manual Deployment (Alternative):

If you prefer to deploy manually:

```bash
npm run build
# Then push the dist folder to the gh-pages branch
```

**Note**: The `base: '/private-temp/'` in `vite.config.js` is required for GitHub Pages to work correctly with the subdirectory path.

## Technologies Used

- React 18
- Vite
- CSS3 Animations
