#!/bin/bash

set -e

# Load production environment variables
if [ -f .env.prod ]; then
  export $(cat .env.prod | grep -v '^#' | xargs)
fi

echo "🚀 Starting production environment..."
echo ""

docker compose -f docker-compose.yml -f docker-compose.prod.yml --profile prod up -d

echo ""
echo "✨ Production stack started!"
echo ""
echo "URLs:"
echo "  Frontend: http://localhost"
echo "  API:      http://localhost/api"
echo "  Health:   http://localhost/health"
echo ""
echo "Commands:"
echo "  make logs  # View logs"
echo "  make ps    # View status"
echo "  make stop  # Stop services"
