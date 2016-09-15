ActiveAdmin.register Project do

index do
    selectable_column
    id_column
    column :product_id
    column :project_name
    column :client_name
    column :user_email
    column :creation_date
    column :due_date
    column :problem
    column :objective
    column :target_market
    column :business_description
    column :project_description 
    column :expected_results
    column :important_notes
    actions
  end







# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :product_id, :project_name, :client_name, :user_email, :creation_date, :due_date, :problem, :objective, :target_market, :business_description, :project_description , :expected_results, :important_notes


# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end



end
