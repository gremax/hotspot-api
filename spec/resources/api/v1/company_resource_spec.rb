RSpec.describe Api::V1::CompanyResource, type: :resource do
  let(:company) { create(:company) }

  subject { described_class.new(company, {}) }

  it { is_expected.to have_attribute(:name) }
end
