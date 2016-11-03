Given(/^a borrower exists with login "(.*) (.*)"$/) do |email, pw|
  User.create(email: email, password: pw, role: "Borrower")
end

Given(/^a community exists with the name "([^"]*)"$/) do |community_name|
  Community.create(name: community_name)
end
