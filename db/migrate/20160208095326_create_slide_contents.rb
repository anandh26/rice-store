class CreateSlideContents < ActiveRecord::Migration
  def change
    create_table :slide_contents do |t|
      t.string :title
      t.text :description
      t.text :icon
      t.string :image
      t.integer :rank
      t.boolean :status

      t.timestamps null: false
    end
  end
end
