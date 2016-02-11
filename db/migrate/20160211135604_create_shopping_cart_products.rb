class CreateShoppingCartProducts < ActiveRecord::Migration
  def change
    create_table :shopping_cart_products do |t|
      t.string :product_title
      t.text :product_description
      t.float :price
      t.integer :quantity
      t.float :total
      t.boolean :status
      t.references :shopping_cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
