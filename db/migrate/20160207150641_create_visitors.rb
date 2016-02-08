class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :unique_id
      t.string :browser_id
      t.boolean :is_internal
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
