# frozen_string_literal: true

module Api
  module V1
    class CompanySerializer < BaseSerializer
      attributes :name, :active, :owner_id, :owner_name, :created_at, :updated_at

      has_one :owner, class_name: Admin.name
      has_many :places

      attribute :owner_name do |object|
        "#{object.owner.first_name} #{object.owner.last_name}"
      end
    end
  end
end
