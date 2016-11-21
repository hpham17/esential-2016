Given(/^a borrower exists with login "(.*) (.*)"$/) do |email, pw|
  User.create(email: email, password: pw, role: "Borrower")
end

Given(/^a community exists with the name "([^"]*)"$/) do |community_name|
  Community.create(name: community_name)
end

When(/^I apply for a loan$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I type "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
