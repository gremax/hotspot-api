module Api
  module V1
    class BaseController < ApiController
      include JSONAPI::Utils
      include AuthenticatedRequest
    end
  end
end
