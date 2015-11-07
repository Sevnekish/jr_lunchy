require 'rails_helper'

describe FirstOrderForTodayValidator do

  describe '#validates_each(record, attribute, value)' do
    before do
      @user = FactoryGirl.create(:user)
    end

    it 'fails when user has orders for today' do
      order_1 = FactoryGirl.create(:order, user: @user)
      order_2 = FactoryGirl.build(:order, user: @user, items: order_1.items)

      order_2.valid?
      expect(order_2.errors.messages[:user]).to include("You can make order only once a day!")
    end

    it 'passes when text is in the HTML' do
      order_1 = FactoryGirl.build(:order, user: @user)
      expect(order_1).to be_valid
    end

  end

end