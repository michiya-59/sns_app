class RemoveUserId < ActiveRecord::Migration[6.1]
  def up
    remove_column :users,:user_id
  end

  def down
    add_column :users,:user_id,:integer
  end
end
