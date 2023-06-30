class AddUserIdToFriendLists < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_lists, :user_id, :integer
    add_index :friend_lists, :user_id
  end
end
