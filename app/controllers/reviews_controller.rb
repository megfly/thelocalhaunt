class ReviewsController < ApplicationController

    #must be logged in maybe helper method before_action :redirect if not logged in

    def index 
        if params[:visitor_id]
            @reviews = Visitor.find(params[:visitor_id]).reviews
        else 
            @reviews = Review.all 
        end 
    end 

    def show 
        @review = Review.find(params[:id])
    end 

    def new 
        @review = Review.new 
    end 

    def create 
        #should this be if else render new
        @review = Review.new(review_params)
        @review.save 
        redirect_to reviews_path
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