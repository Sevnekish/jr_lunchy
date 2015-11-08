ActiveAdmin.register Order do
  actions :all, :except => [:new, :edit]
  config.per_page = 20

  filter :user
  filter :organization
  filter :created_at
  filter :updated_at
  filter :total

  index do
    column :id
    column :user
    column :organization
    column :created_at
    column :updated_at
    column :total
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :organization
      row :created_at
      row :updated_at
      row :total
    end
    panel "Items" do

      table_for order.items.order(:category_id) do |item|
        column :name
        column :category
        column :price
      end
    end
    active_admin_comments
  end
end
