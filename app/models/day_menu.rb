# == Schema Information
#
# Table name: day_menus
#
#  id         :integer          not null, primary key
#  day_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DayMenu < ActiveRecord::Base
  has_many :day_menu_items
  has_many :items, through: :day_menu_items
end
