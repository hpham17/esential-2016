Feature: admin dashboard
  As a admin I want to be able to login
  And then be able to see my dashboard
  So that I can control or delete users and communities

Scenario: signup as admin
  Given I am on the home page
  When I follow "Register"
  Then I attempt to sign up with "hubqwerty@gmail.com hubert123 hubert123"
  And I choose "Admin"
  Then I should see "Communities"
  And I should see "All Users"

Scenario: delete a user
  Given I am signed in as an admin
  When I follow "All Users"
  Given a user "Julian Bacon" exists
  When I click "Delete"
  And I click "Yes"
  Then I should see "User deleted."
  And I should not see "Julian Bacon"

Scenario: view a community
  Given I am signed in as an admin
  When I follow "All Communities"
  Given a community "Berkeley" exists
  When I follow "Berkeley"
  Then I should see "About Berkeley"
