class VisitorsController < ApplicationController

    def new 
        @visitor = Visitor.new  
    end 

    def create 
        @visitor = Visitor.new(visitor_params)
        if @visitor.save 
            session[:visitor_id] = @visitor.id 
            flash[:success] = "Your account has been created!"
            redirect_to @visitor #showpage
        else 
            flash[:username] = "Username already taken. Please try again."
            redirect_to '/signup'
        end 
    end 

    def show 
        @visitor = Visitor.find_by(params[:id])
        redirect_to '/' if !@visitor
    end 

    private 

    def visitor_params 
        params.require(:visitor).permit(:username, :password, :email)
    end 
end
