Feature: borrower dashboard
    As I log in as a borrower,
    I should be able to see list of all communities
    So that I can choose one
    And find a loan

Background:
  Given a borrower exists with login "paige.pratt@berkeley.edu pap123"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"

Scenario: After sign in is dashboard
  Then I should be on the borrower dashboard
  And I should see "Community name"

Scenario: All Communities Listed
  Given a community exists with the name "Berkeley"
  And a community exists with the name "Oakland"
  Then I should see "Berkeley"
  Then I should see "Oakland"

Scenario: Links to Community show pages
  Given a community exists with the name "Berkeley"
  And I follow "Berkeley"
  Then I should see "Community Profile"

Scenario: Edit profile
  Given I am on borrower dashboard
  And I follow "Profile"
  Then I should be on "paige.pratt@berkeley.edu" profile
  And fill in "Email" with "newemail@berkeley.edu"
  And fill in "Name" with "Paige Pratt"
  And fill in "Current password" with "pap123"
  And I press "Update"
  Then I am on borrower dashboard
  And I follow "Profile"
  And I should see "newemail@berkeley.edu" under "Email"
  And I should see "Paige Pratt" under "Name"

Scenario: Logout
  When I follow "Logout"
  Then I should be on the home page
