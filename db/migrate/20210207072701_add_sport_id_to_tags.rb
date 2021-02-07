class AddSportIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :sport_id, :integer
  end
end
