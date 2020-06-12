class PropertiesController < ApplicationController

    def index 
        @properties = Property.all 
    end 

    def new 
        if logged_in? 
            @property = Property.new
        else 
            redirect_if_not_logged_in 
        end 
    end 

    def create 
        @property = Property.new(prop_params)
        if @property.valid?
            @property.save 
            redirect_to @property
        else 
            render :new
        end 
    end 

    def show 
        find_property
    end 

    def edit 
        if logged_in?
            find_property
        else 
            redirect_if_not_logged_in 
        end 
    end 

    def update 
        if logged_in?
            find_property
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

    def find_property
        @property = Property.find_by_id(params[:id])
    end 
end