class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :sport
end
