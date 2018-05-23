RSpec.describe Api::V1::SettingResource, type: :resource do
  let(:company) { create(:company) }
  let(:presenter) { Api::V1::SettingsPresenter.new(company, company.owner) }

  subject { described_class.new(presenter, {}) }

  it { is_expected.to have_attribute(:available_providers) }
  it { is_expected.to have_attribute(:eligible_actions) }
  it { is_expected.to have_attribute(:providers) }
end
