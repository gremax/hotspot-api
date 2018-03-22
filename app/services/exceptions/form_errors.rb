# frozen_string_literal: true

module Exceptions
  class FormErrors < ::JSONAPI::Exceptions::Error
    attr_reader :object

    def initialize(object)
      @object = object
    end

    def errors
      object.errors.messages.map do |attribute, errors|
        JSONAPI::Error.new(
          id: attribute,
          title: errors.first,
          detail: "#{attribute.capitalize} #{errors.first}",
          status: :unprocessable_entity,
          source: { pointer: "/data/attributes/#{attribute}" }
        )
      end
    end
  end
end
