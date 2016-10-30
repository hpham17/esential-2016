class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :house_number
      t.string :street
      t.string :state
      t.integer :zip
      t.string :unit
      t.integer :community_id

      t.timestamps null: false
    end
  end
end
