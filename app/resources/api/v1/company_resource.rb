# frozen_string_literal: true

module Api
  module V1
    class CompanyResource < JSONAPI::Resource
      attributes :name, :active, :owner_id, :owner_name, :created_at, :updated_at

      has_one :owner, class_name: Admin.name
      has_many :places

      def owner_name
        "#{owner.first_name} #{owner.last_name}"
      end
    end
  end
end
