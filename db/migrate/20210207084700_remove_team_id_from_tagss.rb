class RemoveTeamIdFromTagss < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :team_id, :integer
  end
end
