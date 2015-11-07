FactoryGirl.define do
  factory :order do
    user { create :user }
    # items {
    #   # create_list(:item, 3)
    #   create(:day_menu).items
    # }
    after(:build) do |user|
      if user.items.empty?
        day_menu_items = create(:day_menu, day_id: DateTime.now.wday).items
        user.items << [ day_menu_items[0], day_menu_items[3], day_menu_items[6] ]
      end
    end
  end
end