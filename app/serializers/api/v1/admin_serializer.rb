# frozen_string_literal: true

module Api
  module V1
    class AdminSerializer < BaseSerializer
      attributes :active, :email, :first_name, :last_name, :password
    end
  end
end
