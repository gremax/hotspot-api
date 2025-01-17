# frozen_string_literal: true

class JsonWebToken
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.credentials.config[:secret_key_base])
  end

  def self.decode(token)
    body = JWT.decode(token, Rails.application.credentials.config[:secret_key_base])[0]
    HashWithIndifferentAccess.new(body)
  rescue StandardError
    nil
  end
end
