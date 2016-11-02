Then(/^I choose "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am signed in as an admin$/) do
  fill_in("Email", :with => email)
  fill_in("Password", :with => pw)
  find('input[name="commit"]').click
end

Given(/^a user "([^"]*)" exists$/) do |arg1|
  User.create(name: arg1)
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_button()
end

Then(/^I should not see "([^"]*)"$/) do |arg1|
  page.should have_no_content(arg1)
end

Given(/^a community "([^"]*)" exists$/) do |arg1|
  Community.create(name: arg1)
end

