# frozen_string_literal: true

module Api
  module V1
    class SettingsPresenter
      attr_reader :id, :admin, :company

      def initialize(company, context)
        @id = company.id
        @admin = context[:admin]
        @company = CompanyDecorator.new(company)
      end

      def providers
        company.current_providers
      end

      def available_providers
        Provider::AVAILABLE_NAMES
      end

      def eligible_actions
        Provider::ELIGIBLE_ACTIONS
      end
    end
  end
end
