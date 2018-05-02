require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:company_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:api_key).of_type(:string) }
    it { is_expected.to have_db_column(:api_secret).of_type(:string) }
    it { is_expected.to have_db_column(:api_public).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:actions).dependent(:destroy) }
  end
end
