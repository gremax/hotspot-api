class Company < ApplicationRecord
  belongs_to :owner, class_name: Admin.name, dependent: :destroy
end
