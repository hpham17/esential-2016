Given(/^a borrower exists with login "(.*) (.*)"$/) do |email, pw|
  User.create(email: email, password: pw)
end

Given(/^a community exists with the name "([^"]*)"$/) do |community_name|
  User.create(name: community_name)
end