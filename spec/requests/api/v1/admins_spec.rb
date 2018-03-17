# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admins', type: :request do
  let!(:admin) { create(:admin) }
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
        type: :admins,
        attributes: {
          email: 'bender@planet.express',
          firstName: 'Bender',
          lastName: 'Rodriguez',
          password: 'bendergetsbetter'
        }
      }
    }
  end

  let(:invalid_attributes) do
    {
      data: {
        type: :admins,
        attributes: {
          email: '',
          firstName: '',
          lastName: '',
          password: ''
        }
      }
    }
  end

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

  describe 'GET /admins/:id' do
    it 'gets a single admin' do
      get api_v1_admin_path(admin), headers: valid_headers

      expect(response).to have_http_status(200)
    end

    it 'does not get a single admin with an invalid jwt' do
      get api_v1_admin_path(admin), headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end

    it 'does not get a single admin with not existing id' do
      get api_v1_admin_path('fa879c0d-aa70-43a1-ad78-7ecee46a4881'), headers: valid_headers

      expect(response).to have_http_status(404)
      expect(parsed_response['errors'].first['title']).to be_eql('Record not found')
    end
  end

  describe 'POST /admins' do
    before { admin.add_role(:account_admin) }

    it 'creates a new admin' do
      post api_v1_admins_path,
           params: valid_attributes,
           headers: valid_headers

      expect(response).to have_http_status(201)
      expect(parsed_response['data']['attributes']['email']).to be_eql('bender@planet.express')
    end

    it 'does not create a new admin with invalid attributes' do
      post api_v1_admins_path,
           params: invalid_attributes,
           headers: valid_headers

      expect(response).to have_http_status(422)
      expect(parsed_response['errors'].first['title']).to be_eql('must be filled')
    end

    it 'does not create a new admin with an invalid jwt' do
      post api_v1_admins_path,
           params: valid_attributes,
           headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end
  end
end
