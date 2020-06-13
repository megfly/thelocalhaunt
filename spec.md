Specifications for the Rails Assessment

Specs:

 x Using Ruby on Rails for the project 
    yes

 x Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    Property model has_many reviews 
    Visitor model has_many reviews

 x Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    Review model belongs_to visitor, belongs_to property

 x Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    Property model has_many :visitors, through: :reviews
    Visitor model has_many :properties, through: :reviews

 x Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    see above, it is :reviews
    
 x The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    Yes reviews.title, reviews.sighting, etc.

 x Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Property model validates :name, :location, :description, presence: true  
    visitor model validates :username, presence: true, uniqueness: true 
    review model validates :title, :sighting, :noise, :smell, :cold_spot, :summary, :date, presence: true

 x Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    found in reviews:
    <!-- scope :ordered_rating, -> { order(rating: :desc) }
    scope :most_recent_review, -> { order(date: :desc) } -->

 x Include signup (how e.g. Devise)
      #signup
        get '/signup' => 'visitors#new'
        post '/signup' => 'visitors#create'

 x Include login (how e.g. Devise)
      #logging in
        get '/login', to: 'sessions#new'
        post '/login', to: 'sessions#create'

 x Include logout (how e.g. Devise)
    delete '/logout', to: 'sessions#destroy'

 x Include third party signup/login (how e.g. Devise/OmniAuth)
    yes 

 x Include nested resource show or index (URL e.g. users/2/recipes)
    nested show view, found on the property show page /property/property_id/review/review_id
     <!-- <% @property.reviews.ordered_rating.each do |r| %>
                <%= link_to "#{r.title}", property_review_path(@property, r) %> 
                Spookiness rating of <%= "#{r.rating}" %><br><br>
            <% end %> -->

 x Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    yes new review for a property /property/property_id/review/review_id

 x Include form display of validation errors (form URL e.g. /recipes/new)
    views/layouts/_errors
    I have this partial rendered in all the new view forms and also in the properties/show view page, and the properties/edit view page.

Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate