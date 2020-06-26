1. properly utilize nested routes

2. check config/routes and remove any unused routes

3. update and use redirect_if_not_logged_in
```ruby 
   def check_for_logged_in #this should be redirect_if_not_logged_in
        if !logged_in?
         flash[:message] = "Must be logged in to perform this action"
         redirect_to '/' 
        end
    end
```

4. utilize before actions! set_review, set_prop, redirect_if_not_logged_in

5. add ability for users to delete properties *****************
        ---added delete link but its not working.... 
        ---need to try to protect this action from other users becauise tahts not working

6. protect update and delete actions 

7. update view so login / logout buttons are displayed approriately. Users shouldnt be able to attempt to login if theyre logged in

8. walkthrough code and make sure you understand what everything is doing and can describe it technically ****************** ahhhhhh def need practive 