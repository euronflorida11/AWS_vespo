class Team < ApplicationRecord
  belongs_to :user
  attachment :image
end
