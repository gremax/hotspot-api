# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        get :me, to: 'tokens#show'
        resources :sessions, only: %i[create]
      end
      jsonapi_resources :companies, only: %i[index show create update destroy]
      jsonapi_resources :places, only: %i[index show create update destroy]
      jsonapi_resources :routers, only: %i[index show create update destroy]
      jsonapi_resources :admins, only: %i[index show create update destroy]
      jsonapi_resources :settings, only: %i[edit update]
    end
  end
end
