class RemoveProductIdFromShoppingCart < ActiveRecord::Migration
  def change
    remove_column :shopping_carts, :product_did
    add_column :shopping_cart_products, :product_did, :integer
  end
end
