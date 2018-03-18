# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end

    private

    def account_admin?
      user.has_role?(:account_admin)
    end
  end

  private

  def account_admin?
    user.has_role?(:account_admin)
  end

  def company_admin?
    user.has_role?(:company_admin, record)
  end

  def place_admin?
    user.has_role?(:place_admin, record)
  end
end
