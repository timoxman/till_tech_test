class CreatePricelists < ActiveRecord::Migration
  def change
    create_table :pricelists do |t|
      t.string :shopName
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
