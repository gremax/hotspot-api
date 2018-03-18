# frozen_string_literal: true

class JsonWebTokenStrategy < ::Warden::Strategies::Base
  def authenticate!
    if _user
      success!(_user)
    else
      fail!('Authentication failed for token')
    end
  end

  def store?
    false
  end

  def valid?
    env['HTTP_AUTHORIZATION'].present?
  end

  private

  def _user
    @user ||= Admin.find(decoded_jwt[:user_id]) if decoded_jwt
  end

  def decoded_jwt
    @decoded_jwt ||= JsonWebToken.decode(jwt_from_header)
  end

  def jwt_from_header
    env['HTTP_AUTHORIZATION'].split(' ').last
  end
end
