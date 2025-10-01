FROM ruby:3.2-alpine

WORKDIR /app

# Installer dépendances système (Postgres + build tools + libyaml)
RUN apk add --no-cache \
  build-base \
  postgresql-dev \
  libxml2-dev \
  libxslt-dev \
  yaml-dev \
  tzdata \
  git \
  bash

# Copier Gemfile et installer les gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copier tout le code du backend
COPY . .

# Lancer le serveur Rails
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
