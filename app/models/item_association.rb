# == Schema Information
#
# Table name: item_associations
#
#  id                    :integer          not null, primary key
#  item_id               :integer
#  item_association_id   :integer
#  item_association_type :string
#  price                 :decimal(, )
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class ItemAssociation < ActiveRecord::Base
  before_create :set_price!

  belongs_to :item_association, polymorphic: true
  belongs_to :item

  private

    def set_price!
      self.price = item.price
    end
end
