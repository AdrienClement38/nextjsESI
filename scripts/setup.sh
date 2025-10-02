#!/bin/bash

set -e

echo "🔧 Setting up Docker project..."

# Copy .env.example to .env if it doesn't exist
if [ ! -f .env ]; then
  echo "📝 Creating .env file from .env.example..."
  cp .env.example .env
  echo "✅ .env file created"
else
  echo "ℹ️  .env file already exists"
fi

# Generate db_password if it doesn't exist
if [ ! -f secrets/db_password.txt ]; then
  echo "🔐 Generating database password..."
  echo "postgres_secret_password_2024" > secrets/db_password.txt
  chmod 600 secrets/db_password.txt
  echo "✅ Database password created"
else
  echo "ℹ️  Database password already exists"
fi

# Create Docker volumes
echo "📦 Creating Docker volumes..."
docker volume create postgres_data 2>/dev/null || echo "ℹ️  Volume postgres_data already exists"
docker volume create nginx_logs 2>/dev/null || echo "ℹ️  Volume nginx_logs already exists"

echo ""
echo "✨ Setup complete!"
echo ""
echo "Next steps:"
echo "  make dev   # Start development environment"
echo "  make prod  # Start production environment"
