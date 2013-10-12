Feature: Signing in


Scenario: Unsuccessful signin
   Given a user visits the signin page
    When he submits invalid signin information
    Then he shouls see an error message

Scenario: Succesful signin
   Given a user visits the signin page
     And the user has an account
    When the user submits valid signin Information
    Then he should see his profile page
     And he should see a signout link


     #in order for those test to pass, we should define each one of them in a new file. in thi case we make a file called #features/step_definitions/authentication_steps.rb 