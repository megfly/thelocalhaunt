class Review < ApplicationRecord
    #join table
    belongs_to :visitor #each review associated with one visitor, now we have @review.visitor
    belongs_to :property #each review associated with on property, now we have @review.property

    validates :title, :sighting, :noise, :smell, :cold_spot, :summary, :date, presence: true 

    scope :ordered_rating, -> { order(rating: :desc) }
    scope :most_recent_review, -> { order(date: :desc) }
    #ex scope :long_titles, -> { where("LENGTH(title) > 30") } gives speciufic query a name, go back to controller  
    #controller def index @books = Book.long_ttiles end 
    #go to console and do Book.long_titles
    
end
