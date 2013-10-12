# the sign_in function itself. As noted above, our desired authentication method is to place a (newly created) remember token as a cookie on the user’s browser, and then use the token to find the user record in the database as the user moves from page to page
# u cAN CHECK app/models/user.rb 
module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token #first, create a new token
		cookies.permanent[:remember_token] = remember_token #second, place the unencrypted token in the browser cookies
		#using 'permanent' method causes Rails to set the expiration to 20.years.from_now automatically.
		#The one on the top is the same as: cookies[:remember_token] = { value: remember_token,expires: 20.years.from_now.utc }
		user.update_attribute(:remember_token, User.encrypt(remember_token)) #save the encrypted token to the database
		# Note the use of update_attribute to save the token; as mentioned briefly in Section 6.1.5), this method allows us to update a single attribute while bypassing the validations—necessary in this case since we don’t have the user’s password or confirmation.
		self.current_user = user #is an assignment, which we must define. and it sets the current user equal to the given user. see app/helpers/sessions_helper.rb 
	end

	def signed_in?
     !current_user.nil?    	#“not” operator, written using an exclamation point ! and usually read as “bang”. In the present context, a user is signed in if current_user is not nil, 
    end

    def current_user=(user) # we define the assignment self.current_user=user on the top and it is equal to current_user=(user)
    	@current_user = user
    end



	def current_user # note: this is different from curent_user=(user) method. this is designed to return the following values. look in the view/layouts/_header for its use
		#@current_user= user #we could stop at this code and not write the bottoms codes if its was only one page. but the user might switch from page to page and if we stop at this one line code, the user will be forgotten and log out as soon as he goes to another page. that is why we need to use the bottoms codes instead. The one-line method body just sets an instance variable @current_user, effectively storing the user for later use.
		remember_token = User.encrypt(cookies[:remember_token]) # this calls the user token every time you go to a new page. it first encrypted to token in the cookie because the token in the database is encrypted already, and them compare them to each other as soon as you switch pages so you can still be log in. 
		@current_user ||= User.find_by(remember_token: remember_token) # this code return a user
		# this code is the same as 
		# x= X or Y  which is equal to x or=1 , in logic or=||, therefore we can write x||=Y
		# SO this code will return Y in case x is nil(false), otherwise just return x and stop right there without going to Y
	    # check (Box 8.2). for more info
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
		
	end
end
