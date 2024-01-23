class Product < ActiveRecord::Base
  has_many :product_orders, class_name: "ProductOrder"
  has_many :orders, through: :product_orders
end
