Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resources :sessions, only: %i[create]
      end
    end
  end
end
