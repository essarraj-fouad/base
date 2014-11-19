source 'https://rubygems.org'

unless ENV['CI']
  ruby '2.2.0'
end

gem 'rails', '4.2.0.beta4'

gem 'bootstrap-sass'
gem 'cancancan'
gem 'devise'
gem 'haml-rails'
gem 'hirb'
gem 'jquery-rails'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'pg'
gem 'pry-rails'
gem 'redcarpet'
gem 'sass-rails', '~> 5.0.0.beta1'

group :assets do
  gem 'coffee-rails'
  gem 'jquery-ui-rails'
  gem 'uglifier'
end

group :production do
  gem 'dalli'
  gem 'memcachier'
  gem 'newrelic_rpm'
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'rubocop',           require: false
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'poltergeist'
  gem 'rspec-its'
  gem 'syntax'
  gem 'timecop'
  gem 'validation_matcher'

  # alternative DBs for CI
  gem 'mysql2'
  gem 'sqlite3'
end
