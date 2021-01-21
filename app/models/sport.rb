class Sport < ApplicationRecord
  has_many :taems
  validates :name, presence: true
end
