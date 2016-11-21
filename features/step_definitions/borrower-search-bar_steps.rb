Given(/^a community exists with the name "([^"]*)" and the zipcode "([^"]*)"$/) do |name, zip|
  add = Address.create(zip: zip)
  Community.create(name: name, address: add)
end