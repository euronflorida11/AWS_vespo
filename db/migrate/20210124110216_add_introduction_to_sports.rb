class AddIntroductionToSports < ActiveRecord::Migration[5.2]
  def change
    add_column :sports, :introduction, :text
  end
end
