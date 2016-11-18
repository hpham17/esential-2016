class AddZipcodeToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :zipcode, :integer
  end
end
