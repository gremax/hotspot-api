# frozen_string_literal: true

require 'apartment/elevators/generic'

Apartment.configure do |config|
  config.excluded_models = %w[Account]
  config.tenant_names = -> { Account.pluck :subdomain }
  config.persistent_schemas = ['shared_extensions']
end

Rails.application.config.middleware.use Apartment::Elevators::Generic, lambda { |request|
  URI.parse(request.referer).host.split('.').first
}
