class AddUserIdToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :user_id, :integer
  end
end
