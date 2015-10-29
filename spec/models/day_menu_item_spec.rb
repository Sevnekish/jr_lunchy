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

require 'rails_helper'

RSpec.describe DayMenuItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
