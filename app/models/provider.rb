# frozen_string_literal: true

class Provider < ApplicationRecord
  belongs_to :company
  has_one :action, dependent: :destroy
end
