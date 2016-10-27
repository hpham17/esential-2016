class AddCommunityColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :community_city, :string
    add_column :users, :community_loan_amount, :string
    add_column :users, :community_loan_interest, :string
    add_column :users, :community_loan_terms, :string
    add_column :users, :community_total_asset_amount, :string
  end
end
