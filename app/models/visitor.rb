class Visitor < ApplicationRecord
  has_secure_password

    has_many :reviews #each visitor may be associated with zero, one or many review objects. now we have @visitor.reviews
    has_many :properties, through: :reviews #@visitor.reviews

    validates :username, presence: true, uniqueness: true 

    def self.from_omniauth(auth)
        @visitor = Visitor.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex
          end
        end 
end
