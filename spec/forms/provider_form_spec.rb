require 'rails_helper'

RSpec.describe ProviderForm, type: :form do
  subject { described_class.new(Provider.new) }

  describe '#name' do
    it 'validates presence of a name attribute' do
      subject.validate(name: '')

      expect(subject.errors[:name]).to include('must be filled')
    end

    context 'when a name is invalid' do
      it 'should not be valid' do
        subject.validate(name: 'blah')

        expect(subject.errors[:name]).to include("must be one of: #{Provider::AVAILABLE_NAMES.join(', ')}")
      end
    end

    context 'when a name is valid' do
      it 'should be valid' do
        subject.validate(name: Provider::AVAILABLE_NAMES.first)

        expect(subject.errors[:name]).to be_empty
      end
    end
  end

  it 'validates presence of a company_id attribute' do
    subject.validate(company_id: '')

    expect(subject.errors[:company_id]).to include('must be filled')
  end
end
