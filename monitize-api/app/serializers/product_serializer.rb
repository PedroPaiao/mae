class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :duration, :amount
end
