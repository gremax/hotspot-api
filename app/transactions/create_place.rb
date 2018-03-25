# frozen_string_literal: true

class CreatePlace
  include Dry::Transaction

  step :validate
  step :persist
  step :display

  def validate(input)
    form = PlaceForm.new(input[:params])

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
