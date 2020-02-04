Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signup', to: "users#signup"
  post '/signin', to: "users#signin"
  post '/validate', to: "users#validate"
  get '/herostats', to: "heros#herostats"

  resources :seasons
  resources :games
  resources :maps
  resources :heros

end
