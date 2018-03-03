require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'pundit/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Warden::Test::Helpers

  config.after(:each) do
    Warden.test_reset!
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
    Apartment::Tenant.drop('hotspot') rescue nil
    Account.create!(name: 'Hotspot', subdomain: 'hotspot')
    CreateTenant.new(Account.first).call
  end

  config.before(:each) do
    DatabaseCleaner.start
    Apartment::Tenant.switch! 'hotspot'
  end

  config.after(:each) do
    Apartment::Tenant.reset
    DatabaseCleaner.clean
  end
end
