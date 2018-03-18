# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:owner_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:active).of_type(:boolean) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:owner).class_name(Admin.name).dependent(:destroy) }
    it { is_expected.to have_many(:places).dependent(:destroy) }
    it { is_expected.to have_many(:routers) }
  end
end
