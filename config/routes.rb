Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "scooters#index"

  resources :scooters, except: :show
  resources :employees, except: :show
  resources :reservations, except: :show
end
