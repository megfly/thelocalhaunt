class PropertiesController < ApplicationController

    def index 
        @properties = Property.all 
    end 

    def new 
        if logged_in? 
            @property = Property.new
        else 
            flash[:message] = "Must be logged in to edit property"
            redirect_to root_path 
        end 
    end 

    def create 
        @property = Property.new(prop_params) #HAAAAAALP should i put current user in here???
        if @property.valid?
            @property.save 
            redirect_to @property
        else 
            render :new
        end 
    end 

    def show 
        @property = Property.find(params[:id])
        #redirect_to property_path
    end 

    def edit 
        if current_user
            @property = Property.find_by_id(params[:id])
        else 
            flash[:message] = "Must be logged in to edit property"
            redirect_to root_path
        end 
    end 

    def update 
        if current_user
            @property = Property.find_by_id(params[:id])
            @property.update(prop_params)
            redirect_to property_path
        else 
            redirect_to @property
        end 
    end 

    private 

    def prop_params 
        params.require(:property).permit(:name, :location, :description)
    end 
end