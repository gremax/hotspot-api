# frozen_string_literal: true

class CompanyForm < Reform::Form
  property :name
  property :owner_id

  validation do
    configure do
      predicates(ValidationPredicates)
    end

    required(:name).filled
    required(:owner_id).filled(record?: Admin)
  end
end
