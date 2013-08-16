require 'spec_helper'

describe "Static pages" do

  subject {page} # we are using to also eliminate the duplication in expect(page).to have.....
 
  describe "Home page" do
    before { visit root_path} # we are using this block to eleminate the duplication of the visit block i commented below

    it { should have_content ('Sample App') }
    it { should have_title (full_title('')) } # we already define full_title in spec/support/utilities.rb file which is automatically inluded by RSpec
    it { should_not have_title ('|Home') }
    # visit root_path
    #  expect(page).to have_content('Sample App')
  end
    #it "should have the base title" do
      # visit root_path
    #expect(page).to have_title("Ruby on Rails Tutorial Sample App")
     # end
    # it "should not have a custom page title " do
       #visit root_path
      #  expect(page).not_to have_title("| Home")
    #end
  

  describe "Help page" do
   before {visit help_path}
   it { should have_content('help me')}
   it {should have_title (full_title('Help'))}
  end
    #it "should have the content 'help me'" do
      #visit help_path
      #expect(page).to have_content('help me')
   # end

    # it "should have the title 'Help'" do
      # visit help_path
      # expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    
  #end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end


    #it "should have the content 'About Us'" do
    #visit about_path
   # expect(page).to have_content('About Us')
 # end

 # it "should have the title 'About Us'" do
    # visit about_path
    # expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")
  #end


  describe "Contact" do
    before { visit contact_path }
    it { should have_selector( 'h1', text: 'Contact') }
    #it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end


  #  it "should have the content 'Contact Us'" do
    #visit contact_path
   # expect(page).to have_content('Contact Us')
 # end

  #it "should have the title 'Contact'" do
    # visit contact_path
    # expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
 # end
end






