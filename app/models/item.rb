# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  has_many :day_menu_items
  has_many :day_menus, through: :day_menu_items

  # scope :by_category, -> { order(price: :desc) }

  # def for_this_day(date)
    
  # end
end
