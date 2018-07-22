# frozen_string_literal: true

module Api
  module V1
    class PlacesController < BaseController
      def index
        places = policy_scope(Place).all
        render json: PlaceSerializer.new(places).serialized_json
      end

      def show
        place = authorize Place.find(params[:id])
        render json: PlaceSerializer.new(place).serialized_json
      end

      def create
        place = authorize Place.new(resource_params)
        CreatePlace.new.call(params: place) do |m|
          m.success do |value|
            render json: PlaceSerializer.new(value).serialized_json, status: :created
          end

          m.failure do |value|
            render json: ErrorSerializer.new(value).serialized_json, status: :unprocessable_entity
          end
        end
      end

      def update; end

      def destroy; end

      private

      def resource_params
        params
          .require(:data)
          .require(:attributes)
          .permit(
            :name,
            :active,
            :name,
            :companyId
          ).transform_keys(&:underscore)
      end
    end
  end
end
