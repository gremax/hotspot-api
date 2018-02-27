module Api
  module V1
    class BaseController < ApiController
      include JSONAPI::Utils
      include AuthenticatedRequest

      after_action :verify_authorized, except: :index
      after_action :verify_policy_scoped, only: :index
    end
  end
end
