class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password
      t.string :email
      t.boolean :status
      t.boolean :is_internal
      t.string :phone
      t.string :fax
      t.text :address_1
      t.text :address_2
      t.string :city
      t.string :region
      t.integer :postal_code
      t.string :country
      t.string :token
      t.string :user_agent

      t.timestamps null: false
    end
  end
end
