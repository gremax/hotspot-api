# frozen_string_literal: true

module Api
  module V1
    class BaseSerializer
      include FastJsonapi::ObjectSerializer
    end
  end
end
