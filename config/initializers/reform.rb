# frozen_string_literal: true

Rails.application.config.reform.validations = :dry

Dry::Validation::Schema::Form.configure do |config|
  config.messages = :i18n
end
