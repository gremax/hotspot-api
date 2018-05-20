# frozen_string_literal: true

class ActionForm < Reform::Form
  property :provider_id
  property :current
  property :name
  property :entity_uid
  property :entity_name
  property :post_text
  property :post_link
  property :post_image
  property :redirect_url

  validation do
    configure do
      option :provider, Provider
      predicates(ValidationPredicates)
    end

    required(:provider_id).filled(record?: Provider)
    required(:name).filled

    validate(eligible_name: %i[provider_id name]) do |provider_id, name|
      provider = Provider.find(provider_id)
      return false if provider.nil?
      Provider::ELIGIBLE_ACTIONS[provider.name].include?(name)
    end
  end
end
