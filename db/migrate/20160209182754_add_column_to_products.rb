class AddColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_fixed_rate, :boolean
  end
end
