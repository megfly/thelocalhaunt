class PropertiesController < ApplicationController
    #maybe look at hasmany through in forms lab

    def new 
    end 

    private 

    def prop_params 
        params.require(:property).permit(:name, :location, :description)
    end 
end
