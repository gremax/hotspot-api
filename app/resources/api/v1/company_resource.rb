# frozen_string_literal: true

module Api
  module V1
    class CompanyResource < JSONAPI::Resource
      attributes :name, :active, :created_at
    end
  end
end
