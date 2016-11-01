# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
User.create(email: 'hubes@gmail.com', password: 'hubert', name: 'Hubert Pham', address: '2212 Blue St, Berkeley, CA 94704', phone_number: '9491231234', role: 'Admin')

# Borrowers
5.times do |i|
  User.create(email: "test#{i}@gmail.com", name: "Hubert#{i}", password: 'hubert')
end

# Lenders
5.times do |i|
  User.create(email: "test#{i+5}@gmail.com", name: "Hubert#{i+5}", password: 'hubert', role: "Community")
end

# Community
5.times do |i|
  Community.create(name: "Berkeley#{i}", user_id: i+5, total_loan_amount: 100, interest_rate: 5, description: 'This is a description.')
end
