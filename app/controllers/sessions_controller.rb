class SessionsController < ApplicationController
	def  new
		
	end


	def create

		user = User.find_by(email: params[:session][:email].downcase)
		#The first line here pulls the user out of the database using the submitted email address. (Recall from Section 6.2.5 that email addresses are saved as all lower-case, so here we use the downcase method to ensure a match when the submitted address is valid.)
    	if user && user.authenticate(params[:session][:password])
    		#This uses && (logical and) to determine if the resulting user is valid. Taking into account that any object other than nil and false itself is true in a boolean context ,  the if statement is true only if a user with the given email both exists in the database and has the given password, exactly as required.
      		# Sign the user in and redirect to the user's show page.
      		sign_in user # we have to create sign_in object ourself in the helper
      		redirect_to user
   		else
      		flash.now[:error] = 'Invalid email/password combination' # this 'now' method is used on flash, because we dont want the error message to get display on any other page than the needed one.
		
			render 'new'#without his code below, the sign in button will return an error.Let’s start by defining a minimalist create action for the Sessions controller (Listing 8.9), which does nothing but render the new view. Submitting the /sessions/new form with blank fields then yields the result
		end
	end

	def destroy
		sign_out # we have to create sign_in object ourself in the helper
		redirect_to root_url
		
	end
	def current_user=(user)
		@current_user = user #The one-line method body just sets an instance variable @current_user, effectively storing the user for later use
		
	end
end
