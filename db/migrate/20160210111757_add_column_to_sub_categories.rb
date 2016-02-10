class AddColumnToSubCategories < ActiveRecord::Migration
  def change
    add_column :sub_categories, :category_name, :string
  end
end
