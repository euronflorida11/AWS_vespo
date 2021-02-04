ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :last_name, :first_name, :kana_last_name, :kana_first_name, :handle_name, :postal_code, :address, :phone_number, :is_deleted
  #
  # or
  #
  permit_params do
    permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :last_name, :first_name, :kana_last_name, :kana_first_name, :handle_name, :postcode, :address, :phone_number, :is_deleted, :prefecture_code, :address_city, :address_street, :address_building, :introduction]
    permitted << :other if params[:action] == 'create' && current_admin_user
    permitted
  end

  config.sort_order = "updated_at"

  index do
    selectable_column
    id_column
    column :handle_name
    column :email
    column :phone_number
    column :introduction
    column :is_deleted
    column :last_name
    column :first_name
    column :kana_last_name
    column :kana_first_name
    column :postcode
    column :prefecture_name
    column :address_city
    column :address_street
    column :address_building
    column :created_at
    column :updated_at
    actions
  end
end
