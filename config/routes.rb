Rails.application.routes.draw do

  #rootroute
  root to: 'sessions#home'

  resources :visitors 
  resources :reviews

  resources :properties


  #signup
  get '/signup' => 'visitors#new'
  post '/signup' => 'visitors#create'

  #logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
