source "https://rubygems.org"

gem "rails", "5.2.3"

gem "active_model_serializers", "~> 0.10.0"
gem "annotate"
gem "bootstrap-sass"
gem "devise"
gem "draper"
gem "haml-rails"
gem "jquery-rails"
gem "redis"
gem "redis-namespace"
gem "redis-rack-cache"
gem "redis-rails"
gem "sass-rails"
gem "sidekiq"
gem "sinatra", github: "sinatra/sinatra"
gem "sqlite3"
gem "uglifier"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "letter_opener"
  gem "pry-rails"
  gem "rails-erd"
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "faker"
  gem "listen"
  gem "pry-byebug"
  gem "rspec-rails"
  gem 'rspec-sidekiq'
  gem "rubocop"
  gem "simplecov"
end

group :test do
  gem "shoulda-matchers"
  gem 'database_cleaner'
end
