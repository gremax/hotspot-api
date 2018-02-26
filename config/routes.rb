Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resources :sessions, only: %i[create]
      end
      jsonapi_resources :companies, only: %i[index show create update destroy]
    end
  end
end
