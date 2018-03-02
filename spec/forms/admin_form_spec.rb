require 'rails_helper'

RSpec.describe AdminForm, type: :form do
  subject { described_class.new(Admin.new) }

  describe '#email' do
    it 'validates presence of an email attribute' do
      subject.validate(email: '')

      expect(subject.errors[:email]).to include('must be filled')
    end

    context 'when an email is invalid' do
      it 'should not be valid' do
        subject.validate(email: 'invalid.email')

        expect(subject.errors[:email]).to include('is in invalid format')
      end
    end

    context 'when an email is valid' do
      it 'should be valid' do
        subject.validate(email: 'bender@planet.express')

        expect(subject.errors[:email]).not_to include('is in invalid format')
      end
    end
  end

  it 'validates presence of a first_name attribute' do
    subject.validate(first_name: '')

    expect(subject.errors[:first_name]).to include('must be filled')
  end

  it 'validates presence of a last_name attribute' do
    subject.validate(last_name: '')

    expect(subject.errors[:last_name]).to include('must be filled')
  end
end
