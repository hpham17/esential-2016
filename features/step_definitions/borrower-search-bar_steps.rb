When(/^I type in "([^"]*)"$/) do |arg1|
  fill_in("search", :with => arg1)
end

Given(/^a community exists with the name "([^"]*)" and the zipcode "([^"]*)"$/) do |name, zip|
  a = Community.create! name: name, description: "random", user_id: 1, max_loan_amount: 1, total_loan_amount: 1, interest_rate: 1, loan_period: 1, number: 1
  address = Address.create! house_number: 2212, street: "Blake St", city: "Berkeley", state: "CA", zip: zip, community_id: a.id
end

Given(/^a community exists with the name "([^"]*)"$/) do |name|
  Community.create! name: name, description: "random", user_id: 1, max_loan_amount: 1, total_loan_amount: 1, interest_rate: 1, loan_period: 1, number: 1
end

Then(/^I should see "([^"]*)" in the dropdown$/) do |arg1|
  if page.respond_to? :expect
    within('.dropdown-content') do
      expect.to have_content(text)
    end
  end
end

Then(/^I should not see "([^"]*)" in the dropdown$/) do |arg1|
  if page.respond_to? :expect
    within('.dropdown-content') do
      expect.to_not have_content(text)
    end
  end
end

Then(/^I should not be on my dashboard page$/) do
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should_not == '/dashboard'
  end
end
