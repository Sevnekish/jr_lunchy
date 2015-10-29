# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  total      :decimal(, )
#

class Order < ActiveRecord::Base
  before_validation :set_total!

  belongs_to :user
  has_many :order_items, :dependent => :destroy
  has_many :items, through: :order_items

  private

    def set_total!
      self.total = items.map(&:price).sum
    end
end
