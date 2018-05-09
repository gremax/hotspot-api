RSpec.describe Api::V1::ProviderResource, type: :resource do
  let(:provider) { create(:provider) }

  subject { described_class.new(provider, {}) }

  it { is_expected.to have_attribute(:name) }
  it { is_expected.to have_attribute(:api_key) }
  it { is_expected.to have_attribute(:api_secret) }
  it { is_expected.to have_attribute(:api_public) }
  it { is_expected.to have_attribute(:company_id) }
  it { is_expected.to have_attribute(:created_at) }
  it { is_expected.to have_attribute(:updated_at) }

  it { is_expected.to have_one(:company) }
  it { is_expected.to have_one(:current_action) }
end
