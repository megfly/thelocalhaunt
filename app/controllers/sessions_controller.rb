class SessionsController < ApplicationController
    #logging in and logging out

    def home 
    end 

    def new 
        @visitor = Visitor.new  
    end 

    def create 
        @visitor = Visitor.find_by(username: params[:visitor][:username]) #params coming from loginform. inspect page to see
        if params[:username] !="" && params[:password] != ""
            @visitor.authenticate(params[:password])
            #logging in 
            session[:visitor_id] = @visitor.id 
            redirect_to visitor_path(@visitor) #show page 
        else 
            flash[:message] = "Invalid"
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
        params.require(:visitor).permit(:username, :password)
    end 

    def auth
        request.env['omniauth.auth']
    end

end
