class ReviewsController < ApplicationController

    #must be logged in maybe helper method before_action :redirect if not logged in

    def index 
        if params[:property_id] 
            @property = Property.find_by_id(params[:property_id])
            #nested
            if @property 
                @property.reviews 
            else 
                
                @reviews = Review.all 
            end 
        else 
            @reviews = Review.all
        end 
    end 

    def new 
        #if nested and if we find post 
        if params[:property_id]
            @property = Property.find_by_id(params[:property_id])
            if @property 
                @property.reviews.build 
            else 
                @review = @property.reviews.build
            end 
        else 
        @review = Review.new 
        end 
    end 

    def create 
        @review = current_user.reviews(review_params) #.build
        if @review.save
            redirect_to reviews_path 
        else 
            render :new 
        end 
    end 

    def show 
        @review = Review.find(params[:id])
    end 

    def update 
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to review_path(@review)
    end 

    def edit 
        @review = Review.find(params[:id])
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :sighting, :noise, :smell, :cold_spot, :summary, :date, :rating, :property_id, :visitor_id)
    end 
end