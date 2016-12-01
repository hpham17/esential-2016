Given(/^a borrower exists with login "(.*) (.*)"$/) do |email, pw|
  User.create(email: email, password: pw, role: "Borrower")
end

Given(/^a community exists with the name "([^"]*)" and the zipcode "([^"]*)"$/) do |name, zip|
  a = Community.create! name: name, description: "random", user_id: 1, max_loan_amount: 1, total_loan_amount: 1, interest_rate: 1, loan_period: 1, number: 1
  address = Address.create! house_number: 2212, street: "Blake St", city: "Berkeley", state: "CA", zip: zip, community_id: a.id
end
