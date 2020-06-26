class Property < ApplicationRecord
    belongs_to :visitor #each property associated with one visitor, now we have @property.visitor
    has_many :reviews #each property may be associated with zero, one or many reviews objects. now we have @property.reviews
    has_many :visitors, through: :reviews #@property.reviews

    validates :name, :location, :description, presence: true 
end
