require 'rails_helper'

RSpec.describe Api::V1::CompanyDecorator, type: :decorator do
  let(:company) { create(:company) }

  subject { Api::V1::CompanyDecorator.new(company) }

  describe '#current_providers' do
    let!(:providers) { create_list(:provider, 3, company: company) }
    let!(:other_provider) { create(:provider) }

    it 'returns only providers of company' do
      expect(subject.current_providers.size).to eq 3
    end
  end
end
