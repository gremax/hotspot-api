FactoryBot.define do
  factory :company do
    owner { create(:admin) }
    active true
    name { Faker::Company.name }
  end
end
