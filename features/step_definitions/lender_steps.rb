Given(/^a community exists with login "(.*) (.*)" and name "([^"]*)"$/) do |email, pw, name|
  a = User.create(email: email, password: pw, role: "Community")
  Community.create(name: name, user_id: 20, user_id: a.id)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |arg1, arg2|
  aString = page.body.to_s 
       if aString.index(arg1)!= nil && aString.index(arg2) !=nil
               if aString.index(arg1) < aString.index(arg2)
               else
               assert false,”jr_fail”
               end
       else
               assert false,”jr_fail”
       end
end
