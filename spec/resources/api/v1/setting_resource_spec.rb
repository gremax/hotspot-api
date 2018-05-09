RSpec.describe Api::V1::SettingResource, type: :resource do
  let(:company) { create(:company) }
  let(:presenter) { Api::V1::SettingsPresenter.new(company, company.owner) }

  subject { described_class.new(presenter, {}) }

  it { is_expected.to have_many(:providers) }
end
