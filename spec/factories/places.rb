FactoryBot.define do
  factory :place do
    company { create(:company) }
    name { Faker::Company.name }
    active true
  end
end
