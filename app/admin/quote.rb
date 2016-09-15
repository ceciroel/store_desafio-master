ActiveAdmin.register Quote do

index do
    selectable_column
    id_column
    column :product_id
    column :project_name
    column :client_name
    column :user_email
    column :creation_date
    column :item
    column :item_description
    column :unit_price
    column :quantity
    column :price
    column :total_price
    actions
  end





# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :product_id, :project_name, :client_name, :user_email, :creation_date, :item, :item_description, :unit_price, :quantity, :price, :total_price

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
