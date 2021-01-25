class RenamePostalCodeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
     rename_column :users, :postal_code, :postcode
  end
end
