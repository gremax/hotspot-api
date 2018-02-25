module Api
  module V1
    class CompaniesController < BaseController
      before_action :set_company, only: %i[show update destroy]

      def index
        @companies = Company.all

        jsonapi_render json: @companies
      end

      def show
        jsonapi_render json: @company
      end

      def create
        @company = Company.new(company_params)

        if @company.save
          jsonapi_render json: @company, status: :created, location: @company
        else
          jsonapi_render_errors json: @company, status: :unprocessable_entity
        end
      end

      def update
        if @company.update(company_params)
          head :no_content
        else
          jsonapi_render_errors json: @company, status: :unprocessable_entity
        end
      end

      def destroy
        @company.destroy

        head :no_content
      end

      private

      def set_company
        @company = Company.find(params[:id])
      end

      def company_params
        params.require(:company).permit(:name)
      end
    end
  end
end
