Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pets, only: [:show, :index]
      resources :stores, only: [:index, :show] do
        resources :orders, only: [:index, :show]
      end
    end
  end
end
