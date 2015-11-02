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

  has_many :item_associations, dependent: :destroy
  has_many :orders, through: :item_associations
  has_many :day_menus, through: :item_associations

end
