class PropertiesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]

    def new  
        @property = Property.new 
    end 

    def index 
        @properties = Property.all 
    end 

    def create 
        @property = current_user.properties.build(prop_params) #.build creates a new instance but doesnt save it yet. user can have_many properties
        @property.visitor_id = current_user.id 
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

    # def destroy
    #     @property.destroy
    #     redirect_to property_path
    # end 

    private 

    def prop_params 
        params.require(:property).permit(:name, :location, :description, :visitor_id)
    end 

    def set_property
        @property = Property.find_by_id(params[:id])
    end 

    def correct_user 
        @property = Property.find_by(id: params[:id])
        unless current_user?(@property.visitor) #unless is opposite of if.... if current user is not the visitor
            flash[:error] = "This isn't your property to edit. Users can only edit their own properties"
            redirect_to '/' 
        end 
    end 

end