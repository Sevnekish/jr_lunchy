ActiveAdmin.register DayMenu do
  config.per_page = 20

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
