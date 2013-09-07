source 'https://rubygems.org'

gem 'rails', '~> 3.2'

gem 'bootstrap-sass', '~> 2.0'
gem 'devise',         '~> 2.2.4'
gem 'haml-rails'
gem 'hirb'
gem 'jquery-rails'
gem 'pg'
gem 'pry'
gem 'pry-doc'
gem 'pry-rails'
gem 'rails_admin'
gem 'redcarpet'
gem 'sass-rails'

group :assets do
  gem 'coffee-rails'
  gem 'jquery-ui-rails'
  gem 'uglifier'
end

group :production do
  gem 'newrelic_rpm'
  gem 'unicorn'
end

group :development do
  gem 'better_errors'
  gem 'foreman'
  gem 'mailcatcher'
  gem 'pry-debugger'
  gem 'yard'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'coveralls',          require: false
  gem 'database_cleaner',   '~> 1.0.1'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'poltergeist'
  gem 'simplecov',          require: false
  gem 'syntax'
  gem 'timecop'
  gem 'validation_matcher'

  # alternative DBs for CI
  gem 'mysql2'
  gem 'sqlite3'
end
