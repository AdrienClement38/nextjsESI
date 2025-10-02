FROM postgres:16-alpine

# Install postgresql-contrib for additional extensions
RUN apk add --no-cache postgresql-contrib

# Copy initialization script
COPY init.sql /docker-entrypoint-initdb.d/

# Healthcheck using pg_isready
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=3 \
  CMD pg_isready -U postgres || exit 1

EXPOSE 5432
