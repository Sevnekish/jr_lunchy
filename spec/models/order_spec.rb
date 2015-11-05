# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  total           :decimal(, )
#  organization_id :integer
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'callbacks' do
    it { is_expected.to callback(:set_total!).before(:create) }
    it { is_expected.to callback(:set_organization!).before(:create) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:organization) }

    it { should have_many(:item_associations).dependent(:destroy) }
    it { should have_many(:items).through(:item_associations) }
  end

  context 'validations' do
    it { should validate_presence_of :user }
    it { should validate_presence_of :items }
  end

  context 'scopes' do
    before do
      @organization_1 = FactoryGirl.create(:organization)
      # @organization_2 = FactoryGirl.create(:organization)
      @date = DateTime.now - 4.days

      @user_1 = FactoryGirl.create(:user, organization: @organization_1)

      @order_1 = FactoryGirl.create(:order, user: @user_1, created_at: @date.beginning_of_day + 10.minutes)
      @order_2 = FactoryGirl.create(:order, user: @user_1, created_at: @date.beginning_of_day + 30.minutes)

      @order_3 = FactoryGirl.create(:order)
    end

    context ':date' do
      it "should return orders for special day" do
        expect Order.date(@date) == [@order_1, @order_2]
      end
    end

    context ':organization' do
      it "should return orders for special organization" do
        expect Order.organization(@organization_1.name) == [@order_1, @order_2]
      end
    end

  end

  context '#set_total!' do
    before do
      @items = FactoryGirl.create_list(:item, 3)
      @order = FactoryGirl.build(:order, items: @items)
    end

    it { expect{ @order.send(:set_total!) }.to change{@order.total}.from(nil).to(@items[0].price + @items[1].price + @items[2].price) }

  end

  context '#set_organization!' do
    before do
      @order = FactoryGirl.build(:order)
    end

    it { expect{ @order.send(:set_organization!) }.to change{@order.organization}.from(nil).to(@order.user.organization) }
  end
end
