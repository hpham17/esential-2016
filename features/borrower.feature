Feature: borrower dashboard
    As a borrower
    After I logged in
    I should be able to see list of all communities
    So that I can choose one
    And find a loan

Background:
  Given a borrower exists with login "paige.pratt@berkeley.edu pap123"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"

Scenario: Connect to Dashboard
  Then I should be on the borrower dashboard
  
Scenario: Communities Listed
  Given a community exists with the name "Snaq"
  And a community exists with the name "Snaq2"
  Then I should see "Snaq"
  Then I should see "Snaq2"

Scenario: Link to Community pages
  Given a community exists with the name "Snaq"
  And I follow "Snaq"
  Then I should be on community dashboard

Scenario: Profile link
  Given I am on borrower dashboard
  And I follow "Profile"
  Then I should be on "paige.pratt@berkeley.edu" profile
  
Scenario: Profile edit
  Given I am on "paige.pratt@berkeley.edu" profile
  And I follow "Edit"
  And fill in "contact information" with "1234567"
  And I follow "Save"
  And I should see "1234567" under "contact information"

Scenario: Logout
  When I follow "Logout"
  Then I should be on the home page