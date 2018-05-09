# frozen_string_literal: true

module Api
  module V1
    class CompanyDecorator < ::SimpleDelegator
      def current_providers
        providers.includes(:actions)
      end
    end
  end
end
