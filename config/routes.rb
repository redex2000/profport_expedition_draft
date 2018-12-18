Rails.application.routes.draw do
  root to: 'expeditions#index'
  resources :planets
  resources :expeditions
  resources :itineraries
  resources :spaceships

  resources :galaxies, only: %I[index new create]
end
