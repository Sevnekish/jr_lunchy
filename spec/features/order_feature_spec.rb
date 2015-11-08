require 'rails_helper'

RSpec.feature "Order", type: :feature do

  # before (:each) do
  #   @admin = FactoryGirl.create(:user, admin: true)

  #   @categories = FactoryGirl.create_list(:category, 3)
  #   @menu_items = []
  #   @categories.each do |category|
  #     items = FactoryGirl.create_list(:item, 3, category: category)
  #     @menu_items = @menu_items + items.sample(2)
  #   end

  #   @not_menu_items = Item.all - @menu_items

  #   @monday_id = 'monday'.to_date.wday
  # end

  # feature "Add new" do
  #   before (:each) do
  #     login_as(@admin, :scope => :user)
  #     visit "/admin/day_menus/new"
  #   end

  #   subject { page }

  #   it { should have_selector "input[type=submit][value='Create Day menu']" }
  #   Date::DAYNAMES.each do |day_name|
  #     it { should have_content day_name }
  #   end

  #   it "should have each category" do
  #     Category.all do |category|
  #       should have_content category.name
  #     end
  #   end

  #   it "should have each item" do
  #     Item.all.each do |item|
  #       should have_content item.name
  #     end
  #   end

  #   feature 'with logged in user' do

  #     scenario 'with valid data' do
  #       # choose day of the week
  #       choose "day_menu_day_id_#{@monday_id}"

  #       # choose items
  #       @menu_items.each do |item|
  #         check "day_menu_item_ids_#{item.id}"
  #       end

  #       click_button 'Create Day menu'

  #       expect(current_path).to eql("/admin/day_menus/#{DayMenu.last.id}")

  #       should have_content 'Day menu was successfully created.'

  #       @menu_items.each do |item|
  #         should have_css "td", text: item.name
  #         # should have_content item.name
  #       end

  #       #TODO make with regexp to find uniq
  #       # @not_menu_items.each do |item|
  #       #   should_not have_css "td", text: item.name
  #       #   # should_not have_content item.name
  #       # end

  #       should have_link 'Edit Day Menu'
  #       should have_link 'Delete Day Menu'
  #     end

  #     scenario 'with invalid data' do
  #       # not choose day of the week
  #       # not choose items

  #       click_button 'Create Day menu'

  #       expect(current_path).to eql("/admin/day_menus")

  #       should have_content 'can\'t be blank'
  #     end

  #   end
  # end

end

