Feature: borrower dashboard
    As I log in as a borrower,
    I should be able to see list of all communities
    So that I can choose one
    And find a loan

Background:
  Given a borrower exists with login "paige.pratt@berkeley.edu pap123"
  Given a community exists with the name "Berkeley"
  And a community exists with the name "Oakland"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"

Scenario: After sign in is dashboard
  Then I should be on my dashboard
  And I should see "Community name"

Scenario: All Communities Listed
  Then I should see "Berkeley"
  Then I should see "Oakland"

Scenario: Links to Community show pages
  byebug
  When I follow "Berkeley"
  Then I should see "Community Profile"

Scenario: Edit profile
  And I follow "Settings"
  Then I should be on "paige.pratt@berkeley.edu" profile
  And I fill in "Email" with "newemail@berkeley.edu"
  And I fill in "Name" with "Paige Pratt"
  And I fill in "Current password" with "pap123"
  And I press "Update"
  And I follow "Settings"
  Then I should see "newemail@berkeley.edu"
  And I should see "Paige Pratt"

Scenario: Logout
  When I follow "Logout"
  Then I should be on the home page
  
Scenario: Community zipcodes listed
  Given a community exists with the name "Lafayette" and the zipcode "94549"
  And I should be on my dashboard
  Then I should see "Lafayette"
  And I should see "94549"
