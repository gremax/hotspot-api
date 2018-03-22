require 'rails_helper'

RSpec.describe 'Companies', type: :request do
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
        type: :companies,
        attributes: {
          name: 'Planet Express',
          ownerId: admin.id
        }
      }
    }
  end

  let(:invalid_attributes) do
    {
      data: {
        type: :companies,
        attributes: {
          name: '',
          ownerId: ''
        }
      }
    }
  end

  let(:parsed_response) { JSON.parse(response.body) }

  let(:company) { create(:company, owner: admin, name: 'StartWiFi') }

  describe 'GET /companies' do
    it 'lists all the companies' do
      get api_v1_companies_path, headers: valid_headers

      expect(response).to have_http_status(200)
    end

    it 'does not list all the companies with an invalid jwt' do
      get api_v1_companies_path, headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end
  end

  describe 'GET /company/:id' do
    it 'gets a single company' do
      get api_v1_company_path(company), headers: valid_headers

      expect(response).to have_http_status(200)
    end

    it 'does not get a single company with an invalid jwt' do
      get api_v1_company_path(company), headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end

    it 'does not get a single company with not existing id' do
      get api_v1_company_path('fa879c0d-aa70-43a1-ad78-7ecee46a4881'), headers: valid_headers

      expect(response).to have_http_status(404)
      expect(parsed_response['errors'].first['title']).to be_eql('Record not found')
    end
  end

  describe 'POST /companies' do
    before { admin.add_role(:account_admin) }

    it 'creates a new company' do
      post api_v1_companies_path,
           params: valid_attributes,
           headers: valid_headers

      expect(response).to have_http_status(201)
      expect(parsed_response['data']['attributes']['name']).to be_eql('Planet Express')
    end

    it 'does not create a new company with invalid attributes' do
      post api_v1_companies_path,
           params: invalid_attributes,
           headers: valid_headers

      expect(response).to have_http_status(422)
      expect(parsed_response['errors'].first['title']).to be_eql('must be filled')
    end

    it 'does not create a new company with an invalid jwt' do
      post api_v1_companies_path,
           params: valid_attributes,
           headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')
    end
  end

  describe 'PATCH /companies/:id' do
    let(:valid_attributes) do
      {
        data: {
          id: company.id,
          type: :companies,
          attributes: {
            name: 'Planet Express'
          }
        }
      }
    end

    let(:invalid_attributes) do
      {
        data: {
          id: company.id,
          type: :companies,
          attributes: {
            name: ''
          }
        }
      }
    end

    it 'updates a company' do
      patch api_v1_company_path(company),
            params: valid_attributes,
            headers: valid_headers

      expect(response).to have_http_status(200)

      expect(company.reload.name).to be_eql('Planet Express')
    end

    it 'does not update a company with invalid attributes' do
      patch api_v1_company_path(company),
            params: invalid_attributes,
            headers: valid_headers

      expect(response).to have_http_status(422)
      expect(parsed_response['errors'].first['title']).to be_eql('must be filled')

      expect(company.reload.name).to be_eql(company.name)
    end

    it 'does not update a company with an invalid jwt' do
      patch api_v1_company_path(company),
            params: valid_attributes,
            headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to be_eql('error' => 'Unauthorized Request')

      expect(company.reload.name).to be_eql(company.name)
    end

    it 'does not update a company with not existing id' do
      params = { data: { id: 'fa879c0d-aa70-43a1-ad78-7ecee46a4881', type: :companies, attributes: { name: '' } } }
      patch api_v1_company_path('fa879c0d-aa70-43a1-ad78-7ecee46a4881'),
            params: params,
            headers: valid_headers

      expect(response).to have_http_status(404)
      expect(parsed_response['errors'].first['title']).to be_eql('Record not found')
    end
  end

  describe 'DELETE /companies/:id' do
    before { admin.add_role(:account_admin) }

    it 'deletes a companies' do
      delete api_v1_company_path(company), params: {}, headers: valid_headers

      expect(response).to have_http_status(204)
      expect(response.body).to be_empty

      expect { company.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'does not delete a company with an invalid jwt' do
      delete api_v1_company_path(company), params: {}, headers: invalid_headers

      expect(response).to have_http_status(401)
      expect(parsed_response).to eq('error' => 'Unauthorized Request')
    end

    it 'does not delete a company with not existing id' do
      delete api_v1_company_path('fa879c0d-aa70-43a1-ad78-7ecee46a4881'), params: {}, headers: valid_headers

      expect(response).to have_http_status(404)
      expect(parsed_response['errors'].first['title']).to be_eql('Record not found')
    end
  end
end
