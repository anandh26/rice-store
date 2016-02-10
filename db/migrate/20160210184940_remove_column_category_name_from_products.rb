class RemoveColumnCategoryNameFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :category_name
  end
end
