class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :team
  # belongs_to :sport
  validates :comment ,presence: true
end
