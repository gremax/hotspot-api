require 'rails_helper'

RSpec.describe 'Places', type: :request do
  let!(:admin) { create(:admin) }
  let!(:company) { create(:company, owner: admin) }
  let!(:place) { create(:place, company: company) }
  let!(:jwt_token) { TokenIssuer.new(admin.email, admin.password).call }

  let(:valid_headers) do
    {
      'HTTP_REFERER' => 'http://hotspot.example.com',
      'HTTP_AUTHORIZATION' => jwt_token
    }
  end

  let(:invalid_headers) do
    {
      'HTTP_REFERER' => 'http://hotspot.example.com',
      'HTTP_AUTHORIZATION' => 'invalid-jwt'
    }
  end

  let(:valid_attributes) do
    {
      data: {
        type: :places,
        attributes: {
          name: 'New New York',
          companyId: company.id
        }
      }
    }
  end

  let(:invalid_attributes) do
    {
      data: {
        type: :places,
        attributes: {
          name: '',
          companyId: ''
        }
      }
    }
  end

  let(:parsed_response) { JSON.parse(response.body) }

  describe 'GET /places' do
    it 'lists all the places' do
      get api_v1_places_path, headers: valid_headers

      expect(response).to have_http_status(200)
    end

    it 'does not list all the places with an invalid jwt' do
      get api_v1_places_path, headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end
  end

  describe 'GET /places/:id' do
    it 'gets a single place' do
      get api_v1_place_path(place), headers: valid_headers

      expect(response).to have_http_status(200)
    end

    it 'does not get a single place with an invalid jwt' do
      get api_v1_place_path(place), headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end

    it 'does not get a single place with not existing id' do
      get api_v1_place_path('fa879c0d-aa70-43a1-ad78-7ecee46a4881'), headers: valid_headers

      expect(response).to have_http_status(404)
      expect(parsed_response['error'])
        .to be_eql("Couldn't find Place with 'id'=fa879c0d-aa70-43a1-ad78-7ecee46a4881")
    end
  end

  describe 'POST /places' do
    before { admin.add_role(:account_admin) }

    it 'creates a new place' do
      post api_v1_places_path,
           params: valid_attributes,
           headers: valid_headers

      expect(response).to have_http_status(201)
      expect(parsed_response['data']['attributes']['name']).to be_eql('New New York')
    end

    it 'does not create a new place with invalid attributes' do
      post api_v1_places_path,
           params: invalid_attributes,
           headers: valid_headers

      expect(response).to have_http_status(422)
      expect(parsed_response['errors'].first['title']).to be_eql('must be filled')
    end

    it 'does not create a new place with an invalid jwt' do
      post api_v1_places_path,
           params: valid_attributes,
           headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end
  end
end
