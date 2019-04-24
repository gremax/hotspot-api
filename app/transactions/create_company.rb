# frozen_string_literal: true

class CreateCompany
  include Dry::Transaction

  step :validate
  step :persist
  step :update_roles
  step :display

  def validate(input)
    form = CompanyForm.new(input[:params])

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

  def update_roles(form)
    owner = form.model.owner
    owner.add_role(:company_admin, form.model)
    Success(form)
  end

  def display(form)
    Success(form.model)
  end
end
