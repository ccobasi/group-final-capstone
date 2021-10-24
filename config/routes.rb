Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, :cars, :car_types, :reservations
      # post :sign_in, to: 'sessions#create'
      # delete :sign_out, to: "sessions#logout"
      # get :signed_in, to: "sessions#logged_in"
    end
  end

end
