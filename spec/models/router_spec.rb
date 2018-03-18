require 'rails_helper'

RSpec.describe Router, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:place_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:username).of_type(:string) }
    it { is_expected.to have_db_column(:password).of_type(:string) }
    it { is_expected.to have_db_column(:status).of_type(:string) }
    it { is_expected.to have_db_column(:last_pinged_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:place) }
  end
end
