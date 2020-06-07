class ReviewsController < ApplicationController
    require 'pry'

    #must be logged in maybe helper method before_action :redirect if not logged in
    before_action :check_for_logged_in

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
        # #if nested and if we find post 
        if params[:property_id] && @property = Property.find_by_id(params[:property_id])
            @review = @property.reviews.build
        else 
            @review = Review.new
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

    def update 
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review)
        else 
            render :edit 
        end 
    end 

    def edit 
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :sighting, :noise, :smell, :cold_spot, :summary, :date, :rating, :property_id, :visitor_id)
    end 
end