# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
User.create(email: 'chase@gmail.com', password: 'chases', name: 'Chase Smith', address: '2212 Blue St, Berkeley, CA 94704', phone_number: '9491231234', role: 'Admin')

# Borrowers
5.times do |i|
  User.create(email: "test#{i}@gmail.com", name: "Hubert#{i}", password: 'hubert', role: "Borrower")
end

# Lenders
5.times do |i|
  User.create(email: "test#{i+5}@gmail.com", name: "Hubert#{i+5}", password: 'hubert', role: "Community")
end

# Communities
5.times do |i|
  Community.create(name: "Berkeley#{i}", user_id: i+5, total_loan_amount: 10000, max_loan_amount: 500, interest_rate: 5, loan_period: 12, description: 'Hello! We are a humble community that loves to help those in need. We are a friendly bunch and only ask that you join our community and help around with the church and volunteer at our events. Thank you!')
end
