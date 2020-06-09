class VisitorsController < ApplicationController

    def new 
        @visitor = Visitor.new  
    end 

    def create 
        @visitor = Visitor.new(visitor_params)
        if @visitor.save 
            session[:visitor_id] = @visitor.id 
            flash[:message] = "Your account has been created!"
            redirect_to @visitor #showpage
        else 
            flash[:message] = "Please try again"
            redirect_to '/signup'
        end 
    end 

    def show 
        @visitor = Visitor.find_by_id(params[:id])
        redirect_to '/' if !@visitor
    end 

    private 

    def visitor_params 
        params.require(:visitor).permit(:username, :password, :email)
    end 
end
