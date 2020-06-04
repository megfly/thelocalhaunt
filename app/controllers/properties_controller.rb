class PropertiesController < ApplicationController
    #maybe look at hasmany through in forms lab

    def new 
        @property = Property.new
    end 

    def create 
        @property = Property.new(prop_params) #HAAAAAALP
        if @property.save 
            redirect_to @property
        else 
            render :new
        end 
    end 

    def index 
        @properties = Property.all 
    end 

    def edit 
        @property = Property.find_by_id(params[:id])
    end 

    def update 
        @property = Property.find(params[:id])
        @property.update(prop_params)
        redirect_to property_path
    end 

    def show 
        @property = Property.find(params[:id])
        redirect_to properties_path
    end 

    private 

    def prop_params 
        params.require(:property).permit(:name, :location, :description)
    end 
end