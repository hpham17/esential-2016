Then(/^I attempt to sign up with "(.*) (.*)"$/) do |email, pw|
  fill_in("Email", :with => email)
  fill_in("Password", :with => pw)
  fill_in("Password confirmation", :with => pw)
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

Then(/^I should be able to login with "(.*) (.*)"$/) do |email, pw|
  fill_in("Email", :with => email)
  fill_in("Password", :with => pw)
  find('input[name="commit"]').click
end
