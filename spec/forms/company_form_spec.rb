require 'rails_helper'

RSpec.describe CompanyForm, type: :form do
  subject { described_class.new(Company.new) }

  describe '#name' do
    it 'validates presence of the company name' do
      subject.validate(name: '')

      expect(subject.errors[:name]).to include('must be filled')
    end
  end

  describe '#owner_id' do
    it 'validates presence of the company owner_id' do
      subject.validate(owner_id: '')

      expect(subject.errors[:owner_id]).to include('must be filled')
    end
  end
end
