Feature:
  As a borrower,
  I should be able to log on and see a Google map of all the communities,
  so that I can find communities within my proximity quickly.

Background:
  Given a borrower exists with the login "batman@gmail.com hubert"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "batman@gmail.com hubert"

Scenario: Google Map
  Then I should see a large map
  And I should be able to see all communities as pins
  When I click on a community
  Then I should see the community's info
  And I should see a link to its profile
