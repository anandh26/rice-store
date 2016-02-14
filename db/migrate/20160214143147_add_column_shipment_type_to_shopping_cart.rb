class AddColumnShipmentTypeToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :shipment_type, :string
  end
end
