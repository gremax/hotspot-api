# frozen_string_literal: true

module Api
  module V1
    class PlacesController < BaseController
      def index
        jsonapi_render json: policy_scope(Place).all
      end

      def show
        place = authorize Place.find(params[:id])
        jsonapi_render json: place
      end

      def create
        place = authorize Place.new(resource_params)
        CreatePlace.new.call(params: place) do |m|
          m.success do |value|
            jsonapi_render json: value, status: :created
          end

          m.failure do |value|
            jsonapi_render_errors ::Exceptions::FormErrors.new(value), status: :unprocessable_entity
          end
        end
      end

      def update; end

      def destroy; end
    end
  end
end
