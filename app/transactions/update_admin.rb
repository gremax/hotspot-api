# frozen_string_literal: true

class UpdateAdmin
  include Dry::Transaction

  step :assign_attributes
  step :validate
  step :persist
  step :display

  def assign_attributes(input)
    admin = Admin.find(input[:id])
    admin.assign_attributes(input[:params])
    Success(admin)
  end

  def validate(entity)
    form = AdminForm.new(entity)

    if form.valid?
      Success(form)
    else
      Failure(form)
    end
  end

  def persist(form)
    form.save
    Success(form)
  rescue ActiveRecord::RecordNotUnique
    form.errors.add(:email, 'has already been taken')
    Failure(form)
  end

  def display(form)
    Success(form.model)
  end
end
