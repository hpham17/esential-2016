# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   name, community city, community loan amount, community 
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:name => 'Aladdin', :community_city => 'nyc', :community_loan_amount => '1', :community_loan_interest => '8', :community_loan_terms => '9', :community_total_asset_amount => '10', :created_at => DateTime.now, :updated_at => DateTime.now, :encrypted_password => 'a2910u', :email => 'z@a.com'},
    	 {:name => 'The Terminator', :community_city => 'sf', :community_loan_amount => '2', :community_loan_interest => '8', :community_loan_terms => '9', :community_total_asset_amount => '10', :created_at => DateTime.now, :updated_at => DateTime.now, :encrypted_password => 'aashd289', :email => 'b@a.com'},
    	 {:name => 'When Harry Met Sally', :community_city => 'seattle', :community_loan_amount => '3', :community_loan_interest => '8', :community_loan_terms => '9', :community_total_asset_amount => '10', :created_at => DateTime.now, :updated_at => DateTime.now, :encrypted_password => 'ajjjzzkkwk2', :email => 'c@a.com'},
  	 ]

users.each do |user|
  User.create!(user)
  puts user
end