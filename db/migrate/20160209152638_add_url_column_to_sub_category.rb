class AddUrlColumnToSubCategory < ActiveRecord::Migration
  def change
    add_column :categories, :url, :string
    add_column :sub_categories, :url, :string
  end
end
