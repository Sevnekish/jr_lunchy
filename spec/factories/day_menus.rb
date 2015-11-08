FactoryGirl.define do
  factory :day_menu do
    day_id { DateTime.now.wday }
    items {
      create_list(:item, 3, category: create(:category)) + create_list(:item, 3, category: create(:category)) + create_list(:item, 3, category: create(:category))
    }
    created_at DateTime.now.beginning_of_day
  end
end