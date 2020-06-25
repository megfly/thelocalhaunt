1. properly utilize nested routes
        --Having trouble with nested routes
            --fixed All Haunted Reviews

2. check config/routes and remove any unused routes
        --I think I fixed these, its a work in progress

3. update and use redirect_if_not_logged_in
```ruby 
   def check_for_logged_in #this should be redirect_if_not_logged_in
        if !logged_in?
         flash[:message] = "Must be logged in to perform this action"
         redirect_to '/' 
        end
    end
```
        --yes using this

4. utilize before actions! set_review, set_prop, redirect_if_not_logged_in
        ---yes added these, work in progress

5. add ability for users to delete properties ********
        ---added delete link but its not working.... 
        ---need to try to protect this action from other users becauise tahts not working

6. protect update and delete actions ***********
        ---having a hard time with this in properties

7. update view so login / logout buttons are displayed approriately. Users shouldnt be able to attempt to login if theyre logged in
    -- yes, removed login from the application.html.erb header and put it on the home page. The home page only has options to login or sign up (no users can view properties or reviews  unless they are logged in)

8. walkthrough code and make sure you understand what everything is doing and can describe it technically ****************** ahhhhhh def need practive 