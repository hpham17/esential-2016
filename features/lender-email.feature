Feature: As a lender (Community)
  Once I receive a loan request,
  I should receive an email,
  So that I may log on and accept/reject it

Background:
  Given a community exists with login "paige.pratt@berkeley.edu pap123" and name "pedge"
  And a borrower exists with login "hubert@gmail.com hubert"
  And a borrower submits a loan request to me with the text "Hi, I am from your community. May I please take out a loan?"
  When I follow the link in the email
  Then I should be on the login page
  When I attempt to login with "paige.pratt@berkeley.edu pap123"

Scenario: loan request sent
  I should be sent an email

Scenario: inbox on dashboard
  Then I should see "Inbox"

Scenario: open inbox
  When I follow "Inbox"
  Then I should see "All Loan Requests"
  And I should see "hubert@gmail.com"
  And I should see "Hi, I am from your community. May I please take out a loan?"
