When(/^I type in "([^"]*)"$/) do |arg1|
  fill_in("search", :with => arg1)
end
