FactoryGirl.define do
  factory :day_menu do
    day_id { Faker::Number.between(1, 5) }
    items {
      create_list(:item, 3)
    }
  end
end