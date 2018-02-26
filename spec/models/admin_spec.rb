require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:password_digest).of_type(:string) }
    it { is_expected.to have_db_column(:active).of_type(:boolean) }
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { is_expected.to have_db_index(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:companies).dependent(:destroy) }
  end

  it { is_expected.to have_secure_password }
end
