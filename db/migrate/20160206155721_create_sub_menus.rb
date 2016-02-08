class CreateSubMenus < ActiveRecord::Migration
  def change
    create_table :sub_menus do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :rank
      t.boolean :status
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
