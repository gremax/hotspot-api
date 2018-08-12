# frozen_string_literal: true

module Api
  module V1
    class ErrorSerializer
      attr_reader :object

      def initialize(object)
        @object = object
      end

      def serialized_json
        { errors: errors }
      end

      def errors
        object.errors.messages.map do |attribute, errors|
          {
            id: attribute,
            title: errors.first,
            detail: "#{attribute.capitalize} #{errors.first}",
            source: { pointer: "/data/attributes/#{attribute}" }
          }
        end
      end
    end
  end
end
