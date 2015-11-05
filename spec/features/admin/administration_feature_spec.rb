require 'rails_helper'

RSpec.feature "Administration", type: :feature do
  before do
    @admin = FactoryGirl.create(:user)
    @user  = FactoryGirl.create(:user)
  end

  subject { page }

  feature "Administration access" do

    feature 'when logged in' do

      scenario 'as admin' do
        login_as(@admin, :scope => :user)
        visit '/'
        should have_link 'Administration'
        click_link 'Administration'
        expect(current_path).to eql("/admin")
      end

      scenario 'as user' do
        login_as(@user, :scope => :user)
        visit '/'
        should_not have_link 'Administration'
        visit '/admin'
        expect(current_path).to eql('/')
        should have_content 'You are not authorized to access this resource!'
      end

    end

    scenario 'when logged out' do
      visit '/'
      should_not have_link 'Administration'
      visit '/admin'
      expect(current_path).to eql('/users/sign_in')
      should have_content 'You need to sign in or sign up before continuing.'
    end

  end

end