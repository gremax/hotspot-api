# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyPolicy do
  let(:user) { create(:admin) }
  let(:company) { create(:company) }

  subject { described_class }

  context 'when the user is an account admin' do
    before { user.add_role(:account_admin) }

    permissions :show?, :create?, :update?, :destroy? do
      it 'allows access for the user' do
        expect(subject).to permit(user, company)
      end
    end

    permissions '.scope' do
      it 'returns all the companies' do
        expect(CompanyPolicy::Scope.new(user, Company.all).resolve).to include company
      end
    end
  end

  context 'when the user is a company owner' do
    before { company.update(owner: user) }

    permissions :show?, :update? do
      it 'allows access for the user' do
        expect(subject).to permit(user, company)
      end
    end

    permissions :create?, :destroy? do
      it 'does not allow access for the user' do
        expect(subject).not_to permit(user, company)
      end
    end

    permissions '.scope' do
      it 'returns companies where user is an owner'
      it 'does not return companies where user is not an owner'
    end
  end

  context 'when the user is a company admin' do
    before { user.add_role(:company_admin, company) }

    permissions :show?, :update? do
      it 'allows access for the user' do
        expect(subject).to permit(user, company)
      end
    end

    permissions :create?, :destroy? do
      it 'does not allow access for the user' do
        expect(subject).not_to permit(user, company)
      end
    end

    permissions '.scope' do
      it 'returns companies where user is an admin' do
        expect(CompanyPolicy::Scope.new(user, Company.all).resolve).to include company
      end

      it 'does not return companies where user is not an admin'
    end
  end
end
