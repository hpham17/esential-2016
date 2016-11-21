Given(/^a community exists with login "(.*) (.*)" and name "([^"]*)"$/) do |email, pw, name|
  a = User.create(email: email, password: pw, role: "Community")
  Community.create(name: name, user_id: 20, user_id: a.id)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )enter "([^"]*)" with "([^"]*)"$/ do |field, value|
  within('#new_loan_request') do
    fill_in(field, :with => value)
  end
end

Given(/^a borrower submits a loan request to me with the text "([^"]*)"$/) do |text|
  LoanRequest.create(body: text, user_id: User.ids.last, community_id: Community.ids.last)
end

When(/^I follow the link in the email$/) do
  visit path_to('the login page')
end
