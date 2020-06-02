class Visitor < ApplicationRecord
    has_secure_password

    has_many :reviews #each visitor may be associated with zero, one or many review objects. now we have @visitor.reviews
    has_many :properties, through: :reviews #@visitor.reviews
end
