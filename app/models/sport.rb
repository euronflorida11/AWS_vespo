class Sport < ApplicationRecord
  has_many :teams
  has_many :tags, dependent: :destroy
  attachment :image
  validates :name, length: { maximum: 20, minimum: 2 }, uniqueness: true
  validates :introduction, length: { maximum: 500 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
