class Team < ApplicationRecord
  belongs_to :user
  belongs_to :sport, optional: true
  # has_many :sports, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 20, minimum: 2 }, uniqueness: true
  validates :introduction, length: { maximum: 500 }
  validates :number, presence: true, numericality: true
  validates :address, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum status:  { active: 0, unactive: 1 }

  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?
end
