Rails.application.routes.draw do

  #rootroute
  root to: 'application#home'

  #signup
  get '/signup' => 'visitors#new'
  post '/signup' => 'visitors#create'

  resources :visitors 
  resources :reviews
  resources :properties

  #logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
