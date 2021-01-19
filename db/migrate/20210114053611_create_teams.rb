class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.text :name, null: false
      t.text :introduction
      t.integer :number
      t.string :adress
      t.integer :user_id
      t.integer :sport_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
