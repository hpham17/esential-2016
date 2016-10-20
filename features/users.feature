Feature: user signup & login
  As a user I want to be able to signup
  And then be able to login
  So that I can use the website

Scenario: signup
  Given I am on the home page
  When I follow "Register"
  Then I should be able to sign up with "hubqwerty@gmail.com hubert123"
  Then I should see "Logout"

Scenario: login
  Given a user exists with login "hubqwerty@gmail.com hubert123"
  And I am on the home page
  When I follow "Borrower Login"
  Then I should be able to login with "hubqwerty@gmail.com hubert123"
