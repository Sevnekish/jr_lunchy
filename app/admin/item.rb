ActiveAdmin.register Item do
  config.per_page = 20

  permit_params :category_id, :name, :price

  index do
    column :id
    column :name
    column :category, :sortable => 'category_id'
    column :price
    column :created_at
    column :updated_at
    actions
  end
end
