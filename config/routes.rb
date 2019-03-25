Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews
      resources :games
      resources :user_games
      resources :users
    end
  end

  post "signin", to: "api/v1/users#signin"
  get "validate", to: "api/v1/users#validate"
  get "games", to: "api/v1/users#get_games"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
