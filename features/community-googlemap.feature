Feature: Borrower Search Bar
  As a borrower
  I should be able to log on and see a Google map of all the communities
  So that I can find communities within my proximity
  
Background:
  Given a borrower exists with login "paige.pratt@berkeley.edu pap123"
  And a community exists with the name "Berkeley" and the zipcode "94704"
  And a community exists with the name "Oakland" and the zipcode "94601"
  And a community exists with the name "SF" and the zipcode "94101"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"
  
Scenario: google map dynamic display
  Then I should see google map
  And I should be able to scroll on the map
  
Scenario: communities on the map
  Then I should see a marker placed at zipcode "94704"
  And I should see a marker placed at zipcode "94601"
  And I should see a marker placed at zipcode "94101"
  