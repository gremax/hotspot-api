# frozen_string_literal: true

class ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :jsonapi_render_not_found
  rescue_from ActionController::ParameterMissing, with: :missing_param_error
  rescue_from Pundit::NotAuthorizedError, with: :jsonapi_render_not_found

  def missing_param_error(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end
end
