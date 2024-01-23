class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :priority
      t.integer :discount
      t.integer :total_price

      t.belongs_to :client

      t.timestamps
    end

    create_table :products_orders do |t|
      t.integer :price

      t.belongs_to :order
      t.belongs_to :product

      t.timestamps
    end
  end
end
