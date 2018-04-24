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
        CreateAdmin.new.call(params: admin) do |m|
          m.success do |value|
            jsonapi_render json: value, status: :created
          end

          m.failure do |value|
            jsonapi_render_errors ::Exceptions::FormErrors.new(value), status: :unprocessable_entity
          end
        end
      end

      def update
        admin = authorize Admin.find(params[:id])
        UpdateAdmin.new.call(id: admin.id, params: resource_params) do |m|
          m.success do |value|
            jsonapi_render json: value
          end

          m.failure do |value|
            jsonapi_render_errors ::Exceptions::FormErrors.new(value), status: :unprocessable_entity
          end
        end
      end

      def destroy; end
    end
  end
end
