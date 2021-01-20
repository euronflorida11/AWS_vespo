class AddImageIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :image_id, :string
  end
end
