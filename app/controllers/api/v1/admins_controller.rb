# frozen_string_literal: true

module Api
  module V1
    class AdminsController < BaseController
      def index
        admins = policy_scope(Admin).all
        render json: AdminSerializer.new(admins).serialized_json
      end

      def show
        admin = authorize Admin.find(params[:id])
        render json: AdminSerializer.new(admin).serialized_json
      end

      def create
        admin = authorize Admin.new(resource_params)
        CreateAdmin.new.call(params: admin) do |m|
          m.success do |value|
            render json: AdminSerializer.new(value).serialized_json, status: :created
          end

          m.failure do |value|
            render json: ErrorSerializer.new(value).serialized_json, status: :unprocessable_entity
          end
        end
      end

      def update # rubocop:disable AbcSize
        admin = authorize Admin.find(params[:id])
        UpdateAdmin.new.call(id: admin.id, params: resource_params) do |m|
          m.success do |value|
            render json: AdminSerializer.new(value).serialized_json
          end

          m.failure do |value|
            render json: ErrorSerializer.new(value).serialized_json, status: :unprocessable_entity
          end
        end
      end

      def destroy; end

      private

      def resource_params
        params
          .require(:data)
          .require(:attributes)
          .permit(
            :active,
            :email,
            :firstName,
            :lastName,
            :password
          ).transform_keys(&:underscore)
      end
    end
  end
end
