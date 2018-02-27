require 'rails_helper'

RSpec.describe CompanyPolicy do
  let(:user) { create(:admin) }
  let(:company) { create(:company, owner: user) }

  subject { described_class }

  permissions :show?, :create?, :update?, :destroy? do
    it 'allows access for the user' do
      expect(subject).to permit(user, company)
    end
  end

  permissions '.scope' do
    it 'returns companies where user is an owner' do
      expect(CompanyPolicy::Scope.new(user, Company.all).resolve).to include company
    end

    it 'does not return companies where user is not an owner' do
      expect(CompanyPolicy::Scope.new(Admin.new, Company.all).resolve).not_to include company
    end
  end
end
