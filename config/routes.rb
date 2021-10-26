Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'register', to: 'users#create'
      post 'sign_in', to: 'tokens#create'
      resources :users, only: %[index show update destroy]
      resources :cars, :car_types, :reservations, :cities
    end
  end

end
