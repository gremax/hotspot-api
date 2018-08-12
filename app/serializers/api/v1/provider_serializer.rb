# frozen_string_literal: true

module Api
  module V1
    class ProviderSerializer < BaseSerializer
      attributes :name, :api_key, :api_secret, :api_public, :company_id,
                 :created_at, :updated_at, :current_action

      has_one :company
    end
  end
end
