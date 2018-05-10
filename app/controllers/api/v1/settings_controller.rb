# frozen_string_literal: true

module Api
  module V1
    class SettingsController < BaseController
      def edit
        company = authorize Company.find(params[:id])
        settings = SettingsPresenter.new(company, current_user)
        jsonapi_render json: settings
      end
    end
  end
end
