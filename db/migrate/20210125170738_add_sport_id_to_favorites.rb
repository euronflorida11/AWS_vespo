class AddSportIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :sport_id, :integer
  end
end
