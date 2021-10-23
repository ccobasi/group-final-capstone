Rails.application.routes.draw do
  root to: 'pages#home'
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :cars
      resources :car_types
      resources :reservations
    end
  end

end
