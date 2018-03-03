require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:subdomain).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:active).of_type(:boolean) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end
end
