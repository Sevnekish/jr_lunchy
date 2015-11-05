require 'rails_helper'

RSpec.feature "Organization", type: :feature do

  before (:each) do
    @admin = FactoryGirl.create(:user, admin: true)
    @valid_attributes = {
      name: 'Organization name'
    }
  end

  feature "Add new" do
    before (:each) do
      login_as(@admin, :scope => :user)
      visit "/admin/organizations/new"
    end

    subject { page }

    it { should have_selector("input[type=submit][value='Create Organization']") }

    scenario 'with logged in user' do

      fill_in 'Name',  :with => @valid_attributes[:name]

      click_button 'Create Organization'

      expect(current_path).to eql("/admin/organizations/#{Organization.last.id}")

      should have_content 'Organization was successfully created.'

      should have_content @valid_attributes[:name]

      should have_link 'Edit Organization'
      should have_link 'Delete Organization'

    end
  end

  feature 'Edit' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @new_name = "New name"
      @organization = FactoryGirl.create(:organization)
      visit "/admin/organizations/#{@organization.id}/edit"
    end

    subject { page }

    it { should have_selector("input[type=submit][value='Update Organization']") }

    scenario 'with logged in user' do

      fill_in 'Name', :with => @new_name

      click_button 'Update Organization'

      expect(current_path).to eql("/admin/organizations/#{@organization.id}")

      should have_content 'Organization was successfully updated.'

      should have_content @new_name

      should have_link 'Edit Organization'
      should have_link 'Delete Organization'

    end
  end

  feature 'Delete' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @organization = FactoryGirl.create(:organization)
      visit "/admin/organizations/#{@organization.id}"
    end

    subject { page }

    it { should have_link("Edit Organization") }
    it { should have_link("Delete Organization") }

    scenario 'with logged in user' do

      click_link 'Delete Organization'

      expect(current_path).to eql("/admin/organizations")

      should have_content 'Organization was successfully destroyed.'

      should_not have_content @organization.name

    end
  end

end