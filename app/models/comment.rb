class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :team
  # belongs_to :sport
  has_many :notifications, dependent: :destroy
  validates :comment, presence: true
end
