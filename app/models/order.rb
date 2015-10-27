# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :

  # has_many :order_items, :dependent => :destroy, :class_name => 'Shoppe::OrderItem', :inverse_of => :order
  # accepts_nested_attributes_for :order_items, :allow_destroy => true, :reject_if => Proc.new { |a| a['ordered_item_id'].blank? }

  # # All products which are part of this order (accessed through the items)
  # has_many :products, :through => :order_items, :class_name => 'Shoppe::Product', :source => :ordered_item, :source_type => 'Shoppe::Product'

  # # The order can belong to a customer
  # belongs_to :customer, :class_name => 'Shoppe::Customer'
end
