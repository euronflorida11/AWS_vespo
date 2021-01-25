class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :team
  validates :comment ,presence: true
end
