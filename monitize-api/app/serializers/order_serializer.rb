class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :status, :created_at

  has_one :client

  def total_price
    object.products_orders.map { |o| o.price * o.amount }.sum
  end

  def status
    'missing'
  end
end
