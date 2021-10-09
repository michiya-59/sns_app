# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  def user
    User.find_by(id: user_id)
  end

  def liked_by?(target_user)
    likes.where(user_id: target_user.id).exists?
  end

  def self.looks(search_word)
    Post.includes(:user).where("content LIKE ?", "%#{sanitize_sql_like(search_word)}%")
  end
end
