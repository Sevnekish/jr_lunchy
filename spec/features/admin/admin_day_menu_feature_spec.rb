require 'rails_helper'

RSpec.feature "Day menu", type: :feature do

  before (:each) do
    @admin = FactoryGirl.create(:user, admin: true)

    @categories = FactoryGirl.create_list(:category, 3)
    @menu_items = []
    @categories.each do |category|
      items = FactoryGirl.create_list(:item, 3, category: category)
      @menu_items = @menu_items + items.sample(2)
    end

    @not_menu_items = Item.all - @menu_items

    @monday_id = 'monday'.to_date.wday
  end

  feature "Add new" do
    before (:each) do
      login_as(@admin, :scope => :user)
      visit "/admin/day_menus/new"
    end

    subject { page }

    it { should have_selector "input[type=submit][value='Create Day menu']" }
    Date::DAYNAMES.each do |day_name|
      it { should have_content day_name }
    end

    it "should have each category" do
      Category.all do |category|
        should have_content category.name
      end
    end

    it "should have each item" do
      Item.all.each do |item|
        should have_content item.name
      end
    end

    feature 'with logged in user' do

      scenario 'with valid data' do
        # choose day of the week
        choose "day_menu_day_id_#{@monday_id}"

        # choose items
        @menu_items.each do |item|
          check "day_menu_item_ids_#{item.id}"
        end

        click_button 'Create Day menu'

        expect(current_path).to eql("/admin/day_menus/#{DayMenu.last.id}")

        should have_content 'Day menu was successfully created.'

        @menu_items.each do |item|
          should have_css "td", text: item.name
          # should have_content item.name
        end

        #TODO make with regexp to find uniq
        # @not_menu_items.each do |item|
        #   should_not have_css "td", text: item.name
        #   # should_not have_content item.name
        # end

        should have_link 'Edit Day Menu'
        should have_link 'Delete Day Menu'
      end

      scenario 'with invalid data' do
        # not choose day of the week
        # not choose items

        click_button 'Create Day menu'

        expect(current_path).to eql("/admin/day_menus")

        should have_content 'can\'t be blank'
      end

    end
  end

  feature 'Edit' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @day_menu = FactoryGirl.create(:day_menu, day_id: @monday_id, items: @menu_items)
      @another_day_id = 'wednesday'.to_date.wday
      visit "/admin/day_menus/#{@day_menu.id}/edit"
    end

    subject { page }

    it { should have_selector("input[type=submit][value='Update Day menu']") }

    it { expect(page.find(:xpath, "//input[@id=\"day_menu_day_id_#{@day_menu.day_id}\"]")['checked']).to be_truthy }

    it "should have each items" do
      Item.all.each do |item|
        have_selector("input[type=checkbox][value='#{item.name}']")
      end
    end

    it "should have checked items that contains in Day menu" do
      @menu_items.each do |item|
        # have_selector("input[type=checkbox][value='#{item.name}']")
        expect(page.find("#day_menu_item_ids_#{item.id}").checked?).to be_truthy
        # expect(page.find(:xpath, "//input[type=checkbox][value='#{item.name}']")['checked']).to be_truthy
      end
    end

    it "should not have checked items that not contains in Day menu" do
      @not_menu_items.each do |item|
        expect(page.find("#day_menu_item_ids_#{item.id}").checked?).to be_falsey
      end
    end

    scenario 'with logged in user' do
      # choose another day of the week
      choose "day_menu_day_id_#{@another_day_id}"

      new_items = @not_menu_items
      old_items = @menu_items

      # choose another items
      new_items.each do |item|
        check "day_menu_item_ids_#{item.id}"
      end
      # uncheck old items
      old_items.each do |item|
        uncheck "day_menu_item_ids_#{item.id}"
      end

      click_button 'Update Day menu'

      expect(current_path).to eql("/admin/day_menus/#{@day_menu.id}")

      should have_content 'Day menu was successfully updated.'

      new_items.each do |item|
        should have_css "td", text: item.name
      end

      # old_items.each do |item|
      #   should_not have_css "td", text: item.name
      # end

      should have_link 'Edit Day Menu'
      should have_link 'Delete Day Menu'

    end
  end

  feature 'Delete' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @day_menu = FactoryGirl.create(:day_menu, day_id: @monday_id, items: @menu_items)
      visit "/admin/day_menus/#{@day_menu.id}"
    end

    subject { page }

    it { should have_link("Edit Day Menu") }
    it { should have_link("Delete Day Menu") }

    scenario 'with logged in user' do

      click_link 'Delete Day Menu'

      expect(current_path).to eql("/admin/day_menus")

      should have_content 'Day menu was successfully destroyed.'

      # should_not have_content @day_menu.id
      should_not have_css "td", text: @day_menu.id

    end
  end

end