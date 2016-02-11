class AddOrderStatusToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :order_status, :string
    add_column :products, :brand, :string
  end
end
