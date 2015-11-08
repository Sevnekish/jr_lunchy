FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.words(rand(2..3)) }
  end
end