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
        form = PlaceForm.new(place)

        if form.valid? && place.save
          jsonapi_render json: place, status: :created
        else
          jsonapi_render_errors ::Exceptions::FormErrors.new(form), status: :unprocessable_entity
        end
      end

      def update; end

      def destroy; end
    end
  end
end
