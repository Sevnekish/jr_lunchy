require 'rails_helper'

RSpec.feature "Item", type: :feature do

  before (:each) do
    @admin = FactoryGirl.create(:user, admin: true)
    @category = FactoryGirl.create(:category)
    @valid_attributes = {
      name:     'test soup',
      price:    120,
      category: @category
    }
  end

  feature "Add new" do
    before (:each) do
      login_as(@admin, :scope => :user)
      visit "/admin/items/new"
    end

    subject { page }

    # it { should have_content 'Create Item' }
    it { should have_selector("input[type=submit][value='Create Item']") }

    scenario 'with logged in user' do
      # find('#item_category_id').find(:xpath, 'option[1]').select_option
      select @category.name, :from => "item_category_id"
      fill_in 'Name',  :with => @valid_attributes[:name]
      fill_in 'Price', :with => @valid_attributes[:price]

      click_button 'Create Item'

      expect(current_path).to eql("/admin/items/#{Item.last.id}")

      should have_content 'Item was successfully created.'

      should have_content @valid_attributes[:name]
      should have_content @valid_attributes[:price]

      should have_link 'Edit Item'
      should have_link 'Delete Item'

    end
  end

  feature 'Edit' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @new_name = "New name"
      @item = FactoryGirl.create(:item)
      visit "/admin/items/#{@item.id}/edit"
    end

    subject { page }

    it { should have_selector("input[type=submit][value='Update Item']") }

    scenario 'with logged in user' do

      fill_in 'Name', :with => @new_name

      click_button 'Update Item'

      expect(current_path).to eql("/admin/items/#{@item.id}")

      should have_content 'Item was successfully updated.'

      should have_content @new_name

      should have_link 'Edit Item'
      should have_link 'Delete Item'

    end
  end

  feature 'Delete' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @item = FactoryGirl.create(:item)
      visit "/admin/items/#{@item.id}"
    end

    subject { page }

    it { should have_link("Edit Item") }
    it { should have_link("Delete Item") }

    scenario 'with logged in user' do

      click_link 'Delete Item'

      expect(current_path).to eql("/admin/items")

      should have_content 'Item was successfully destroyed.'

      should_not have_content @item.name

    end
  end

end