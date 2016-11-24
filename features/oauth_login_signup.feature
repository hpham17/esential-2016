Feature:
  As a user, I want to be able to login or signup
  Using either Facebook or Google+
  So that I may create an account or login quicker

Background:
  Given I am on the home page
  When I follow "Login"

Scenario: facebook auth
  When I follow "Sign in with Facebook"
  And I fill in "Email or Phone Number" with "paige@gmail.com"
  And I fill in "Password" with "password0"
  And I press "Log in"
  Then I should be on my dashboard
  
Scenario: google auth
  When I follow "Sign in with Google"
  And I fill in "email" with "paige@gmail.com"
  And I fill in "Password" with "password0"
  And I press "Log in"
  Then I should be on my dashboard
