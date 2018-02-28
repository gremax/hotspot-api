require 'rails_helper'

RSpec.describe Exceptions::FormErrors, type: :service do
  let(:form) { CompanyForm.new(Company.new) }

  subject { described_class.new(form) }

  before { form.valid? }

  describe '#errors' do
    it 'returns errors as JSONAPI' do
      expect(subject.errors[0].title).to include('must be filled')
      expect(subject.errors[0].source[:pointer]).to be_eql('/data/attributes/name')
      expect(subject.errors[1].title).to include('must be filled')
      expect(subject.errors[1].source[:pointer]).to be_eql('/data/attributes/owner_id')
    end
  end
end
