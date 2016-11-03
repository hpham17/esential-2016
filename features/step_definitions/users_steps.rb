
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


