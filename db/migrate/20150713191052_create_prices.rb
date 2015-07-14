class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :item
      t.float :price

      t.timestamps null: false
    end
  end
end
