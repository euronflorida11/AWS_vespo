class AddAddressToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :longitude, :float
    add_column :teams, :latitude, :float
  end
end
