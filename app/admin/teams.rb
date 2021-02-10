ActiveAdmin.register Team do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :introduction, :number, :address, :user_id, :sport_id, :status, :image_id
  #
  # or
  #
  permit_params do
    permitted = [:name, :introduction, :number, :address, :user_id, :sport_id, :status, :image_id, :longitude, :latitude, :prefecture]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end
  config.sort_order = "updated_at"

  index do
    selectable_column
    id_column
    column :name
    column :introduction
    column :number
    column :prefecture
    column :address
    column :user_id
    column :sport_id
    column :status
    column :created_at
    column :updated_at
    actions
  end
end
