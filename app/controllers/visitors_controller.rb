class VisitorsController < ApplicationController

    def new 
        @visitor = Visitor.new  
    end 

    def create 
        @visitor = Visitor.new(visitor_params)
        if @visitor.save 
            session[:visitor_id] = @visitor.id 
            redirect_to @visitor 
        else 
            render :new 
        end 
    end 

    def show 
    end 

    private 

    def visitor_params 
        params.require(:visitor).permit(:username, :password)
    end 
end
