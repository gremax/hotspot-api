# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < BaseController
      def index
        companies = policy_scope(Company).all
        render json: CompanySerializer.new(companies).serialized_json
      end

      def show
        company = authorize Company.find(params[:id])
        render json: CompanySerializer.new(company).serialized_json
      end

      def create
        company = authorize Company.new(resource_params)
        CreateCompany.new.call(params: company) do |m|
          m.success do |value|
            render json: CompanySerializer.new(value).serialized_json, status: :created
          end

          m.failure do |value|
            render json: ErrorSerializer.new(value).serialized_json, status: :unprocessable_entity
          end
        end
      end

      def update # rubocop:disable AbcSize
        company = authorize Company.find(params[:id])
        UpdateCompany.new.call(id: company.id, params: resource_params) do |m|
          m.success do |value|
            render json: CompanySerializer.new(value).serialized_json
          end

          m.failure do |value|
            render json: ErrorSerializer.new(value).serialized_json, status: :unprocessable_entity
          end
        end
      end

      def destroy
        company = authorize Company.find(params[:id])
        company.destroy

        head :no_content
      end

      private

      def resource_params
        params
          .require(:data)
          .require(:attributes)
          .permit(
            :ownerId,
            :active,
            :name
          ).transform_keys(&:underscore)
      end
    end
  end
end
