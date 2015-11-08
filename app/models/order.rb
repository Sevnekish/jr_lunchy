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

  before_create :set_total!
  before_create :set_organization!

  belongs_to :user
  belongs_to :organization

  has_many :item_associations, as: :item_association, dependent: :destroy
  has_many :items, through: :item_associations

  scope :date, -> (date) { where created_at: date.beginning_of_day..date.end_of_day}
  scope :organization, -> (organization) { joins(:organization).where("organizations.name like ?", "#{organization}%")}

  validates :user,  presence: true
  validates :items, presence: true, order_items: true

  private

    def set_total!
      self.total = items.map(&:price).sum
    end

    def set_organization!
      self.organization = user.organization
    end
end
