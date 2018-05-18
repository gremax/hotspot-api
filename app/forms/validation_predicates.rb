# frozen_string_literal: true

module ValidationPredicates
  include Dry::Logic::Predicates

  predicate(:record?) do |klass, value|
    klass.where(id: value).any?
  end
end
