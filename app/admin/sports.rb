ActiveAdmin.register Sport do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :is_active
  #
  # or
  #
  permit_params do
    permitted = [:name, :is_active, :introduction, :image_id, :user_id]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end
  config.sort_order = "updated_at"

  index do
    selectable_column
    id_column
    column :name
    column :is_active
    column :introduction
    column :created_at
    column :updated_at
    actions
  end
end
