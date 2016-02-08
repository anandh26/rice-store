class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.text :title
      t.text :description
      t.string :image
      t.string :alt
      t.integer :rank
      t.boolean :status

      t.timestamps null: false
    end
  end
end
