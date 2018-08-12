# frozen_string_literal: true

module Api
  module V1
    class SettingsSerializer < BaseSerializer
      attributes :providers
      set_type :settings

      attribute :available_providers do
        Provider::AVAILABLE_NAMES
      end

      attribute :eligible_actions do
        Provider::ELIGIBLE_ACTIONS
      end
    end
  end
end
