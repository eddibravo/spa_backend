class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :username, :limit => 32, :null => false, :default => ''
      t.string :title, :limit => 255, :null => false, :default => ''
      t.text :body, :null => false, :default => ''
      t.timestamps
    end
  end
end
