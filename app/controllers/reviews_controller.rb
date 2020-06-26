class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_prop_id, only: [:show, :edit]
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    def index 
        @reviews = Review.all
    end 

    def new 
        #nested new route has access to property_id
        params[:property_id] && @property = Property.find_by_id(params[:property_id])
        @review = @property.reviews.build
    end 

    def create 
        @review = current_user.reviews.build(review_params)
        @review.visitor_id = current_user.id
        @review.property_id = params[:property_id]
            if @review.save 
                redirect_to property_review_path(@review.property_id, @review)
            else 
                render :new 
            end 
    end  
   

    def show 
    end 

    def edit 
    end 

    def update 
        if @review.update(review_params)
            redirect_to property_review_path(@review.property_id, @review)
         else 
            flash[:error] = "Must be logged in to edit review"
            redirect_to '/'
        end 
    end 

    def destroy 
       binding.pry 
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :sighting, :noise, :smell, :cold_spot, :summary, :date, :rating)
    end 

    def find_review 
        @review = Review.find_by_id(params[:id])
    end 

    def set_prop_id 
        @property = Property.find_by_id(params[:property_id])
    end 

    def correct_user 
        @review = Review.find_by(id: params[:id])
        unless current_user?(@review.visitor) #unless is opposite of if.... if current user is not the visitor
            flash[:error] = "This isn't your review to edit. Users can only edit their own reviews"
            redirect_to '/' 
        end 
    end 

end