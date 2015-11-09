class ItemSerializer < ActiveModel::Serializer
  attributes :name, :price

  has_one :category
end
