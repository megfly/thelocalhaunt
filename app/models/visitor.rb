class Visitor < ApplicationRecord
    has_many :reviews
    has_many :properties, through: :reviews
end
