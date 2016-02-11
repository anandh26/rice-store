class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.string :unique_id
      t.string :discount_coupon
      t.integer :discount_percentage
      t.integer :total_items
      t.float :sub_total
      t.float :total
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.string :user_name
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :additional_info
      t.string :payment_type
      t.boolean :status

      t.timestamps null: false
    end
  end
end
