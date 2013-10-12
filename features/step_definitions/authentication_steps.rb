Given(/^a user visits the signin page$/) do # this handles the line : Given a user visits the signin page in signing_in.feature file

  visit signin_path
 #In the feature, Given is just a string, but in the step file Given is a method that takes a regular expression and a block. The regex matches the text of the line in the scenario, and the contents of the block are the Ruby code needed to implement the step. In this case, “a user visits the signin page” is implemented by
end

When(/^he submits invalid signin information$/) do
  click_button "Sign in"
end

Then(/^he shouls see an error message$/) do
 expect(page).to have_selector('div.alert.alert-error')
end

Given(/^the user has an account$/) do
  @user= User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
end

When(/^the user submits valid signin Information$/) do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end


Then(/^he should see his profile page$/) do
  expect(page).to have_title(@user.name)

end

Then(/^he should see a signout link$/) do
 expect(page).to have_link('Sign out', href: signout_path)

end