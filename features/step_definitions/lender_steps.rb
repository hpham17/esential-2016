Given(/^a community exists with login "(.*) (.*)"$/) do |email, pw|
  User.create(email: email, password: pw)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then(/^I should see a blank "([^"]*)"$/) do |arg1|
  pending
end

Then(/^I should see "([^"]*)" under "([^"]*)"$/) do |arg1, id|
  if page.respond_to? :should
    page.should have_content(arg1, :id => id)
  else
    assert page.has_content?(arg1, :id => id)
  end
end