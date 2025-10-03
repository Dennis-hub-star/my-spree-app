release: bin/rails db:migrate
web: bundle exec puma -C config/puma.rb
worker: bin/rake sidekiq
cache: bin/rails cache:clear
release: bundle exec rails db:seed && bundle exec rails spree_sample:load
web: bundle exec puma -C config/puma.rb
