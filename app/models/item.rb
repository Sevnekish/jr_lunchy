# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :integer
#  price       :decimal(, )
#  is_deleted  :boolean          default(FALSE)
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
end
