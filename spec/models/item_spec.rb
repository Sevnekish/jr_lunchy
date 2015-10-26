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

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
