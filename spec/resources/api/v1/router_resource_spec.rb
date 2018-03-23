RSpec.describe Api::V1::RouterResource, type: :resource do
  let(:router) { create(:router) }

  subject { described_class.new(router, {}) }

  it { is_expected.to have_attribute(:place_id) }
  it { is_expected.to have_attribute(:name) }
  it { is_expected.to have_attribute(:username) }
  it { is_expected.to have_attribute(:status) }
  it { is_expected.to have_attribute(:last_pinged_at) }
  it { is_expected.to have_attribute(:created_at) }
  it { is_expected.to have_attribute(:updated_at) }

  it { is_expected.to have_one(:place) }
end
