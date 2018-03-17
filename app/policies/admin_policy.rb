# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def show?
    owner? || account_admin?
  end

  def create?
    account_admin?
  end

  def update?
    owner? || account_admin?
  end

  def destroy?
    account_admin?
  end

  class Scope < Scope
    def resolve
      if account_admin?
        scope
      else
        scope.joins(:companies).where(companies: { owner: user })
      end
    end
  end

  private

  def owner?
    record.id == user.id
  end
end
