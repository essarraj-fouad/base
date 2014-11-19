require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'

require 'rails/application'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :poltergeist
OmniAuth.config.test_mode = true

RSpec.configure do |config|
  config.filter_run focus: true
  config.infer_spec_type_from_file_location!

  config.run_all_when_everything_filtered = true
  config.use_transactional_fixtures       = false

  # This is Dev Fu!, we don't `expect` around here!
  config.expect_with(:rspec) { |c| c.syntax = :should }
  config.mock_with(:rspec)   { |c| c.syntax = :should }

  config.include FactoryGirl::Syntax::Methods

  config.before :suite do
    DatabaseCleaner.strategy = :truncation
  end

  config.before :each do
    SimpleCov.command_name "RSpec:#{ Process.pid }#{ ENV['TEST_ENV_NUMBER'] }"
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
