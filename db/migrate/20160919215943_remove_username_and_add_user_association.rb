class RemoveUsernameAndAddUserAssociation < ActiveRecord::Migration[5.0]
  def up
    remove_column :posts, :username
    add_column :posts, :user_id, :integer
  end

  def down
    add_column :posts, :username, :string, :limit => 32, :null => false, :default => ''
    remove_column :posts, :user_id
  end
end
