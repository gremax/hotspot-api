# frozen_string_literal: true

module Api
  module V1
    class RouterSerializer < BaseSerializer
      attributes :name, :username, :place_id, :status, :last_pinged_at,
                 :created_at, :updated_at

      has_one :place
    end
  end
end
