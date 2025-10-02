#!/bin/sh
set -e

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL..."
until PGPASSWORD=$(cat /run/secrets/db_password) psql -h "db" -U "postgres" -c '\q' 2>/dev/null; do
  echo "PostgreSQL is unavailable - sleeping"
  sleep 1
done

echo "PostgreSQL is up - continuing"

# Create tmp/pids directory if it doesn't exist
mkdir -p tmp/pids

# Remove pre-existing server.pid
if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

# Execute the main command
exec "$@"
