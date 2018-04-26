FactoryBot.define do
  factory :action do
    name 'post'
    entity_uid '1234567890'
    entity_name 'My group name'
    post_text ''
    post_link 'http://example.com'
    post_image ''
    redirect_url 'http://google.com'
  end
end
