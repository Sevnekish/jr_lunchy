FactoryGirl.define do
  factory :item do
    name     { Faker::App.name }
    category { create :category }
    price    { Faker::Number.between(30, 150) }
  end
end