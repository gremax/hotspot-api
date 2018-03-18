# frozen_string_literal: true

class CompanyPolicy < ApplicationPolicy
  def show?
    owner? || company_admin? || account_admin?
  end

  def create?
    account_admin?
  end

  def update?
    owner? || company_admin? || account_admin?
  end

  def destroy?
    account_admin?
  end

  class Scope < Scope
    def resolve
      if account_admin?
        scope
      else
        scope.with_role(:company_admin, user)
      end
    end
  end

  private

  def owner?
    record.owner == user
  end
end
