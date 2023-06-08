Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  resources :flats, only: [:show, :new, :create] do
    resources :bookings
  end

  delete "flats/:id", to: "flats#destroy", as: "delete_flat"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
