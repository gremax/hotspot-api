RSpec.describe Api::V1::CompanyResource, type: :resource do
  let(:company) { create(:company) }

  subject { described_class.new(company, {}) }

  it { is_expected.to have_attribute(:name) }
  it { is_expected.to have_attribute(:active) }
  it { is_expected.to have_attribute(:owner_id) }
  it { is_expected.to have_attribute(:owner_name) }
  it { is_expected.to have_attribute(:created_at) }
  it { is_expected.to have_attribute(:updated_at) }

  it { is_expected.to have_one(:owner).with_class_name(Admin.name) }
  it { is_expected.to have_many(:places) }
end
