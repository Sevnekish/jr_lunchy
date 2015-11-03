FactoryGirl.define do
  factory :user do
    name                  { Faker::Name.name }
    organization          { create :category }
    email                 { Faker::Internet.email }
    password              "password"
    password_confirmation "password"
  end
end