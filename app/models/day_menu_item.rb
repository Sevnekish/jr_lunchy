# == Schema Information
#
# Table name: day_menu_items
#
#  id          :integer          not null, primary key
#  day_menu_id :integer
#  item_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DayMenuItem < ActiveRecord::Base
  belongs_to :day_menu
  belongs_to :item
end
