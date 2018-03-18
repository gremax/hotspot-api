# frozen_string_literal: true

module Api
  module V1
    class AdminResource < JSONAPI::Resource
      attributes :active, :email, :first_name, :last_name, :password
    end
  end
end
