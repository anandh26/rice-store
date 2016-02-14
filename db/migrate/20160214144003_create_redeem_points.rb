class CreateRedeemPoints < ActiveRecord::Migration
  def change
    create_table :redeem_points do |t|
      t.string :email
      t.integer :point
      t.integer :point_used
      t.boolean :status

      t.timestamps null: false
    end
  end
end
