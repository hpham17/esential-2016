Feature: Borrower Search Bar
  As a borrower
  I should be able to log on and see a Google map of all the communities
  So that I can find communities within my proximity

Background:
  Given a borrower exists with login "paige.pratt@berkeley.edu pap123"
  And the following communities with addresses exist:
  | name    | description                             | house_number | street | city | state | zip|
  | Berkeley| A small town.                           | 2212 | Blake St | Berkeley | CA | 94704 |
  | Oakland | Home of the Warriors                    | 7000 | Coliseum Way | Oakland | CA | 94621 |
  | SF      | A very large city with lots of traffic.| 160| Jefferson St| San Francisco | CA | 94133|
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"
  Then I should be on my dashboard

Scenario: google map dynamic display
  Then I should see a Google map
  And I should be able to zoom in and out

Scenario: communities on the map
  Then I should see three markers
  Then I should see a marker placed at zipcode "94704"
  And I should see a marker placed at zipcode "94601"
  And I should see a marker placed at zipcode "94101"

@javascript
Scenario: display community profile
  When I click on the marker for "Berkeley"
  Then I should see its info window
  And I follow the link in the info window
  Then I should be on the community show page
  And I should see "Community Profile"
