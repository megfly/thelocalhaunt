class SessionsController < ApplicationController
    #logging in and logging out

    def destroy 
        session.clear
        redirect_to root_path
    end 

    def home 
    end 

    def create 
        @visitor = Visitor.find_by(username: params[:visitor][:username]) #params coming from loginform.

        if @visitor && @visitor.authenticate(params[:visitor][:password])
             session[:visitor_id] = @visitor.id  #save the user id inside the browser cookie and log in
             redirect_to visitor_path(@visitor) #show page 
        else 
            flash[:error] = "Invalid password. Please try again."
            redirect_to '/login'
        end
    end 

    def omniauth
        @visitor = Visitor.from_omniauth(auth)
        @visitor.save 
        session[:visitor_id] = @visitor.id 
        redirect_to visitor_path(@visitor)
      end


    private 

    def auth
        request.env['omniauth.auth']
    end

end
