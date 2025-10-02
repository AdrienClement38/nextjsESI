#!/bin/bash

set -e

# Load development environment variables
if [ -f .env.dev ]; then
  export $(cat .env.dev | grep -v '^#' | xargs)
fi

echo "🚀 Starting development environment..."
echo ""

docker compose -f docker-compose.yml -f docker-compose.dev.yml --profile dev up
