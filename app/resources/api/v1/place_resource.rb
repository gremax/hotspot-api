# frozen_string_literal: true

module Api
  module V1
    class PlaceResource < JSONAPI::Resource
      attributes :name, :active, :company_id, :created_at, :updated_at

      has_one :company
      has_many :routers
    end
  end
end
