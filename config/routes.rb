Rails.application.routes.draw do

  root to: 'galaxies#index'

  resources :sessions, only: %I[new create destroy]
  get 'sign_in', to: 'sessions#new'
  delete 'sign_out', to: 'sessions#destroy'

  resources :planets
  resources :expeditions
  resources :itineraries
  resources :spaceships

  resources :galaxies, only: %I[index new create]
end
