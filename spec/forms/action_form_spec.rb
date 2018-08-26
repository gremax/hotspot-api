require 'rails_helper'

RSpec.describe ActionForm, type: :form do
  let(:provider) { create(:provider) }

  subject { described_class.new(Action.new(provider_id: provider.id)) }

  describe '#name' do
    it 'validates presence of a name attribute' do
      subject.validate(name: '')

      expect(subject.errors[:name]).to include('must be filled')
    end

    xcontext 'when a name is wrong' do
      it 'should not be valid' do
        subject.validate(name: 'blah')

        expect(subject.errors[:name]).to include("must be one of: #{Provider::ELIGIBLE_ACTIONS[provider.name].join(', ')}")
      end
    end

    context 'when a name is valid' do
      it 'should be valid' do
        subject.validate(name: Provider::ELIGIBLE_ACTIONS[provider.name].first)

        expect(subject.errors[:name]).to be_empty
      end
    end
  end

  describe '#provider_id' do
    it 'validates presence of a provider_id attribute' do
      subject.validate(provider_id: '')

      expect(subject.errors[:provider_id]).to include('must be filled')
    end

    it 'validates presence of a provider' do
      subject.validate(provider_id: '1')

      expect(subject.errors[:provider_id]).to include('must exist')
    end
  end
end
