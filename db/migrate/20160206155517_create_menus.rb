class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :rank
      t.boolean :status

      t.timestamps null: false
    end
  end
end
