# frozen_string_literal: true

class CreateAdmin
  include Dry::Transaction

  step :validate
  step :persist
  step :display

  def validate(input)
    form = AdminForm.new(input[:params])

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
