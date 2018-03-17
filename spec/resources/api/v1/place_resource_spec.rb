# frozen_string_literal: true

RSpec.describe Api::V1::PlaceResource, type: :resource do
  let(:place) { create(:place) }

  subject { described_class.new(place, {}) }

  it { is_expected.to have_attribute(:name) }
  it { is_expected.to have_attribute(:active) }
  it { is_expected.to have_attribute(:company_id) }
  it { is_expected.to have_attribute(:created_at) }
  it { is_expected.to have_attribute(:updated_at) }

  it { is_expected.to have_one(:company) }
  it { is_expected.to have_many(:routers) }
end
