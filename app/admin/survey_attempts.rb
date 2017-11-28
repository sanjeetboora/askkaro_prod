ActiveAdmin.register Survey::Attempt do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
  filter  :name,
          :as => :select,
          :collection => proc {
            Survey::Attempt.select("distinct(id)").collect { |c|
              [c.id, c.id]
            }
          }
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
