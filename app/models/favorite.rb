class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :team
  
  # validates_uniqueness_of :favorite_id, scope: :user_id
end
