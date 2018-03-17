# frozen_string_literal: true

RSpec.describe Api::V1::AdminResource, type: :resource do
  let(:admin) { create(:admin) }

  subject { described_class.new(admin, {}) }

  it { is_expected.to have_attribute(:active) }
  it { is_expected.to have_attribute(:email) }
  it { is_expected.to have_attribute(:first_name) }
  it { is_expected.to have_attribute(:last_name) }
  it { is_expected.to have_attribute(:password) }
end
