require 'spec_helper'

describe "Authentication" do
	subject { page }

  describe "signin page" do
   
    	before { visit signin_path }

   		it { should have_content('Sign in') }
    	it { should have_title('Sign in') }

       # To get this tests in Listing 8.1 to pass, we first need to define routes for the Sessions resource, together with a custom named route for the signin page (which we’ll map to the "Session controller’s new action"). As with the Users resource, we can use the resources method to define the standard RESTful routes:?
      #The final step is to define the initial version of the signin page. Note that, since it is the page for a new session, the signin page lives in the file app/views/sessions/new.html.erb, which we have to create.
	end

    describe "signin" do
    	before { visit signin_path }

    	describe "with invalid information" do
    		before { click_button "Sign in" }

    		it { should have_title('Sign in')}
        #it { should have_selector('div.alert.alert-error', text: 'Invalid') } we could do this or the one in the bottom
        it { should have_error_message('Invalid') } #spec/support/utilities.rb  for this definition

        describe "after visiting another page" do
        		before { click_link "Home" }
        		it { should_not have_selector('div.alert.alert-error') }
        		#After submitting invalid signin data, this test follows the Home link in the site layout and then requires that the flash error message not appear.
        		#To get the failing test to pass, instead of 'flash' we use 'flash.now', which is specifically designed for displaying flash messages on rendered pages; unlike the contents of flash, its contents disappear as soon as there is an additional request. see: app/controllers/sessions_controller.rb 
     		end
		  end
       #This uses the Capabara method have_selector . The have_selector method checks for a particular selector element (i.e., an HTML tag, though as of Capybara 2.0 it only works for visible elements). In this case, we’re looking for div.alert.alert-error
       # which checks for a div tag. In particular, recalling that the dot means “class” in CSS (Section 5.1.2), you might be able to guess that this tests for a div tag with the classes "alert" and "alert-error". We also test that the error message contains the text "Invalid". Putting these together, the test looks for an element of the following form:<div class="alert alert-error">Invalid...</div>
     

    

describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) } #look in spec/support/utilities.rb  for this definition
        
    

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
          # for this test to pass, look at app/views/layouts/_header.html.erb for the if-else statement part
          #Here we’ve introduced Capybara’s have_link method. It takes as arguments the text of the link and an optional :href parameter
          #the above code ensures that the anchor tag 'a' has the right href (URL) attribute—in this case, a link to the user’s profile page
   describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
        # for this to pass look at app/controllers/sessions_controller.rb  in destroy section of RESTful
      end
 
    end
  end
end