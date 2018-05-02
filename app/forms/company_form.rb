# frozen_string_literal: true

class CompanyForm < Reform::Form
  property :name
  property :owner_id

  validation do
    configure do
      def record?(klass, value)
        klass.where(id: value).any?
      end
    end

    required(:name).filled
    required(:owner_id).filled(record?: Admin)
  end
end
