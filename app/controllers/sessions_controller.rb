class SessionsController < ApplicationController

    def new 
        @visitor = Visitor.new 
    end 

    def create 
        @visitor = Visitor.find_by(username: params[:visitor][:username]) #params coming from loginform. inspect page to see
        if @visitor && @visitor.authenticate(password: params[:visitor][:password])
            #logging in 
            session[:visitor_id] = @visitor.id 
            redirect_to visitor_path(@visitor) #show page 
        else 
            render :new 
            #errors
        end
    end 

    def destroy 
        session.delete :username
    end 
end
