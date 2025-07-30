#!/bin/bash
set -e

echo "Building project..."
NODE_ENV=production npx remix build

echo "Creating deployment structure..."
mkdir -p build/client
mkdir -p build/server

# Copy client assets
cp -r public/* build/client/ 2>/dev/null || true

# Move server build
if [ -f "build/index.js" ]; then
  mv build/index.js build/server/
fi

echo "Deploying to Cloudflare Pages..."
npx wrangler pages deploy build/client \
  --project-name sheet-metal-rag \
  --commit-dirty=true \
  --compatibility-date 2024-08-21

echo "Deployment complete!"
echo "Your app will be available at: https://sheet-metal-rag.pages.dev"