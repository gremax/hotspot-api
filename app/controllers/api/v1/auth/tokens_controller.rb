# frozen_string_literal: true

module Api
  module V1
    module Auth
      class TokensController < ApiController
        include AuthenticatedRequest

        def show
          render json: { user_id: current_user.id, email: current_user.email }
        end
      end
    end
  end
end
