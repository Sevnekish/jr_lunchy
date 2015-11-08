ActiveAdmin.register DayMenu do
  config.per_page = 20

  filter :day_id, as: :select, collection: Date::DAYNAMES.zip((0..7).to_a)
  filter :created_at, as: :date_range

  permit_params :day_id, :item_ids => []

  index do
    column :id
    column "Day", :sortable => 'day_id' do |day_menu|
      Date::DAYNAMES[day_menu.day_id]
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    panel "Info" do
      table_for day_menu do
        column :id
        column "Day" do |day_menu|
          Date::DAYNAMES[day_menu.day_id]
        end
        column :created_at
        column :updated_at
      end
    end
    panel "Items" do
      # Category.all.each do |category|
      #   panel category.name do
          # table_for day_menu.items.where(category: category) do |item|
          table_for day_menu.items.order(:category_id) do |item|
            column :name
            column :category
            column :price
          end
      #   end
      # end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Day menu" do
      # f.input :day_id, :as => :radio, :collection => Date::DAYNAMES[1..5].zip((1..5).to_a)
      f.input :day_id, :as => :radio, :collection => Date::DAYNAMES.zip((0..7).to_a)
      Category.all.each do |category|
        f.input :items, :label => "Items (#{category.name})", :as => :check_boxes, :collection => Item.where(category: category)
      end
    end
    f.actions
  end

  # new do
    
  # end
end
