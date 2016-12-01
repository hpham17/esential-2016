Feature: As a lender (Community)
  After I logged in
  I should be able to see community page
  And I should be able to modify them

Background:
  Given a community exists with login "paige.pratt@berkeley.edu pap123" and name "pedge"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"

Scenario: Connect to Dashboard
  Then I should be on my dashboard

Scenario: Edit blank page
  When I follow "Edit"
  Then I should see "Description:"
  Then I should see "Terms:"
  Then I should see "Phone Number:"
  When I fill in "community[description]" with "snaq"
  And I fill in "Terms" with "pay"
  And I fill in "community[number]" with "123456789"
  And press "Update Community"
  Then I should see "snaq"
  And I should see "pay"
  And I should see "123456789"

Scenario: Logout
  When I follow "Logout"
  Then I should be on the home page

Scenario: Communities should not be able to see other communities
  Given a community exists with login "second_borrower@gmail.com abc123" and name "Kev"
  And I follow "Logout"
  When I follow "Login"
  And I attempt to login with "second_borrower@gmail.com abc123"
  And I should not see "paige.pratt@berkeley.edu"
