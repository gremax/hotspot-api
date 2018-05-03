# frozen_string_literal: true

class Provider < ApplicationRecord
  AVAILABLE_NAMES = %w[facebook twitter instagram].freeze

  ELIGIBLE_ACTIONS = {
    'facebook' => %w[post join like],
    'twitter' => %w[tweet retweet follow like],
    'instagram' => %w[post follow like]
  }.freeze

  belongs_to :company
  has_many :actions, dependent: :destroy

  def current_action
    actions.find_by(current: true)
  end
end
