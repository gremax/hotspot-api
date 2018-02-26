FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password '12345678'
    active true
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
