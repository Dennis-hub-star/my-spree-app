#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install --deployment
bin/rails assets:precompile
bin/rails assets:clean

bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails spree_sample:load
