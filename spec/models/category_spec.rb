# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'associations' do
    it { should have_many(:items).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(150) }
  end
end
