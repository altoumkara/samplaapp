require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

     it "should have the title 'Home'" do
       visit '/static_pages/home'
        expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'help me'" do
      visit '/static_pages/help'
      expect(page).to have_content('help me')
    end

     it "should have the title 'Help'" do
       visit '/static_pages/help'
       expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    
  end
end


describe "About page" do

    it "should have the content 'About Us'" do
    visit '/static_pages/about'
    expect(page).to have_content('About Us')
  end

  it "should have the title 'About Us'" do
     visit '/static_pages/about'
     expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")
  end
end

describe "Contacts" do

    it "should have the content 'Contact Us'" do
    visit '/static_pages/contacts'
    expect(page).to have_content('Contact Us')
  end

  it "should have the title 'Contacts'" do
     visit '/static_pages/contacts'
     expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contacts")
  end
end
end





