# frozen_string_literal: true

class Provider < ApplicationRecord
  belongs_to :company
  has_many :actions, dependent: :destroy
end
