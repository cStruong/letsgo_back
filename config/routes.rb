Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index, :update]
  resources :trips, only: [:create, :index, :show, :destroy]
  resources :usertrips, only: [:create, :index, :destroy, :show, :update]
  resources :expenseitems, only: [:create, :index, :destroy, :update]
  resources :itineraryitems, only: [:create, :index, :destroy, :update]
  post "/users/login", to: "users#login"
  get "/users/reauthorize", to: "users#reauthorize"
  post "/users/add", to: "users#add"
  post "/trips/yelp", to: "trips#yelp"
end
