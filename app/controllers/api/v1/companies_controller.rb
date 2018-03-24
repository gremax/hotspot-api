# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < BaseController
      def index
        jsonapi_render json: policy_scope(Company).all
      end

      def show
        company = authorize Company.find(params[:id])
        jsonapi_render json: company
      end

      def create
        company = authorize Company.new(resource_params)
        CreateCompany.new.call(params: company) do |m|
          m.success do |value|
            jsonapi_render json: value, status: :created
          end

          m.failure do |value|
            jsonapi_render_errors ::Exceptions::FormErrors.new(value), status: :unprocessable_entity
          end
        end
      end

      def update
        company = authorize Company.find(params[:id])
        UpdateCompany.new.call(id: company.id, params: resource_params) do |m|
          m.success do |value|
            jsonapi_render json: value
          end

          m.failure do |value|
            jsonapi_render_errors ::Exceptions::FormErrors.new(value), status: :unprocessable_entity
          end
        end
      end

      def destroy
        company = authorize Company.find(params[:id])
        company.destroy

        head :no_content
      end
    end
  end
end
