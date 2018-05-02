# frozen_string_literal: true

class Provider < ApplicationRecord
  AVAILABLE_NAMES = %w[facebook twitter instagram].freeze

  belongs_to :company
  has_many :actions, dependent: :destroy

  def current_action
    actions.find_by(current: true)
  end
end
