# frozen_string_literal: true

class Role < ApplicationRecord
  AVAILABLE_ROLES = %w[account_admin company_admin place_admin].freeze

  has_many :admins, through: :admins_roles, class_name: Admin.name
  belongs_to :resource, polymorphic: true, optional: true

  validates :resource_type, inclusion: { in: Rolify.resource_types }, allow_nil: true
  validates :name, inclusion: { in: AVAILABLE_ROLES }

  scopify
end
