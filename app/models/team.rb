class Team < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :comments, dependent: :destroy
  attachment :image
end
