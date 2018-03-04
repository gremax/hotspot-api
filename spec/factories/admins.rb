# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password '12345678'
    type 'AccountAdmin'
    active true
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :account_admin do
      type 'AccountAdmin'
    end

    trait :company_admin do
      type 'CompanyAdmin'
    end

    trait :place_admin do
      type 'PlaceAdmin'
    end

    factory :account_admin, class: AccountAdmin, traits: %i[account_admin]
    factory :company_admin, class: CompanyAdmin, traits: %i[company_admin]
    factory :place_admin, class: PlaceAdmin, traits: %i[place_admin]
  end
end
