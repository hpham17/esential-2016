Then(/^I attempt to sign up with "(.*) (.*) (.*)"$/) do |email, pw1, pw2|
  fill_in("Email", :with => email)
  fill_in("Password", :with => pw1)
  fill_in("Password Confirmation", :with => pw2)
  find('input[name="commit"]').click
end

Given(/^a user exists with login "(.*) (.*)"$/) do |email, pw|
  User.create(email: email, password: pw)
end

And(/^I attempt to login with "(.*) (.*)"$/) do |email, pw|
  fill_in("Email", :with => email)
  fill_in("Password", :with => pw)
  find('input[name="commit"]').click
end

Then(/^I should see a large map$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able to see all communities as pins$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on a community$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the community's info$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a link to its profile$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^a borrower exists with the login "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
