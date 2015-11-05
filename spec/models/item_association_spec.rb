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

require 'rails_helper'

RSpec.describe ItemAssociation, type: :model do
end
