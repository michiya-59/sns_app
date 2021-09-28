class ChangeUserPostIdToLikes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :likes, :user_id, false, 0
    change_column_default :likes, :user_id, from: nil, to: 0
    change_column_null :likes, :post_id, false, 0
    change_column_default :likes, :post_id, from: nil, to: 0
  end
end
