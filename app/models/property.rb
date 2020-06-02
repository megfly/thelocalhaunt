class Property < ApplicationRecord
    has_many :reviews
    has_many :visitors, through: :reviews
end
