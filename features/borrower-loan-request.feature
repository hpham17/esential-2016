Feature: contact community
  As a borrower, I want to be able to choose a community
  And be able to contact them
  So that I may request a loan

Background:
  Given the following users exist:
  | name         | email             | password  | role     |
  | Batman       | batman@gmail.com  | batman    | Borrower |

  And the following communities exist:
  | name     | description                              |
  | Berkeley | A small town.                            |
  | Oakland  | Home of the Warriors                     |
  | SF       | A very large city with lots of traffic.  |
  And I am on the home page
  When I follow "Login"
  And I attempt to login with "batman@gmail.com hubert"

Scenario: choose a community
  Then I should see "SF"
  When I follow "SF"
  And I follow "Apply for a loan!"
  Then I should see a popup

Scenario: send a request
  When I apply for a loan
  And I type "Hi, I go to St. Pauls Church every Sunday. May I apply for a loan of $200"
  And I click "Send"
  Then I should see "Loan request sent."
