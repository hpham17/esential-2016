Feature: As a lender (Community)
  After I logged in
  I should be able to see other communities
  So that I am able to compare and see market rates

Background:
  Given a community exists with login "paige.pratt@berkeley.edu pap123" and name "pedge"
   And the following communities exist:
  | name     | description                              | number | total_loan_amount | max_loan_amount | interest_rate | loan_period |
  | Berkeley | A small town.                            | 10     | 100               | 10              | 1             | 1           |
  | Oakland  | Home of the Warriors                     | 20     | 200               | 20              | 2             | 2           |
  | SF       | A very large city with lots of traffic.  | 30     | 300               | 30              | 3             | 3           |
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"

Scenario: landing
  Then I should see "All Communities"

Scenario: see all communities
  When I follow "All Communities"
  Then I should see "Berkeley"
  And I should see "Oakland"
  And I should see "SF"
