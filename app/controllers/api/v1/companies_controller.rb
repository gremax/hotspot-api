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
        company = authorize Company.new(resource_params.merge(owner: current_user))

        if company.save
          jsonapi_render json: company, status: :created
        else
          jsonapi_render_errors json: company, status: :unprocessable_entity
        end
      end

      def update
        company = authorize Company.find(params[:id])
        if company.update(resource_params)
          head :no_content
        else
          jsonapi_render_errors json: company, status: :unprocessable_entity
        end
      end

      def destroy
        company = authorize Company.find(params[:id])
        company.destroy

        head :no_content
      end

      private

      def company_params
        params.require(:company).permit(:name)
      end
    end
  end
end
