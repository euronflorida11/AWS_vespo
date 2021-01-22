class Sport < ApplicationRecord
  has_many :teams
  validates :name, presence: true
end
