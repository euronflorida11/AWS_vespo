class RenamePrefectureColumnToTeams < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :prefecture, :prefecture_code
  end
end
