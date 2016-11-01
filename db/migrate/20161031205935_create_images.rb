class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :location
      t.integer :user_id
      t.integer :community_id

      t.timestamps null: false
    end
  end
end
