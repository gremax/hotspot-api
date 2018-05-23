require 'rails_helper'

RSpec.describe Api::V1::SettingsPresenter, type: :presenter do
  let!(:admin) { create(:admin) }
  let!(:company) { create(:company, owner: admin) }

  subject { Api::V1::SettingsPresenter.new(company, admin) }

  describe '#providers' do
    let!(:company_provider) { create(:provider, company: company) }
    let!(:another_provider) { create(:provider) }

    it 'should contain available providers'do
      expect(subject.providers).to include company_provider
    end

    it 'should not include other providers' do
      expect(subject.providers).to_not include another_provider
    end
  end

  describe '#available_providers' do
    it { expect(subject.available_providers).to eq %w[facebook twitter instagram] }
  end

  describe '#eligible_actions' do
    context 'when facebook' do
      it { expect(subject.eligible_actions['facebook']).to eq %w[post join like] }
    end

    context 'when twitter' do
      it { expect(subject.eligible_actions['twitter']).to eq %w[tweet retweet follow like] }
    end

    context 'when instagram' do
      it { expect(subject.eligible_actions['instagram']).to eq %w[post follow like] }
    end
  end
end
