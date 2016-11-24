class AddLongtitudeToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :longtitude, :float
  end
end
