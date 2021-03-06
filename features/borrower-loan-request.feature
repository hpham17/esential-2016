Feature: contact community
  As a borrower, I want to be able to choose a community
  And be able to contact them
  So that I may request a loan

Background:
  Given the following users exist:
  | name        | email             | password  | role     |
  | Batman      | batman@gmail.com  | batman    | Borrower |
  | Batman1     | batman1@gmail.com | batman    | Borrower |
  | Batman2     | batman2@gmail.com | batman    | Borrower |

  And the following communities exist:
  | name     | description                              | number | total_loan_amount | max_loan_amount | interest_rate | loan_period |
  | Berkeley | A small town.                            | 10     | 100               | 10              | 1             | 1           |
  | Oakland  | Home of the Warriors                     | 20     | 200               | 20              | 2             | 2           |
  | SF       | A very large city with lots of traffic.  | 30     | 300               | 30              | 3             | 3           |
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "batman@gmail.com batman"
  Then I should see "SF"
  When I follow "SF"
  And I press "Request a Loan"

Scenario: see pop up
  Then I should see "Body"

Scenario: request sad path
  When I press "Create Loan request"
  Then I should not see "Loan request sent"

Scenario: send a request
  When I enter "loan_request[body]" with "Hi, I go to St. Pauls Church every Sunday. May I apply for a loan of $200"
  And I press "Create Loan request"
  Then I should see "Loan request sent."
