# frozen_string_literal: true

class Admin < ApplicationRecord
  rolify

  has_secure_password

  has_many :companies, foreign_key: :owner_id, dependent: :destroy
end
