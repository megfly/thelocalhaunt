class PropertiesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_property, only: [:show, :edit, :update, :destroy]

    def index 
        @properties = Property.all 
    end 

    def new 
        @property = Property.new
    end 

    def create 
        @property = Property.new(prop_params)
        if @property.save 
            redirect_to @property
        else 
            render :new
        end 
    end 

    def show 
    end 

    def edit 
    end 

    def update 
        @property.update(prop_params)
        redirect_to property_path
    end 

    def destroy
        Property.find(params[:id]).destroy 
        redirect_to property_path
    end 

    private 

    def prop_params 
        params.require(:property).permit(:name, :location, :description)
    end 

    def set_property
        @property = Property.find_by_id(params[:id])
    end 

end