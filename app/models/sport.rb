class Sport < ApplicationRecord
  has_many :teams
  attachment :image
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 500}
end
