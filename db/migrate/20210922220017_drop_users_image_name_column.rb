# frozen_string_literal: true

class DropUsersImageNameColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :image_name, :string
    add_column :users, :profile_image, :string
  end
end
