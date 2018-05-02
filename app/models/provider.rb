# frozen_string_literal: true

class Provider < ApplicationRecord
  belongs_to :company
  has_many :actions, dependent: :destroy

  def current_action
    actions.find_by(current: true)
  end
end
