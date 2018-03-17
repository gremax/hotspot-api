# frozen_string_literal: true

class Place < ApplicationRecord
  belongs_to :company
  has_many :routers, dependent: :destroy
end
