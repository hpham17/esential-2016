Feature: admin dashboard
  As a admin I want to be able to login
  And then be able to see my dashboard
  So that I can see communities and delete users

Background: can log in as admin
  Given I am on the home page
  When I follow "Login"
  And I sign in with "hubes@gmail.com hubert123"
  Then I should see "Welcome, Admin!"

Scenario: see statistics on dashboard
  Then I should see "Total Communities"
  And I should see "Total Users"

Scenario: delete a user
  Given a user "Julian Bacon" exists
  When I click "Delete"
  And I click "Yes"
  Then I should see the flash message "User deleted."
  Then I should be on my dashboard page
  And I should not see "Julian Bacon"

Scenario: view a community
  Given I am signed in as an admin
  When I follow "All Communities"
  Given a community "Berkeley" exists
  When I follow "Berkeley"
  Then I should see "About Berkeley"

Scenario: cannot signup as admin
  Given I am on the home page
  When I follow "Register"
  Then I should not be able to select "Admin"
