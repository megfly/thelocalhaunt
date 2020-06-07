class Property < ApplicationRecord
    has_many :reviews #each property may be associated with zero, one or many reviews objects. now we have @property.reviews
    has_many :visitors, through: :reviews #@property.reviews

    validates :name, :location, :description, presence: true 

end
