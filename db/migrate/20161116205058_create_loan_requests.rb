class CreateLoanRequests < ActiveRecord::Migration
  def change
    create_table :loan_requests do |t|
      t.string :body
      t.integer :user_id
      t.integer :community_id
      t.boolean :accepted, default: false

      t.timestamps null: false
    end
  end
end
