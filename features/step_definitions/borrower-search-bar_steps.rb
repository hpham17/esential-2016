Given(/^a community exists with the name "([^"]*)" and the zipcode "([^"]*)"$/) do |name, zip|
  add = Address.create(zip: zip)
  Community.create(name: name, address: add)
end

When(/^I type in "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" under suggestions$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see "([^"]*)" under suggestions$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end