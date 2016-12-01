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
  When I search for zipcode "94602"
  Then I should see "Oakland" 
  And I should not see "Berkeley" 
  
Scenario: Searching with nothing in the search bar should reset to alphabetical
  When I search for zipcode "94602"
  When I search for name ""
  Then I should see "Berkeley" before "Oakland"
  And I should see "Oakland" before "SF"
  
  Scenario: Initial Live Search
  Given a community exists with the name "Berzeley" and the zipcode "94701"
  When I type in "B"
  Then I should see "Berkeley"
  And I should see "Berzeley" 
  And I should not see "Oakland" 
  
Scenario: Continued Live Search
  Given a community exists with the name "Berzeley" and the zipcode "94701"
  When I type in "Berk"
  Then I should see "Berkeley" 
  And I should not see "Berzeley"
  And I should not see "Oakland" 