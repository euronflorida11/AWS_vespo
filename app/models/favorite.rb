class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :team
  # belongs_to :sport
  # validates_uniqueness_of :favorite_id, scope: :user_id
end
