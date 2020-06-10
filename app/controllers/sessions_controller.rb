class SessionsController < ApplicationController
    #logging in and logging out

    def home 
    end 

    def new 
        @visitor = Visitor.new  
    end 

    def create 
        @visitor = Visitor.find_by(username: params[:visitor][:username]) #params coming from loginform.
       
        if @visitor && @visitor.authenticate(params[:visitor][:password])
             session[:visitor_id] = visitor.id  #save the user id inside the browser cookie and log in
             redirect_to visitor_path(@visitor) #show page 
        else 
            flash[:error] = "Invalid password. Please try again."
            redirect_to '/login'
        end
    end 

    def omniauth
        #want to see the attributes for users auth but it wont work
        @visitor = Visitor.from_omniauth(auth)
        @visitor.save 
        session[:visitor_id] = @visitor.id 
        redirect_to visitor_path(@visitor)
      end

    def destroy 
        session.clear
        redirect_to root_path 
    end 

    private 

    def visitor_params 
        params.require(:visitor).permit(:username, :password, :email)
    end 

    def auth
        request.env['omniauth.auth']
    end

end
