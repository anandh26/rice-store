class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :title
      t.text :teaser
      t.text :description
      t.boolean :status
      t.integer :rank
      t.text :icon
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
