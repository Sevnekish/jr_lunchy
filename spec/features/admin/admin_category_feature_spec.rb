require 'rails_helper'

RSpec.feature "Category", type: :feature do

  before (:each) do
    @admin = FactoryGirl.create(:user, admin: true)
    @valid_attributes = {
      name: 'category name'
    }
  end

  feature "Add new" do
    before (:each) do
      login_as(@admin, :scope => :user)
      visit "/admin/categories/new"
    end

    subject { page }

    it { should have_selector("input[type=submit][value='Create Category']") }

    scenario 'with logged in user' do

      fill_in 'Name',  :with => @valid_attributes[:name]

      click_button 'Create Category'

      expect(current_path).to eql("/admin/categories/#{Category.last.id}")

      should have_content 'Category was successfully created.'

      should have_content @valid_attributes[:name]

      should have_link 'Edit Category'
      should have_link 'Delete Category'

    end
  end

  feature 'Edit' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @new_name = "New name"
      @category = FactoryGirl.create(:category)
      visit "/admin/categories/#{@category.id}/edit"
    end

    subject { page }

    it { should have_selector("input[type=submit][value='Update Category']") }

    scenario 'with logged in user' do

      fill_in 'Name', :with => @new_name

      click_button 'Update Category'

      expect(current_path).to eql("/admin/categories/#{@category.id}")

      should have_content 'Category was successfully updated.'

      should have_content @new_name

      should have_link 'Edit Category'
      should have_link 'Delete Category'

    end
  end

  feature 'Delete' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @category = FactoryGirl.create(:category)
      visit "/admin/categories/#{@category.id}"
    end

    subject { page }

    it { should have_link("Edit Category") }
    it { should have_link("Delete Category") }

    scenario 'with logged in user' do

      click_link 'Delete Category'

      expect(current_path).to eql("/admin/categories")

      should have_content 'Category was successfully destroyed.'

      should_not have_content @category.name

    end
  end

end