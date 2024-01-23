class AddAmountToOrderProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products_orders, :amount, :integer
  end
end
