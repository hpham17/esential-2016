Given(/^a community exists with login "(.*) (.*)" and name "([^"]*)"$/) do |email, pw, name|
  a = User.create(email: email, password: pw, role: "Community")
  Community.create! name: name, description: "random", user_id: a.id, max_loan_amount: 1, total_loan_amount: 1, interest_rate: 1, loan_period: 1, number: 1
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )search for name "([^"]*)"$/ do |value|
  fill_in("search", :with => value)
  fill_in("search", :with => "\n")
end

When(/^I search for zipcode "([^"]*)"$/) do |arg1|
  fill_in("search", :with => arg1)
  fill_in("search", :with => "\n")
end

Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |arg1, arg2|
  aString = page.body.to_s
       if aString.index(arg1)!= nil && aString.index(arg2) !=nil
        if aString.index(arg1) < aString.index(arg2)
        else
          assert false
        end
       else
          assert false
       end
end

When /^(?:|I )enter "([^"]*)" with "([^"]*)"$/ do |field, value|
  within('#new_loan_request') do
    fill_in(field, :with => value)
  end
end

Given(/^a borrower submits a loan request to me with the text "([^"]*)"$/) do |text|
  LoanRequest.create(body: text, user_id: User.ids.last, community_id: Community.ids.last)
end

When(/^I follow the link in the email$/) do
  visit path_to('the login page')
end
