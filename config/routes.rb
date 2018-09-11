Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pet, only: [:show]
      resources :stores, only: [:index]
    end
  end
end
