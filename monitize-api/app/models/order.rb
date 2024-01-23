class Order < ActiveRecord::Base
  belongs_to :client

  has_many :products_orders, class_name: "ProductOrder"
  has_many :products, through: :products_orders
end
