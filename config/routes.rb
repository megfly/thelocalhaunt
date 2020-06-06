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

  resources :reviews
  resources :visitors do  #visitors/1/properties
    resources :properties
  end 
  resources :properties do #properties/1/reviews
    resources :reviews
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



 #properties/:property_id/reviews 
 #properties/:property_id/reviews/new
 #properties/property_id/reviews/5