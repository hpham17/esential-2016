Cucumber user stories we want to implement:

Feature: user signup & login
  As a user I want to be able to signup
  And then be able to login
  So that I can use the website

Scenario: signup
  Given I am on the home page
  When I follow "Register"
  Then I attempt to sign up with "hubqwerty@gmail.com hubert123 hubert123"
  Then I should see "Logout"

Scenario: login
  Given a user exists with login "hubqwerty@gmail.com hubert123"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "hubqwerty@gmail.com hubert123"
  Then I should be on the home page
