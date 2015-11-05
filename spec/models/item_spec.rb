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

require 'rails_helper'

RSpec.describe Item, type: :model do

  context 'associations' do
    it { should belong_to(:category) }
    it { should have_many(:item_associations).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of :category }

    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(150) }

    it { should validate_presence_of :price }
  end

end
