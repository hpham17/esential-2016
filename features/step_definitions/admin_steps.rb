Given(/^the following users exist:$/) do |users_table|
  users_table.hashes.each do |user|
    @user = User.create! name: user['name'], email: user['email'], password: user['password'], role: user['role']
  end
end

Given(/^the following communities exist:$/) do |communities_table|
  communities_table.hashes.each_with_index do |c, index|
    @community = Community.create! name: c['name'], description: c['description'], number: c['number'], total_loan_amount: c['total_loan_amount'], max_loan_amount: c['max_loan_amount'], interest_rate: c["interest_rate"], loan_period: c["loan_period"], user_id: index
  end
end

When(/^I click "([^"]*)" next to "([^"]*)"$/) do |link, name|
  within("##{name.gsub(/\s+/, "")}") do
    click_link(link)
  end
end

Then(/^I should not see "([^"]*)"$/) do |arg1|
  page.should have_no_content(arg1)
end

Then(/^I should not see "([^"]*)" next to "([^"]*)"$/) do |link, name|
  find("##{name.gsub(/\s+/, "")}").should have_no_content(link)
end
