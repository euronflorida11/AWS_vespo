class Tag < ApplicationRecord
  # belongs_to :team
  belongs_to :sport
  #has_many :sports, dependent: :destroy
end
