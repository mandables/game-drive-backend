# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews
      resources :games
      resources :user_games
      resources :users
      resources :genres
      resources :game_genres
      delete '/user_games', to: 'user_games#destroy'
    end
  end

  post 'signin', to: 'api/v1/users#signin'
  get 'validate', to: 'api/v1/users#validate'
  # get "games", to: "api/v1/users#games"
  post 'api/v1/in_collection', to: 'api/v1/user_games#incollection'
  delete 'api/v1/:rawg_id/:user_id', to: 'api/v1/user_games#remove'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
