# frozen_string_literal: true

module Api
  module V1
    class SettingResource < JSONAPI::Resource
      attributes :available_providers, :eligible_actions, :providers
    end
  end
end
