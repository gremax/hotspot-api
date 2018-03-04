FactoryBot.define do
  factory :company do
    owner { create(:company_admin) }
    active true
    name { Faker::Company.name }
  end
end
