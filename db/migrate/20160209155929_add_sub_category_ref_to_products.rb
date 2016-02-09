class AddSubCategoryRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :sub_category, index: true, foreign_key: true
    remove_column :products, :category_id
  end
end
