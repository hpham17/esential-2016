Then(/^I should see a Google map$/) do
  page.has_selector?('div#markers')
end

Then(/^I should be able to zoom in and out$/) do
  page.has_selector?("div[title='Zoom in']")
end

When(/^I click on the marker for "Berkeley"$/) do
  find("div[title='Berkeley']").click
end

Given(/^the following communities with addresses exist:$/) do |communities_table|
  communities_table.hashes.each_with_index do |c, index|
    @community = Community.create! name: c['name'], description: c['description'], user_id: index, max_loan_amount: 1, total_loan_amount: 1, interest_rate: 1, loan_period: 1, number: 1
    @address = Address.create! house_number: c['house_number'], street: c['street'], city: c['city'], state: c['state'], zip: c['zip'], community_id: @community.id
  end
end

When(/^I follow the link in the info window$/) do
  pending
end

Then(/^I should see its info window$/) do
  within('.gm-style-iw') do
    page.should have_content('Berkeley')
  end
end

Then(/^I should see a marker placed at zipcode "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
