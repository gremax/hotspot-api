module Api
  module V1
    class AdminsController < BaseController
      def index
        jsonapi_render json: policy_scope(Admin).all
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
