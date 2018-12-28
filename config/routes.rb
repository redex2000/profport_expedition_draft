Rails.application.routes.draw do

  devise_for :users
  root to: 'galaxies#index'

  resources :planets
  resources :expeditions
  resources :itineraries
  resources :spaceships

  resources :galaxies, only: %I[index new create]
end
