module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)  # Method definition
    base_title = "Ruby on Rails Tutorial Sample App" # Variable assignment
    if page_title.empty? # Boolean test
      base_title # Implicit return
    else
      "#{base_title} | #{page_title}" # the '#' is called String interpolation
    end
  end
end

#Now that we have a helper, we can use it to simplify our layout by replacing :
#<title>Ruby on Rails Tutorial Sample App | <%= yield(:title) %></title>
# with:  <title><%= full_title(yield(:title)) %></title>
# in app/views/layouts/application.html.erb 
# then To put our helper to work, we can eliminate the unnecessary word “Home” from the Home page, allowing it to revert to the base title. We do this by first updating our test with the code in Listing 4.4, which updates the previous title test and adds one to test for the absence of the custom ’Home’ string in the title.
# go spec/requests/static_pages_spec.rb 


