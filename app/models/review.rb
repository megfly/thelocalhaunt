class Review < ApplicationRecord
    #join table
    belongs_to :visitor
    belongs_to :property
end
