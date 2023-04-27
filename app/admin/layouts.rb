ActiveAdmin.register Layout do

  menu priority: 2
  permit_params :name, :address, :total_plots , :sold, :pending, :amt_sold
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :total_plots, :sold, :pending, :amt_sold]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :name
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :total_plots
    end
    f.actions
  end
  
end
