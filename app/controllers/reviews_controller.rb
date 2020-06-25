class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    
    def index 
        if params[:property_id] && @property = Property.find_by_id(params[:property_id])
            @reviews = @property.reviews
        else
            @reviews = Review.all
        end 
    end 

    def new 
        #nested new route has access to property_id
        params[:property_id] && @property = Property.find_by_id(params[:property_id])
        @review = @property.reviews.build
    end 


    def create 
        # utilize params[:property_id] from nested route and use current_user to create review associatied to that property and user, 
        #instead of passing visitor id and prop id through the form
        #if params[:property_id] && @property = Property.find_by_id(params[:property_id])
            @review = current_user.reviews.build(review_params)
            if @review.save 
                redirect_to @review 
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
            redirect_to review_path(@review) 
        else 
            render :edit 
        end 
    end 

    def destroy 
        @review.destroy
        redirect_to property_review_path(@review)
    end 

    private 

    def review_params 
        params.require(:review).permit(:title, :sighting, :noise, :smell, :cold_spot, :summary, :date, :rating, :visitor_id, :property_id)
    end 

    def find_review 
        @review = Review.find_by_id(params[:id])
    end 

end