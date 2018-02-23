FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password_digest 'password_digest_here'
    active true
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
