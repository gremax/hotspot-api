FactoryBot.define do
  factory :provider do
    company
    action
    name 'facebook'
    api_key 'key-1234567890'
    api_secret 'eW91IGFyZSB3aW5uZXI='
    api_public ''
  end
end
