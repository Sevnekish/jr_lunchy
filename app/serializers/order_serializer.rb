class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :created_at

  has_one :user
  has_one :organization

  has_many :items
end
