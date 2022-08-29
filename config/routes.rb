Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get 'teams/:id', to: 'teams#show'
  delete 'teams/:id', to: 'teams#destroy'
  post '/teams', to: 'teams#create'
  patch 'teams/:id', to: 'teams#update'
  get '/teams/:id/edit', to: 'teams#edit'
  get '/players', to: 'players#index'
  get 'players/:id', to: 'players#show'
  patch 'players/:id', to: 'players#update'
  get '/players/:id/edit', to: 'players#edit'
  delete '/players/:id', to: 'players#destroy'
  get '/teams/:team_id/players', to: 'team_players#index'
  get '/teams/:team_id/players/new', to: 'team_players#new'
  post '/teams/:team_id/players', to: 'team_players#create'
end
