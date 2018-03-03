# frozen_string_literal: true

class CreateTenant
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def call
    Apartment::Tenant.create(account.subdomain)
  end
end
