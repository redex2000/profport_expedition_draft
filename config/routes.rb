Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'galaxies#index'

  resources :planets
  resources :expeditions do
    get :jsonp, on: :collection
    get :cors, on: :collection
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
      # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3fQ.-Bm3C1AGUjjUjRiOIWPc7iZ32e5eFWRTk87ve-xXKWw
      resources :expeditions, only: %I[index show create]
    end
  end
end
