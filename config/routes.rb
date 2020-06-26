Rails.application.routes.draw do

  #rootroute
  root to: 'sessions#home'

  #signup
  get '/signup' => 'visitors#new'
  post '/signup' => 'visitors#create'

  #logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #omniauth callback route
  get '/auth/:provider/callback' => 'sessions#omniauth'

 
  resources :properties, only: [:index, :show, :new, :create, :edit, :update, :destroy] do 
    resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
  end 
  resources :reviews, only: [:index]

  #not sure if i need the below. should go through this
  resources :visitors, only: [:show] do 
    resources :properties, only: [:show]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end