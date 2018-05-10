require 'rails_helper'

RSpec.describe Api::V1::SettingsPresenter, type: :presenter do
  let!(:admin) { create(:admin) }
  let!(:company) { create(:company, owner: admin) }

  subject { Api::V1::SettingsPresenter.new(company, admin) }

  describe '#providers' do
  end
end
