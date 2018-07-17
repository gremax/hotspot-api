# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        get :me, to: 'tokens#show'
        resources :sessions, only: %i[create]
      end
      resources :companies, only: %i[index show create update destroy]
      resources :places, only: %i[index show create update destroy]
      resources :routers, only: %i[index show create update destroy]
      resources :admins, only: %i[index show create update destroy]
      resources :settings, only: %i[edit update]
    end
  end
end
