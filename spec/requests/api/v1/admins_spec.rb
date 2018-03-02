require 'rails_helper'

RSpec.describe 'Admins', type: :request do
  let!(:admin) { create(:admin) }
  let!(:jwt_token) { TokenIssuer.new(admin.email, admin.password).call }

  let(:valid_headers) { { 'HTTP_AUTHORIZATION' => jwt_token } }
  let(:invalid_headers) { { 'HTTP_AUTHORIZATION' => 'invalid-jwt' } }

  let(:parsed_response) { JSON.parse(response.body) }

  describe 'GET /admins' do
    it 'lists all the admins' do
      get api_v1_admins_path, headers: valid_headers

      expect(response).to have_http_status(200)
    end

    it 'does not list all the admins with an invalid jwt' do
      get api_v1_admins_path, headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end
  end
end
