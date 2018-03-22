require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:resource_type).of_type(:string) }
    it { is_expected.to have_db_column(:resource_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:admins) }
    it { is_expected.to belong_to(:resource) }
  end

  describe 'validations' do
    it { is_expected.to validate_inclusion_of(:resource_type).in_array(Rolify.resource_types) }
  end
end
