# frozen_string_literal: true

account = Account.find_or_create_by(subdomain: 'startwifi', name: 'StartWiFi')

begin
  Apartment::Tenant.switch!(account.subdomain)
rescue Apartment::TenantNotFound
  CreateTenant.new(account).call
  retry
end

admin = Admin.find_or_create_by(
  email: 'admin@startwifi.me',
  first_name: 'Admin',
  last_name: 'StartWiFi'
)

company_admin = Admin.find_or_create_by(
  email: 'bender@planet.express',
  first_name: 'Bender',
  last_name: 'Rodriguez'
)

company = Company.find_or_create_by(owner: admin, name: 'Planet Express')

admin.update(password: 'password')
admin.add_role(:account_admin)
company_admin.update(password: 'password')
company_admin.add_role(:company_admin, company)
