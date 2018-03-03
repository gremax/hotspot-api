require 'rails_helper'

RSpec.describe 'Sign In', type: :request do
  let!(:admin) { create(:admin) }
  let!(:jwt_token) { TokenIssuer.new(admin.email, admin.password).call }

  let(:parsed_response) { JSON.parse(response.body) }

  describe 'POST /api/v1/auth/sessions' do
    it 'logs in the user and returns the JSON Web Token' do
      post api_v1_auth_sessions_path,
        params: { email: admin.email, password: admin.password, format: :json },
        headers: { 'HTTP_REFERER' => 'http://hotspot.example.com' }

      expect(response).to have_http_status(200)
      expect(parsed_response).to be_eql('auth_token' => jwt_token)
    end

    it 'does not log in the user with invalid credentials' do
      post api_v1_auth_sessions_path,
        params: { email: admin.email, password: 'wrong_password', format: :json },
        headers: { 'HTTP_REFERER' => 'http://hotspot.example.com' }

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end

    it 'does not log in the user with missing parameters' do
      post api_v1_auth_sessions_path,
        params: { email: admin.email, format: :json },
        headers: { 'HTTP_REFERER' => 'http://hotspot.example.com' }


      expect(response).to have_http_status(422)
      expect(parsed_response).to be_eql('error' => 'param is missing or the value is empty: password')
    end
  end
end
