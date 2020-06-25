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

  resources :visitors, only: [:show] do 
    resources :reviews, only: [:show, :index]
  end 

  resources :reviews, only: [:index]

  resources :properties, only: [:index, :show, :new, :create, :edit, :update, :destroy] do 
    resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end