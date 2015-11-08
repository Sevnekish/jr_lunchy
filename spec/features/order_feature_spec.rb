require 'rails_helper'

RSpec.feature "Order", type: :feature do

  before (:each) do
    @admin = FactoryGirl.create(:user, admin: true)
    @user = FactoryGirl.create(:user)

    @today_menu = FactoryGirl.create(:day_menu)
  end

  feature "Add new" do
    subject { page }

    feature 'with logged in user' do

      before (:each) do
        login_as(@user, :scope => :user)
        visit "/orders/new"
      end

      subject { page }

      it { should have_button 'Create Order' }

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


      scenario 'with valid data' do

        # choose items
        all('select').each do |select|
          select.find(:xpath, 'option[2]').select_option
        end

        click_button 'Create Order'

        expect(current_path).to eql("/orders")

        should have_content 'Order was successfully created.'

        Order.last.items.each do |item|
          should have_content item.name, count: 2
        end

        should_not have_link 'Make order'
      end

      scenario 'with invalid data' do
        # not choose items

        click_button 'Create Order'

        expect(current_path).to eql("/orders")

        should have_content 'can\'t be blank'
      end

    end

    feature 'with logged ont user' do
      before (:each) do
        visit 'orders/new'
      end
      
      it { should_not have_link 'Week menu' }

      it { expect(current_path).to eql('/users/sign_in') }
      it { should have_content 'You need to sign in or sign up before continuing.' }
    end
  end

end

