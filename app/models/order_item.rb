# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :decimal(, )
#

class OrderItem < ActiveRecord::Base
  before_create :set_price!

  belongs_to :order
  belongs_to :item

  validates :price, presence: true, numericality: true

  private

    def set_price!
      self.price = item.price
    end

end
