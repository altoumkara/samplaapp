class UsersController < ApplicationController
    def show
  	 @user = User.find(params[:id]) # this equal to: User.find(1)

    #In order to get the user 'show'html in the  view folder to work, we need to define an @user variable in the corresponding show action in the Users controller

    end
  def new
  	#without the following code, the page will currently breaks, because we have not set the @user variable—like all undefined instance variables (Section 4.4.5), @user is currently nil. 
    @user = User.new

   # To get these tests to pass again and to get our form to render, we must define an @user variable in the controller action corresponding to new.html.erb, i.e., the new action in the Users controller. The form_for helper expects @user to be a User object, and since we’re creating a new user we simply use User.new
  end

  def create
  	@user = User.new(user_params)
    #@user.password_confirmation = params[:user][:password_confirmation] # u can declare those params here or in the bottom with the user name, email etc..
  	if @user.save
      # adding the bottom line code sign_in @user right after saving the user to the database allow the user to be sign in automatically after a succesful sign up. look spec/requests/user_pages_spec.rb 
      sign_in @user
  		# handle a succefull save.
      flash[:success]="Welcome to the Sample App!" # see app/views/layouts/application.html.erb for more details about this code 
  		redirect_to @user
  		
  	else
  		render 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end








 