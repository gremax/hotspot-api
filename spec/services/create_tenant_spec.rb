require 'rails_helper'

RSpec.describe CreateTenant do
  let(:account) { create(:account, subdomain: 'new_account') }

  subject { described_class.new(account) }

  describe '#call' do
    before { subject.call }

    it 'should create a new tenant' do
      expect(Apartment.tenant_names).to include(account.subdomain)
    end
  end
end
