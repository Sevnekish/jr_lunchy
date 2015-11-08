require 'rails_helper'

describe OrderItemsValidator do

  describe '#validates_each(record, attribute, value)' do
    before do
      @user = FactoryGirl.create(:user)
    end

    it 'fails when items not from today menu' do
      today_menu = FactoryGirl.create(:day_menu)

      another_day = DateTime.now - 2.days
      another_day_menu = FactoryGirl.create(:day_menu, day_id: another_day.wday, created_at: another_day)
      order = FactoryGirl.build(:order, user: @user, items: [another_day_menu.items[0], another_day_menu.items[3], another_day_menu.items[6]])

      order.valid?
      expect(order.errors.messages[:items]).to include('Items must be from today\'s menu!')
    end

    it 'fails when items not from each category from menu' do
      order = FactoryGirl.build(:order)
      order.items = order.items.drop(1)

      order.valid?
      expect(order.errors.messages[:items]).to include('Order must contain one item for each category!')
    end

    it 'fails when items not from today menu' do
      today_menu = FactoryGirl.create(:day_menu)
      order = FactoryGirl.build(:order, items: [
        today_menu.items[0], today_menu.items[1],
        today_menu.items[3],
        today_menu.items[6]
      ])

      order.valid?
      expect(order.errors.messages[:items]).to include('Order can contain only one item for each category!')
    end

    it 'passes when all items from today\'s menu and one item per category from menu' do
      order = FactoryGirl.build(:order)
      expect(order).to be_valid
    end

  end

end