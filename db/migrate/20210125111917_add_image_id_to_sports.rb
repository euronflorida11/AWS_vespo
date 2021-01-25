class AddImageIdToSports < ActiveRecord::Migration[5.2]
  def change
    add_column :sports, :image_id, :string
  end
end
