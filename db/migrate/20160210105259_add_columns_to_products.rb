class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :category_name, :string
    add_column :products, :sub_category_name, :string
  end
end
