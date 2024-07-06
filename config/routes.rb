Rails.application.routes.draw do
  devise_for :users

  # Define RESTful routes for products and orders
  resources :products
  resources :orders

  # Define the root path route ("/")
  root 'products#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
