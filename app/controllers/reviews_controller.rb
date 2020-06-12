class ReviewsController < ApplicationController
    #maybe helper method before_action :redirect if not logged in
    
    def index 
        if logged_in?
            @reviews = Review.all 
        else 
            redirect_if_not_logged_in 
        end 
    end 

    def new 
        #nested new route 
        if logged_in?
            params[:property_id] && @property = Property.find_by_id(params[:property_id])
            @review = @property.reviews.build
        else 
            redirect_if_not_logged_in 
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
        find_review
    end 

    def edit 
        if current_user 
            find_review
        else 
            redirect_if_not_logged_in 
        end 
    end 

    def update 
        if current_user 
            find_review
            @review.update(review_params)
            redirect_to review_path(@review) 
        else 
            redirect_if_not_logged_in 
        end 
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :sighting, :noise, :smell, :cold_spot, :summary, :date, :rating, :property_id, :visitor_id)
    end 

    def find_review 
        @review = Review.find_by_id(params[:id])
    end 

end