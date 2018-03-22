# frozen_string_literal: true

class CompanyForm < Reform::Form
  property :name
  property :owner_id

  validation do
    required(:name).filled
    required(:owner_id).filled
  end
end
