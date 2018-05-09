# frozen_string_literal: true

module Api
  module V1
    class SettingResource < JSONAPI::Resource
      has_many :providers
    end
  end
end
