class ApplicationController < ActionController::Base


    helper_method :current_user #access to views

    private 

    def current_user 
        @current_user ||= Visitor.find_by_id(session[:visitor_id])
         #This Operator only sets the variable if the variable is false or Nil. so x ||= y this means x || x = y so if x is nil or false set x to be the value of y.
    end 

    def logged_in? 
        !!current_user 
        #double bang takes value and turns it into boolean, true if user logged in, otherwise false (context: true, and then negated(false) and then negated again (true))
    end 

    def check_for_logged_in
        redirect_to '/' if !logged_in?
      end

end 