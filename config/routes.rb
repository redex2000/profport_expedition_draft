Rails.application.routes.draw do
  root to: 'expeditions#index'
  resources :planets
  resources :expeditions
  resources :itineraries
  resources :spaceships
end
