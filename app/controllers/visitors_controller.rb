class VisitorsController < ApplicationController

    def new 
        @visitor = Visitor.new  
    end 

    def create 
        @visitor = Visitor.new(visitor_params)
        if @visitor.save 
            session[:visitor_id] = @visitor.id 
            redirect_to @visitor #showpage
        else 
            render :new 
        end 
    end 

    def show 
        @visitor = Visitor.find_by_id(params[:id])
        redirect_to '/' if !@visitor #if not visitor
    end 

    private 

    def visitor_params 
        params.require(:visitor).permit(:username, :password)
    end 
end
