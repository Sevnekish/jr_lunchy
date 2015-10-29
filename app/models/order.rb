# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  total           :decimal(, )
#  organization_id :integer
#

class Order < ActiveRecord::Base
  include Filterable

  before_validation :set_total!
  before_validation :set_organization!

  belongs_to :user
  belongs_to :organization

  has_many :order_items, :dependent => :destroy
  has_many :items, through: :order_items

  scope :date, -> (date) { where created_at: date}
  scope :organization, -> (organization) { joins(:organization).where("organizations.name like ?", "#{organization}%")}


  private

    def set_total!
      self.total = items.map(&:price).sum
    end

    def set_organization!
      self.organization = user.organization
    end
end
