Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  resources :trips, only: [:create, :index]
  resources :usertrips, only: [:create, :index]
  resources :itineraryitems, only: [:create, :index]
end
