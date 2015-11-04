FactoryGirl.define do
  factory :order do
    user { create :user }
    items {
      create_list(:item, 3)
    }
  end
end