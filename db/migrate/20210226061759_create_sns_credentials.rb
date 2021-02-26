class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.integer :user_id, foreign_key: true
      t.string  :uid
      t.string  :provider
      t.timestamps
    end
  end
end
