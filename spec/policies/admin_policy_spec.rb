require 'rails_helper'

RSpec.describe AdminPolicy do
  let(:user) { create(:admin) }
  let(:company) { create(:company) }
  let(:admin) { create(:admin) }

  subject { described_class }

  context 'when the user is an account admin' do
    before { user.add_role(:account_admin) }

    permissions :show?, :create?, :update?, :destroy? do
      it 'allows access for the user' do
        expect(subject).to permit(user, admin)
      end
    end

    permissions '.scope' do
      it 'returns all the admins' do
        expect(CompanyPolicy::Scope.new(user, Admin.all).resolve).to include admin
      end
    end
  end

  context 'when the user is a company owner' do
    permissions :show?, :update?, :create?, :destroy? do
      it 'allows access for the user'
    end

    permissions '.scope' do
      it 'returns admins of the company where the user is an owner'
      it 'does not return admins of the company where user is not an owner'
    end
  end

  context 'when the user is a company admin' do
    permissions :show?, :update? do
      it 'allows access for the user'
    end

    permissions :create?, :destroy? do
      it 'does not allow access for the user'
    end

    permissions '.scope' do
      it 'returns admins of the company where the user is an admin'
      it 'does not return companies where user is not an admin'
    end
  end
end
