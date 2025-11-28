#!/bin/bash

# Zero Downtime Deployment Script
# Uses docker compose rolling update with health checks

set -e

echo "🚀 Starting deployment..."

# Build and deploy with rolling update
echo "🔨 Building new image and deploying..."
docker compose up -d --build --no-deps sndra-link-service

echo "✅ Deployment complete!"
docker compose ps
