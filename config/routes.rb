Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'galaxies#index'

  resources :planets
  resources :expeditions do
    get :jsonp, on: :collection
  end
  resources :itineraries
  resources :spaceships

  resources :galaxies, only: %I[index new create]

  scope module: "api" do
    namespace :v1 do
      resources :expeditions, only: %I[index show create]
    end

    namespace :v2 do
      resources :expeditions, only: %I[index show create update]
      resources :users, only: [] do
        patch :sign_in, on: :collection
      end
    end

    namespace :v3 do
      resources :users, only: [] do
        patch :sign_in, on: :collection
      end
      resources :expeditions, only: %I[index show create]
    end
  end
end
