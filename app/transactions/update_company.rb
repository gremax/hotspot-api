# frozen_string_literal: true

class UpdateCompany
  include Dry::Transaction

  step :assign_attributes
  step :validate
  step :persist
  step :display

  def assign_attributes(input)
    company = Company.find(input[:id])
    company.assign_attributes(input[:params])
    Success(company)
  end

  def validate(entity)
    form = CompanyForm.new(entity)

    if form.valid?
      Success(form)
    else
      Failure(form)
    end
  end

  def persist(form)
    form.save
    Success(form)
  end

  def display(form)
    Success(form.model)
  end
end
