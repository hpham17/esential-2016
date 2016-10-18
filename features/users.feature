Feature: user signup & login
  As a user, I want to be able to signup
  And then be able to login
  so that I can use the website

Scenario: signup
  Given I am on the home page
  Then I should be able to sign up with "hubennj hubert123 hubqwerty@gmail.com"
  And I should be logged in

Scenario: login
  Given a user exists with login "hubennj hubert123"
  And I am on the home page
  Then I should be able to log in
