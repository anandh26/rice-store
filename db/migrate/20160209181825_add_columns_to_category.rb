class AddColumnsToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :seo_name, :string
    add_column :sub_categories, :seo_name, :string
    add_column :products, :seo_name, :string
  end
end
