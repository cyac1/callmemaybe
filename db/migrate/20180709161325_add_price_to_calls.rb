class AddPriceToCalls < ActiveRecord::Migration[5.2]
  def change
    add_monetize :calls, :price, currency: { present: false }
  end
end
