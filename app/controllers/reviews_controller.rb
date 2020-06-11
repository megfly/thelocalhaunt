class ReviewsController < ApplicationController
    #must be logged in maybe helper method before_action :redirect if not logged in
    
    def index 
        if logged_in?
            @reviews = Review.all 
        else 
            flash[:message] = "You must be logged in to view property reviews"
            redirect_to root_path
        end 
    end 

    def new 
        # #if nested and if we find post 
        if logged_in?
            params[:property_id] && @property = Property.find_by_id(params[:property_id])
            @review = @property.reviews.build
        else 
            flash[:message] = "Must be logged in to add a review"
            redirect_to root_path  
        end 
    end 


    def create 
        #have to set the visitor id 
        @review = Review.new(review_params)
        @review.visitor_id = current_user.id if current_user 
        if @review.save 
            redirect_to @review 
        else 
            render :new 
        end 
    end 

    def show 
        @review = Review.find_by_id(params[:id])
    end 

    def edit 
        if current_user 
            @review = Review.find_by_id(params[:id]) 
        else 
            flash[:message] = "You must be logged in to edit review"
            redirect_to reviews_path
        end 
    end 

    def update 
        if current_user 
            @review = Review.find_by_id(params[:id])
            @review.update(review_params)
            redirect_to review_path(@review) 
        else 
            flash[:message] = "You must be logged in to edit review"
            redirect_to reviews_path
        end 
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :sighting, :noise, :smell, :cold_spot, :summary, :date, :rating, :property_id, :visitor_id)
    end 

end