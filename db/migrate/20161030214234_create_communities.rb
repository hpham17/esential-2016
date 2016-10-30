class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.integer :total_loan_amount
      t.integer :interest_rate
      t.string :terms
      t.string :max_loan_amount
      t.string :name
      t.string :loan_period
      t.string :description
      t.string :number
      t.string :email
      t.string :website

      t.timestamps null: false
    end
  end
end
