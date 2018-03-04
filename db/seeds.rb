# frozen_string_literal: true

require 'factory_bot'

account = Account.find_or_create_by(subdomain: 'hotspot', name: 'Hotspot Inc.')

unless Apartment.tenant_names.include?(account.subdomain)
  CreateTenant.new(account).call
end

Apartment::Tenant.switch(account.subdomain) do |_tenant|
  admin = AccountAdmin.find_or_create_by(email: 'admin@hotspot.dev',
                                         first_name: 'Admin',
                                         last_name: 'Hotspot')
  admin.update(password: 'password')
end
