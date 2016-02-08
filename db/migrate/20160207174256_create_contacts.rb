class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message
      t.boolean :is_internal
      t.boolean :status

      t.timestamps null: false
    end
  end
end
