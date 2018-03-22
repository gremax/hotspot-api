FactoryBot.define do
  factory :router do
    place { create(:place) }
    name { Faker::Company.name }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    status :offline
    last_pinged_at 3.days.ago
  end
end
