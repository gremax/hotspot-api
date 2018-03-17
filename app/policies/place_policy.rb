class PlacePolicy < ApplicationPolicy
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
    owner? || account_admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def owner?
    record.company.owner == user
  end
end
