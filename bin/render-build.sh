#!/bin/bash
set -e

# Install dependencies
echo "Installing dependencies..."
bundle install

# If we're in production, configure the production database
if [[ "$RAILS_ENV" == "production" ]]; then
  echo "Setting up PostgreSQL for production..."
  
  # Install PostgreSQL client (required for production)
  apt-get update -qq && apt-get install -y postgresql-client

  # Set up the production database and run migrations
  echo "Running database migrations..."
  rake db:create RAILS_ENV=production
  rake db:migrate RAILS_ENV=production

else
  # Set up SQLite for development and test environments
  echo "Setting up SQLite for development..."
  rake db:create RAILS_ENV=development
  rake db:migrate RAILS_ENV=development
fi

# Precompile assets for production (optional)
echo "Precompiling assets..."
RAILS_ENV=production rake assets:precompile
