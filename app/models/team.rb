class Team < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  attachment :image
end
