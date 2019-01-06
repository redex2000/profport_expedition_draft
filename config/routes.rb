Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'galaxies#index'

  resources :planets
  resources :expeditions
  resources :itineraries
  resources :spaceships

  resources :galaxies, only: %I[index new create]

  scope module: "api" do
    namespace :v1 do
      resources :expeditions, only: %I[index show create]
    end

    namespace :v2 do
      resources :expeditions, only: %I[index show create update]
    end
  end
end
