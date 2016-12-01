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
  Then I should be on my dashboard

Scenario: failed login
  Given a user exists with login "hubqwerty@gmail.com hubert123"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "hubqwerty@gmail.com hubert456"
  Then I should be on the login page

Scenario: failed signup password too short
  Given I am on the home page
  When I follow "Register"
  And I attempt to sign up with "hubqwerty@gmail.com h h"
  Then I should see "Password is too short (minimum is 6 characters)"
  Then I should be on the signup page

Scenario: failed signup passwords don't match
  Given I am on the home page
  When I follow "Register"
  And I attempt to sign up with "hubqwerty@gmail.com hubert123 hubert456"
  Then I should be on the signup page
  Then I should see "Password confirmation doesn't match Password"

Scenario: Update username
  Given a user exists with login "hubqwerty@gmail.com hubert123"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "hubqwerty@gmail.com hubert123"
  Then I should be on my dashboard
  When I follow "Settings"
  And I fill in "Email" with "hub@gmail.com"
  And I fill in "Current password" with "hubert123"
  And press "Update"
  Then I should be on my dashboard
  When I follow "Settings"
  Then I should see "hub@gmail.com"
