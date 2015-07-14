class AddPricelistIdToPrices < ActiveRecord::Migration
  def change
    add_reference :prices, :pricelist, index: true, foreign_key: true
  end
end
