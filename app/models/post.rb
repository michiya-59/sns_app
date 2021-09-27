class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  def user
    return User.find_by(id: self.user_id)
  end

  def liked_by?(target_user)
    likes.where(user_id: target_user.id).exists?
  end
end
