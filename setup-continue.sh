#!/bin/bash
set -e

echo "Continuing setup after R2..."

# Create D1 database
echo "Creating D1 database..."
npx wrangler d1 create cloudflare-rag

# Create KV namespace
echo "Creating KV namespace for rate limiting..."
npx wrangler kv namespace create rate-limiter

echo "Setup partially complete!"
echo "Please:"
echo "1. Enable R2 in your Cloudflare dashboard at https://dash.cloudflare.com/"
echo "2. Run: npx wrangler r2 bucket create cloudflare-rag-bucket"
echo "3. Update the IDs in wrangler.toml"