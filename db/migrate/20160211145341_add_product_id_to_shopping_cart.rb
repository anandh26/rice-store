class AddProductIdToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :product_did, :string
  end
end
