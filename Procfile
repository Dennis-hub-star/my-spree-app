release: bin/rails db:migrate
web: bundle exec puma -C config/puma.rb
worker: bin/rake sidekiq
cache: bin/rails cache:clear
release: bundle exec rails db:seed
web: bundle exec puma -C config/puma.rb

