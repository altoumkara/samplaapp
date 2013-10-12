require 'spec_helper'

describe "User pages" do

  subject { page }


  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
 

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  
describe "signup" do
    before { visit signup_path }

    let (:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)

      end
      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name"       ,             with: "example user"
        fill_in "Email"      ,            with: "user@example.com"
        fill_in "Password"   ,         with: "foobar"
        fill_in "Confirmation"  ,     with: "foobar"
        expect do
  click_button "Create my account"
end.to change(User, :count).by(1)

     
describe "after saving the user" do
        before { click_button submit }
        let(:user) { user.find_by(Email: 'user@example.com') }

        it { should have_link('Sign out') }
        # a user should be automatically sign int after finishing signing up as everyother website.Here we’ve tested the appearance of the signout link to verify that the user was successfully signed in after signing up.
        #With the sign_in method from Section 8.2, getting this test to pass by actually signing in the user is easy: just add sign_in @user right after saving the user to the database in app/controllers/users_controller.rb
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end
end
