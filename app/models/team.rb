class Team < ApplicationRecord
  belongs_to :user
  belongs_to :sport, optional: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :tags, dependent: :destroy
  attachment :image
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 20, minimum: 2 }, uniqueness: true
  validates :introduction, length: { maximum: 500 }
  validates :number, presence: true, numericality: true
  validates :address, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum status: { active: 0, inactive: 1 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
