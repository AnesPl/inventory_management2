#!/usr/bin/env bash
bundle install
RAILS_ENV=production bin/rails db:migrate
