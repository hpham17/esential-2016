Feature:
  As a user, I want to be able to login or signup
  Using either Facebook or Google+
  So that I may create an account or login quicker

Background:
  Given I am on the home page
  When I follow "Login"

Scenario: facebook auth
  When I follow "Sign in with Facebook"
