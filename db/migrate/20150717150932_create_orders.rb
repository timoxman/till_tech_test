class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :ordername
      t.integer :tablenumber
      t.integer :numberofcustomers
      t.string :discount

      t.timestamps null: false
    end
  end
end
