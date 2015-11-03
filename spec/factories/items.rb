FactoryGirl.define do
  factory :item do
    name     { Faker::Address.country }
    category { create :category }
    price    { Faker::Address.city }
  end
end