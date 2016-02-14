class AddPointToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :points, :integer
  end
end
