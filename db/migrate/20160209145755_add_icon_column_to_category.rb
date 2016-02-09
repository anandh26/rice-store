class AddIconColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :icon, :string
    add_column :categories, :rank, :integer
  end
end
