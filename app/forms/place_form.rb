# frozen_string_literal: true

class PlaceForm < Reform::Form
  property :name
  property :company_id

  validation do
    required(:name).filled
    required(:company_id).filled
  end
end
