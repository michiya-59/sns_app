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
end
