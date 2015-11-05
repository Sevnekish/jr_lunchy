require 'rails_helper'
include Devise::TestHelpers

RSpec.describe Admin::CategoriesController, :type => :controller do 

# No route matches {:action=>"show", :category=>"1", :controller=>"admin/categories"}

# admin_category GET      /admin/categories/:id(.:format)          admin/categories#show

#   describe "GET show" do
#     it "assigns category" do
#       category = FactoryGirl.create(:category)
#       visit admin_category_path(id: category.id)
#       expect(assigns(:category)).to eq([category])
#     end
#   end
end