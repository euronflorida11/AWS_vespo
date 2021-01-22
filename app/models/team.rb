class Team < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
