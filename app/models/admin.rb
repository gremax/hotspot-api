class Admin < ApplicationRecord
  has_many :companies, foreign_key: :owner_id, dependent: :destroy
end
