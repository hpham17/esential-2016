Feature: As a lender (Community)
  After I logged in
  I should be able to see community page
  And I should be able to modify them
  
Background:
  Given a community exists with login "paige.pratt@berkeley.edu pap123"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"

Scenario: Connect to Dashboard
  Then I should be on the community dashboard
  
Scenario: Edit blank page
  When I follow "Edit"
  Then I should see a blank "description"
  Then I should see a blank "contact information"
  Then I should see a blank "loan information"
  When I fill in "description" with "snaq"
  And fill in "contact information" with "1234567"
  And fill in "loan information" with "10 dollars"
  And follow "Save"
  Then I should see "snaq" under "description"
  And I should see "1234567" under "contact information"
  And I should see "10 dollars" under "loan information"

Scenario: Logout
  When I follow "Logout"
  Then I should be on the home page

  

  