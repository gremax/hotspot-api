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
        form = CompanyForm.new(company)

        if form.valid? && company.save
          jsonapi_render json: company, status: :created
        else
          jsonapi_render_errors ::Exceptions::FormErrors.new(form), status: :unprocessable_entity
        end
      end

      def update
        company = authorize Company.find(params[:id])
        company.assign_attributes(resource_params)
        form = CompanyForm.new(company)

        if form.valid? && company.update(resource_params)
          jsonapi_render json: company
        else
          jsonapi_render_errors ::Exceptions::FormErrors.new(form), status: :unprocessable_entity
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
