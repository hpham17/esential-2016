Feature: Borrower Search Bar
  As a borrower
  I should be able to search for communities by zipcode proximity
  So that I can see a list of communities close by
  And find relevant loans that meet my needs

Background:
  Given a borrower exists with login "paige.pratt@berkeley.edu pap123"
  And a community exists with the name "Berkeley" and the zipcode "94704"
  And a community exists with the name "Oakland" and the zipcode "94601"
  And a community exists with the name "SF" and the zipcode "94101"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"
  
Scenario: The list starts in alphebetical order
  Then I should see "Berkeley" before "Oakland"
  And I should see "Oakland" before "SF"

Scenario: Searching with a zipcode will order then by closest zipcode
  When I fill in "Search" with "94602"
  And I press "Search"
  Then I should see "Oakland" before "Berkeley"
  And I should see "Berkeley" before "SF"
  
Scenario: Searching with nothing in the search bar should reset to alphabetical
  When I fill in "Search" with "94602"
  And I press "Search"
  When I fill in "Search" with ""
  And I press "Search"
  Then I should see "Berkeley" before "Oakland"
  And I should see "Oakland" before "SF"