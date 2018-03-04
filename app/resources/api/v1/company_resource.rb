class Api::V1::CompanyResource < JSONAPI::Resource
  attributes :name, :active, :created_at
end
