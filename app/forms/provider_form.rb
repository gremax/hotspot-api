# frozen_string_literal: true

class ProviderForm < Reform::Form
  property :company_id
  property :name
  property :api_key
  property :api_secret
  property :api_public

  validation do
    configure do
      predicates(ValidationPredicates)
    end

    required(:company_id).filled(record?: Company)
    required(:name).filled(included_in?: Provider::AVAILABLE_NAMES)
  end
end
