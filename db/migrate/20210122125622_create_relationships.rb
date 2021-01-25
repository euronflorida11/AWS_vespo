class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer  "follower_id"
      t.integer  "followed_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
  end
end
