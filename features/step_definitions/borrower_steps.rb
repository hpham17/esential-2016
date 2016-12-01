Given(/^a borrower exists with login "(.*) (.*)"$/) do |email, pw|
  User.create(email: email, password: pw, role: "Borrower")
end

Given(/^a lender exists with login "(.*) (.*)"$/) do |email, pw|
  User.create!(email: email, password: pw, role: "Community")
end
