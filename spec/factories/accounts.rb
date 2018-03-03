FactoryBot.define do
  factory :account do
    subdomain 'hotspot'
    name { Faker::Company.name }
    active true
  end
end
