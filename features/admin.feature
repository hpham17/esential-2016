Feature: admin dashboard
  As a admin I want to be able to login
  And then be able to see my dashboard
  So that I can see communities and delete users

Background: can log in as admin
  Given the following users exist:
  | name         | email             | password  | role     |
  | Hubert Pham  | hubes@gmail.com   | hubert    | Admin    |
  | Julian Bacon | julian@gmail.com  | julian    | Borrower |
  | Derrick Mar  | derrick@gmail.com | derrick   | Borrower |
  | Batman       | batman@gmail.com  | batman    | Borrower |

  And the following communities exist:
  | name     | description                              |
  | Berkeley | A small town.                            |
  | Oakland  | Home of the Warriors                     |
  | SF       | A very large city with lots of traffic.  |
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "hubes@gmail.com hubert"
  Then I should see "Welcome, Admin!"

Scenario: see statistics on dashboard
  Then I should see "Total Communities"
  And I should see "Total Users"

Scenario: delete a user
  Then I should see "Julian Bacon"
  When I click "Delete" next to "Julian Bacon"
  Then I should see "User deleted."
  And I should be on my dashboard

Scenario: cannot delete admin
  Then I should see "Hubert Pham"
  And I should not see "Delete" next to "Hubert Pham"

Scenario: view a community
  Then I should see "Berkeley"
  When I follow "Berkeley"
  Then I should see "Berkeley's Community Profile"

Scenario: cannot signup as admin
  Given I follow "Logout"
  When I follow "Register"
  Then I should not see "Admin"
