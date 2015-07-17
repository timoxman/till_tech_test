class CreateOrderlines < ActiveRecord::Migration
  def change
    create_table :orderlines do |t|
      t.string :orderitem
      t.integer :quantity
      t.float :linetotal

      t.timestamps null: false
    end
  end
end
