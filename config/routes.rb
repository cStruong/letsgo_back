Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  resources :trips, only: [:create, :index, :show]
  resources :usertrips, only: [:create, :index, :destroy, :show, :update]
  resources :itineraryitems, only: [:create, :index, :destroy]
  post "/users/login", to: "users#login"
  get "/users/reauthorize", to: "users#reauthorize"
  post "/users/add", to: "users#add"
end
