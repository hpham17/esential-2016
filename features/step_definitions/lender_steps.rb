Given(/^a community exists with login "(.*) (.*)" and name "([^"]*)"$/) do |email, pw, name|
  a = User.create(email: email, password: pw, role: "Community")
  Community.create(name: name, user_id: 20, user_id: a.id)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^a borrower submits a loan request to me with the text "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I follow the link in the email$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be logged in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
