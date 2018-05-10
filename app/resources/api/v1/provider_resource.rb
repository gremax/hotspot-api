# frozen_string_literal: true

module Api
  module V1
    class ProviderResource < JSONAPI::Resource
      attributes :name, :api_key, :api_secret, :api_public, :company_id,
                 :created_at, :updated_at

      has_one :company
      has_one :current_action
    end
  end
end
