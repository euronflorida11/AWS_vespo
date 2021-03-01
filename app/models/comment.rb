class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :notifications, dependent: :destroy
  validates :comment, presence: true
end
