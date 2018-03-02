class AdminPolicy < ApplicationPolicy
  def show?
    owner?
  end

  def create?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def owner?
    record.id == user
  end
end
