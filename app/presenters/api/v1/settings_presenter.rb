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
    end
  end
end
