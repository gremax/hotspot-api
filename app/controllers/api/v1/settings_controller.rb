# frozen_string_literal: true

module Api
  module V1
    class SettingsController < BaseController
      def edit
        company = authorize Company.find(params[:id])
        settings = SettingsPresenter.new(company, current_user)
        render json: SettingsSerializer.new(settings).serialized_json
      end
    end
  end
end
