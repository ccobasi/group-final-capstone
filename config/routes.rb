Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :tokens, only: [:create]
      resources :users, :cars, :car_types, :reservations, :cities
    end
  end

end
