class AddPrefectureToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :prefecture, :string
  end
end
