# frozen_string_literal: true

class PlaceForm < Reform::Form
  property :name
  property :company_id

  validation do
    configure do
      def record?(klass, value)
        klass.where(id: value).any?
      end
    end

    required(:name).filled
    required(:company_id).filled(record?: Company)
  end
end
