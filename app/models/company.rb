# frozen_string_literal: true

class Company < ApplicationRecord
  resourcify

  belongs_to :owner, class_name: Admin.name, dependent: :destroy
end
