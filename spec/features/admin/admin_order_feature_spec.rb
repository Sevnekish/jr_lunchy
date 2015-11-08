require 'rails_helper'

RSpec.feature "Order", type: :feature do

  before (:each) do
    @admin = FactoryGirl.create(:user, admin: true)
  end

  feature 'Delete' do
    before (:each) do
      login_as(@admin, :scope => :user)
      @order = FactoryGirl.create(:order)
      visit "/admin/orders/#{@order.id}"
    end

    subject { page }

    it { should_not have_link("Edit Order") }
    it { should have_link("Delete Order") }

    scenario 'with logged in admin' do

      click_link 'Delete Order'

      expect(current_path).to eql("/admin/orders")

      should have_content 'Order was successfully destroyed.'

      should_not have_css "td", text: @order.id

    end
  end

end