ActiveAdmin.register Task do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

 index do
    selectable_column
    id_column
    column :project_id
    column :admin_user_id
    column :title
    column :is_done
    column :due_date
    actions
  end

 permit_params :project_id, :admin_user_id, :title, :is_done, :due_date

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
