class ChangeDatatypePrefectureCodeOfTeams < ActiveRecord::Migration[5.2]
  def change
     change_column :teams, :prefecture_code, :integer
  end
end
