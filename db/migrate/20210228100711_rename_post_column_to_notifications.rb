class RenamePostColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :post_id, :team_id                                                
  end
end
