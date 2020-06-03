class Property < ApplicationRecord
    has_many :reviews #each property may be associated with zero, one or many reviews objects. now we have @property.reviews
    has_many :visitors, through: :reviews #@property.reviews

    validates :name, presence: true 
    validates :location, presence: true 

    #logging in
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

end
