class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :specification
      t.text :benefit
      t.string :image
      t.string :video
      t.float :price
      t.string :price_actual
      t.integer :rating
      t.boolean :status
      t.boolean :stock
      t.integer :stock_in_kilo
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
