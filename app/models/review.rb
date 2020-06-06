class Review < ApplicationRecord
    #join table
    belongs_to :visitor #each review associated with one visitor, now we have @review.visitor
    belongs_to :property #each review associated with on property, now we have @review.property

    validates :title, presence: true 

    scope :ordered_rating, -> { order(rating: 'desc') }

end
