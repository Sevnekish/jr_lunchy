ActiveAdmin.register DayMenu do
  permit_params :day_id, :item_ids => []

  form do |f|
    f.inputs "Day menu" do
      f.input :day_id, :as => :radio, :collection => Date::DAYNAMES[1..5].zip((1..5).to_a)
      Category.all.each do |category|
        f.input :items, :label => "Items (#{category.name})", :as => :check_boxes, :collection => Item.where(category: category)
      end
    end
    f.actions
  end

  # new do
    
  # end
end
