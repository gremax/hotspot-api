# frozen_string_literal: true

module Api
  module V1
    class AdminsController < BaseController
      def index
        jsonapi_render json: policy_scope(Admin).all
      end

      def show
        admin = authorize Admin.find(params[:id])
        jsonapi_render json: admin
      end

      def create
        admin = authorize Admin.new(resource_params)
        form = AdminForm.new(admin)

        if form.valid? && admin.save
          jsonapi_render json: admin, status: :created
        else
          jsonapi_render_errors ::Exceptions::FormErrors.new(form), status: :unprocessable_entity
        end
      end

      def update
      end

      def destroy
      end
    end
  end
end
