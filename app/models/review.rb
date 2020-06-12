class Review < ApplicationRecord
    #join table
    belongs_to :visitor #each review associated with one visitor, now we have @review.visitor
    belongs_to :property #each review associated with on property, now we have @review.property

    validates :title, :sighting, :noise, :smell, :cold_spot, :summary, :date, presence: true 

    scope :ordered_rating, -> { order(rating: :desc) }
    scope :most_recent_review, -> { order(date: :desc) }
end
