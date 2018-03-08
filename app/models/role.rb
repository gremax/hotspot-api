# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :admins, through: :admins_roles, class_name: Admin.name
  belongs_to :resource, polymorphic: true, optional: true

  validates :resource_type, inclusion: { in: Rolify.resource_types }, allow_nil: true

  scopify
end
