Rails.application.routes.draw do
  resources :visitors
  resources :reviews
  resources :properties
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
