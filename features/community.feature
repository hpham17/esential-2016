Feature: As a lender (Community)
  After I sign up,
  I should be able to create my profile
  So that borrowers can find me

Background:
  Given a lender exists with login "paige.pratt@berkeley.edu pap123"
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "paige.pratt@berkeley.edu pap123"

Scenario: login dashboard
  Then I should be on my dashboard
  And I should see "Create a Community"
  And I should not see "Community Profile"

Scenario: create a community
  When I follow "Create a community"
  Then I should see "Create A Community"

Scenario: fill out form
  When I follow "Create a community"
  When I fill in "community[name]" with "Paige's Community"
  And I fill in "community[description]" with "Hey"
  And I fill in "community[number]" with "949458585"
  And I fill in "community[total_loan_amount]" with "1"
  And I fill in "community[max_loan_amount]" with "1"
  And I fill in "community[interest_rate]" with "1"
  And I fill in "community[loan_period]" with "1"
  And I fill in "House # *" with "2212"
  And I fill in "Street *" with "Blake"
  And I fill in "City *" with "Berkeley"
  And I fill in "State *" with "CA"
  And I fill in "Zip *" with "99833"
  And I press "Create Community"
  Then I should be on my dashboard
  And I should see "949458585"

Scenario: sad path
  When I follow "Create a community"
  And I press "Create Community"
  Then I should be on new community page
  And I should not be on my dashboard page
