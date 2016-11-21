Given(/^a community exists with login "(.*) (.*)" and name "([^"]*)"$/) do |email, pw, name|
  a = User.create(email: email, password: pw, role: "Community")
  Community.create(name: name, user_id: 20, user_id: a.id)
end

When /^(?:|I )search for name "([^"]*)"$/ do |value|
  fill_in("search_name", :with => value)
  click_button("Search Name")
end

When(/^I search for zipcode "([^"]*)"$/) do |arg1|
  fill_in("search_zipcode", :with => arg1)
  click_button("Search Zipcode")
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
