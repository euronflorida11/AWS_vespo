class RenameColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :adress, :address
  end
end
